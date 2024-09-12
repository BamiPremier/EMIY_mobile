import 'package:umai/auth/services/auth_service.dart';
import 'package:umai/common/bloc/user_cubit.dart';
import 'package:potatoes/libs.dart';
import 'package:potatoes/potatoes.dart';

part 'signin_state.dart';

class SignInCubit extends Cubit<SignInState> {
  final UserCubit userCubit;
  final AuthService authService;

  SignInCubit(this.userCubit, this.authService)
      : super(const SignInIdleState());
 

  void socialLogin(
      {String? provider,
      String? email,
      String? token,
      Object? error,
      StackTrace? trace}) {
   
    emit(const SignInIdleState());

    //  authService.login(identifier: identifier, password: password).then(
    //     (response) {
    //   // userCubit.signIn(response.user, response.jwt).then((_) {
    //   //   if (response.subscription != null) {
    //   //     userCubit.preferencesService.saveSubscription(response.subscription!);
    //   //   }

    //   //   if (response.user.userIsSupplier &&
    //   //       (response.user.birthdate == null || response.user.place == null)) {
    //   //     emit(const SignInMissingSupplierInformation());
    //   //   } else {
    //   //     emit(const SignInSuccessState());
    //   //   }
    //   //   emit(stateBefore);
    //   // });
    // }, onError: (error, trace) {
    //   emit(SignInErrorState(error, trace));
    //   emit(stateBefore);
    // });
  }
}
