import 'package:flutter/material.dart';
import 'package:potatoes/common/widgets/loaders.dart';
import 'package:potatoes/libs.dart';
import 'package:potatoes/potatoes.dart';
import 'package:umai/account/screens/account.dart';
import 'package:umai/account/screens/person_account.dart';
import 'package:umai/animes/bloc/load_episode_anime_cubit.dart';
import 'package:umai/animes/screens/anime_details.dart';
import 'package:umai/animes/screens/home.dart';
import 'package:umai/animes/widgets/episode_head.dart';
import 'package:umai/common/bloc/link_cubit.dart';
import 'package:umai/common/bloc/notification_cubit.dart';
import 'package:umai/common/screens/common_details.dart';
import 'package:umai/common/services/notification_service.dart';
import 'package:umai/common/widgets/profile_picture.dart';
import 'package:umai/common/widgets/search_widget.dart';
import 'package:umai/quiz/screens/home.dart';
import 'package:umai/quiz/screens/quiz_details.dart';
import 'package:umai/social/screens/home.dart';
import 'package:umai/social/widgets/head_post.dart';
import 'package:umai/utils/assets.dart';
import 'package:umai/utils/svg_utils.dart';
import 'package:umai/utils/themes.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with CompletableMixin {
  static const int _mainPageIndex = 0;
  final pages = const [
    {'title': 'Social', 'page': SocialHomeScreen()},
    {'title': 'Actu', 'page': SizedBox()},
    {'title': 'Animes', 'page': AnimeHomeScreen()},
    {'title': 'Quiz', 'page': QuizHomeScreen()},
  ];
  final pageController = PageController(initialPage: _mainPageIndex);
  int index = 0;

  void setPage([int value = _mainPageIndex]) {
    setState(() {
      pageController.jumpToPage(value);
      index = value;
    });
  }

  @override
  void initState() {
    super.initState();
    context.read<NotificationService>().context = context;
    context.read<NotificationCubit>().requestNotificationPermission();
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: index == _mainPageIndex,
      onPopInvokedWithResult: (bool didPop, dynamic result) {
        if (!didPop) setPage();
      },
      child: BlocListener<LinkCubit, LinkState>(
        listener: onEventReceived,
        child: BlocListener<NotificationCubit, NotificationState>(
          listener: onNotificationReceived,
          child: Scaffold(
            appBar: AppBar(
              forceMaterialTransparency: true,
              title: Text(pages[index]['title'] as String),
              centerTitle: true,
              systemOverlayStyle:
                  Theme.of(context).appBarTheme.systemOverlayStyle?.copyWith(
                        systemNavigationBarColor: Theme.of(context)
                            .bottomNavigationBarTheme
                            .backgroundColor,
                        systemNavigationBarDividerColor: Theme.of(context)
                            .bottomNavigationBarTheme
                            .backgroundColor,
                      ),
              leading: GestureDetector(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const AccountScreen()));
                },
                child: const Row(
                    children: [SizedBox(width: 16.0), UserProfilePicture()]),
              ),
              actions: [SearchWidget(index: index)],
            ),
            body: PageView(
              controller: pageController,
              onPageChanged: (value) => setState(() => index = value),
              children: pages.map((page) => page['page'] as Widget).toList(),
            ),
            bottomNavigationBar: BottomNavigationBar(
              onTap: setPage,
              currentIndex: index,
              useLegacyColorScheme: false,
              items: <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                  icon: _buildIconWithDecoration(
                      icon: Assets.iconsNotification, selected: index == 0),
                  label: pages[0]['title'] as String,
                  backgroundColor: Theme.of(context)
                    .bottomNavigationBarTheme.backgroundColor
                ),
                BottomNavigationBarItem(
                  icon: _buildIconWithDecoration(
                      icon: Assets.iconsUmai, selected: index == 1),
                  label: pages[1]['title'] as String,
                  backgroundColor: Theme.of(context)
                    .bottomNavigationBarTheme.backgroundColor
                ),
                BottomNavigationBarItem(
                  icon: _buildIconWithDecoration(
                      icon: Assets.iconsTrending, selected: index == 2),
                  label: pages[2]['title'] as String,
                  backgroundColor: Theme.of(context)
                    .bottomNavigationBarTheme.backgroundColor
                ),
                BottomNavigationBarItem(
                  icon: _buildIconWithDecoration(
                      icon: Assets.iconsQuiz, selected: index == 3),
                  label: pages[3]['title'] as String,
                  backgroundColor: Theme.of(context)
                    .bottomNavigationBarTheme.backgroundColor
                ),
                BottomNavigationBarItem(
                  icon: _buildIconWithDecoration(
                      icon: Assets.iconsQuiz, selected: index == 4),
                  label: pages[4]['title'] as String,
                  backgroundColor: Theme.of(context)
                    .bottomNavigationBarTheme.backgroundColor
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void onEventReceived(BuildContext context, LinkState state) async {
    await waitForDialog();
    if (state is LinkLoading) {
      loadingDialogCompleter = showLoadingBarrier(context: context);
    } else if (state is PersonLinkLoaded) {
      Navigator.of(context).push(MaterialPageRoute(
          builder: (context) =>
              PersonAccountScreen.get(context: context, user: state.user)));
    } else if (state is PostLinkLoaded) {
      Navigator.of(context).push(
        MaterialPageRoute(
            builder: (context) => CommonDetailsScreen.fromPost(
                context: context,
                post: state.post,
                head: (context) => const HeadPost())),
      );
    } else if (state is AnimeLinkLoaded) {
      Navigator.of(context).push(MaterialPageRoute(
          builder: (_) =>
              AnimeDetailScreen.get(context: context, anime: state.anime)));
    } else if (state is EpisodeLinkLoaded) {
      Navigator.of(context).push(
        MaterialPageRoute(
            builder: (context) => CommonDetailsScreen.fromEpisode(
                context: context,
                episode: state.episode,
                loadEpisodeAnimeCubit: LoadEpisodeAnimeCubit(context.read(),
                    context.read(), state.episode.id.toString()),
                head: (context) => const EpisodeHead())),
      );
    } else if (state is QuizLinkLoaded) {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (_) =>
              QuizDetailScreen.get(context: context, quiz: state.quiz),
          settings: const RouteSettings(name: quizRouteName),
        ),
      );
    }
  }

  void onNotificationReceived(
      BuildContext context, NotificationState state) async {
    await waitForDialog();
    if (state is NotificationLoading) {
      loadingDialogCompleter = showLoadingBarrier(context: context);
    } else if (state is UserNotificationLoaded) {
      Navigator.of(context).push(MaterialPageRoute(
          builder: (context) =>
              PersonAccountScreen.get(context: context, user: state.user)));
    } else if (state is PostNotificationLoaded) {
      Navigator.of(context).push(
        MaterialPageRoute(
            builder: (context) => CommonDetailsScreen.fromPost(
                context: context,
                post: state.post,
                head: (context) => const HeadPost())),
      );
    } else if (state is AnimeNotificationLoaded) {
      Navigator.of(context).push(MaterialPageRoute(
          builder: (_) =>
              AnimeDetailScreen.get(context: context, anime: state.anime)));
    } else if (state is EpisodeNotificationLoaded) {
      Navigator.of(context).push(
        MaterialPageRoute(
            builder: (context) => CommonDetailsScreen.fromEpisode(
                context: context,
                episode: state.episode,
                loadEpisodeAnimeCubit: LoadEpisodeAnimeCubit(context.read(),
                    context.read(), state.episode.id.toString()),
                head: (context) => const EpisodeHead())),
      );
    } else if (state is QuizNotificationLoaded) {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (_) =>
              QuizDetailScreen.get(context: context, quiz: state.quiz),
          settings: const RouteSettings(name: quizRouteName),
        ),
      );
    }
  }

  Widget _buildIconWithDecoration({required icon, required bool selected}) {
    return Container(
        margin: const EdgeInsets.only(bottom: 4.0),
        padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 20),
        decoration: selected
            ? BoxDecoration(
                color: Theme.of(context).colorScheme.primary,
                borderRadius: BorderRadius.circular(16))
            : null,
        child: toSvgIcon(
          icon: icon,
          color: selected
              ? Theme.of(context).bottomNavigationBarTheme.selectedItemColor
              : Theme.of(context).bottomNavigationBarTheme.unselectedItemColor,
          size: 24,
        ));
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }
}
