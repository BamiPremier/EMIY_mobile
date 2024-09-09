import 'package:umai/auth/services/auth_service.dart';
import 'package:umai/common/bloc/user_cubit.dart';
import 'package:potatoes/libs.dart';
import 'package:potatoes/potatoes.dart';
import 'package:umai/common/models/user.dart';

part 'signup_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  final UserCubit userCubit;
  final AuthService authService;

  SignUpCubit(this.userCubit, this.authService)
      : super(const SignUpIdleState());

  void signupAsCustomer({
    String? firstName,
    required String lastName,
    required String email,
    required String token,
  }) {
    final stateBefore = state;
    emit(const SignUpLoadingState());
    authService
        .register(
      firstName: firstName,
      lastName: lastName,
      email: email,
      token: token,
    )
        .then((response) {
      emit(SignUpRegisterSuccess(response.user, response.jwt));
    }, onError: (error, trace) {
      emit(SignUpErrorState(error, trace));
      emit(stateBefore);
    });
  }

  void saveUser() {
    if (state is SignUpRegisterSuccess) {
      final stateBefore = state as SignUpRegisterSuccess;
      userCubit.signIn(stateBefore.user, stateBefore.jwt).then((_) {
        emit(const SignUpSuccess());
        emit(const SignUpIdleState());
      });
    }
  }
}
