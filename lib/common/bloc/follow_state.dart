part of 'follow_cubit.dart';

mixin FollowState on Equatable {}

class InitializingFollowState extends CubitSuccessState with FollowState {
  final User user;

  const InitializingFollowState(this.user);

  @override
  List<Object?> get props => [user];
}

class FollowLoadingState extends CubitLoadingState with FollowState {
  const FollowLoadingState() : super();
}

class FollowErrorState extends CubitErrorState with FollowState {
  FollowErrorState(super.error, [super.trace]);
}
