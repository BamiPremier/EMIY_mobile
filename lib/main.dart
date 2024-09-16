import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:dio_cache_interceptor/dio_cache_interceptor.dart';
import 'package:potatoes/libs.dart';
import 'package:potatoes/potatoes.dart' hide PreferencesService;
import 'package:umai/account/screens/account.dart';
import 'package:umai/auth/bloc/category_anime_cubit.dart';
import 'package:umai/auth/bloc/follow_user_cubit.dart';
import 'package:umai/auth/bloc/preference_user_cubit.dart';
import 'package:umai/auth/screens/registrationuser/registration_username.dart';
import 'package:umai/auth/services/preference_user_service.dart';
import 'package:umai/firebase_options.dart';
import 'package:umai/auth/bloc/signin_cubit.dart';
import 'package:umai/auth/screens/onboarding.dart';
import 'package:umai/auth/services/auth_service.dart';
import 'package:umai/common/bloc/user_cubit.dart';
import 'package:umai/common/screens/splash.dart';
import 'package:umai/common/services/api_service.dart';
import 'package:umai/common/services/preferences_service.dart';
import 'package:umai/common/services/user_service.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:umai/home_screen.dart';
import 'package:umai/utils/themes.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final SharedPreferences preferences = await SharedPreferences.getInstance();
  final cacheOptions = await cacheStoreOptions();
  Links.instance = const ApiLinks();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  FirebaseCrashlytics.instance.setCrashlyticsCollectionEnabled(kReleaseMode);
  CubitErrorState.stream().listen((state) {
    FirebaseCrashlytics.instance.recordError(state.error, state.trace);
  });
  FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterError;
  PlatformDispatcher.instance.onError = (Object error, StackTrace trace) {
    FirebaseCrashlytics.instance.recordError(error, trace);
    return true;
  };
  runApp(Phoenix(
    child: MyApp(
      navigatorKey: GlobalKey(),
      preferences: preferences,
      cacheOptions: cacheOptions,
    ),
  ));
}

class MyApp extends StatelessWidget {
  final GlobalKey<NavigatorState> navigatorKey;
  final SharedPreferences preferences;
  final CacheOptions cacheOptions;

  const MyApp(
      {required this.navigatorKey,
      required this.preferences,
      required this.cacheOptions,
      super.key});

  @override
  Widget build(BuildContext context) {
    final preferencesService = PreferencesService(
      preferences,
    );

    final Dio dio = DioClient.instance(
      preferencesService,
      baseUrl: const ApiLinks().productionUrl,
      connectTimeout: const Duration(minutes: 1),
    );
    dio.interceptors.add(DioCacheInterceptor(options: cacheOptions));

    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(create: (_) => AuthService(dio)),
        RepositoryProvider(create: (_) => PreferenceUserService(dio)),
        RepositoryProvider(create: (_) => UserService(dio)),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
              create: (context) => UserCubit(
                    context.read(),
                    preferencesService,
                  )),
          BlocProvider(
              create: (context) =>
                  PreferenceUserCubit(context.read(), context.read())),
          BlocProvider(
              create: (context) => SignInCubit(context.read(), context.read())),
          BlocProvider(
              create: (context) => FollowUserCubit(
                    context.read(),
                  )),
          BlocProvider(create: (context) => CategoryAnimeCubit(context.read())),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Umai',
          theme: ThemeApp.lightTheme(context),
          themeMode: ThemeMode.light,
          locale: const Locale.fromSubtags(languageCode: 'fr'),
          supportedLocales: const [Locale.fromSubtags(languageCode: 'fr')],
          localizationsDelegates: const [
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          builder: (context, child) => BlocListener<UserCubit, UserState>(
            listenWhen: (previous, state) =>
                previous is UserLoggingOut && state is UserNotLoggedState,
            listener: (_, state) {
              // recharge l'app quelque soit l'étape dans l'appli
              if (state is UserNotLoggedState) {
                Future.delayed(
                    const Duration(milliseconds: 100),
                    // ignore: use_build_context_synchronously
                    () => Phoenix.rebirth(context));
              }
            },
            child: child,
          ),
          home: Builder(builder: (context) {
            final splashScreen =
                SplashScreen(onFutureCompleted: (BuildContext context) {
              Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(builder: (_) => const OnboardingScreen()),
                  (route) => false);
            });

            return BlocBuilder<UserCubit, UserState>(
              buildWhen: (previous, _) => previous is InitializingUserState,
              builder: (context, state) {
                if (state is UserNotLoggedState) return splashScreen;
                if (state is UserLoggedState) return const HomeScreen();
                if (state is CompleteUserProfileState)
                  return const RegistrationUsernameScreen();
                if (state is InitializingUserState) return const SizedBox();

                return splashScreen;
              },
            );
          }),
        ),
      ),
    );
  }
}
