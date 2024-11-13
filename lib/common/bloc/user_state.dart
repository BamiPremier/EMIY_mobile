part of 'user_cubit.dart';

mixin UserState on Equatable {}

class InitializingUserState extends CubitLoadingState with UserState {
  const InitializingUserState() : super();
}

class UserNotLoggedState extends CubitSuccessState with UserState {
  const UserNotLoggedState() : super();

  @override
  List<Object?> get props => [identityHashCode(this)];
}

class UserLoggedState extends CubitSuccessState with UserState {
  final User user;

  const UserLoggedState(this.user) : super();

  @override
  List<Object?> get props => [user];
}

class UserLoadingState extends CubitLoadingState with UserState {
  const UserLoadingState() : super();
}

class UserLoggingOut extends CubitLoadingState with UserState {
  const UserLoggingOut() : super();
}

class CompleteUserProfileState extends CubitInformationState with UserState {
  const CompleteUserProfileState();
}

class UserDeleting extends CubitLoadingState with UserState {
  const UserDeleting() : super();
}

class UserUpdatingState extends CubitLoadingState with UserState {
  const UserUpdatingState() : super();
}

class UserUpdatedState extends CubitInformationState with UserState {
  const UserUpdatedState() : super();
}

class UserErrorState extends CubitErrorState with UserState {
  UserErrorState(super.error, [super.trace]);
}

class ShareUserLoadingState extends CubitLoadingState with UserState {
  const ShareUserLoadingState() : super();
}

class ShareUserSuccessState extends CubitInformationState with UserState {
  final String shareLink;

  const ShareUserSuccessState(this.shareLink);

  @override
  List<Object?> get props => [shareLink];
}
