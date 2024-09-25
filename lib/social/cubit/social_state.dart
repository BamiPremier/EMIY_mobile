part of 'social_cubit.dart';

mixin SocialState on Equatable {}

class SocialIdleState extends CubitSuccessState with SocialState {
  const SocialIdleState();

  @override
  List<Object?> get props => [identityHashCode(this)];
}

class NewPostLoadingState extends CubitLoadingState with SocialState {
  const NewPostLoadingState();
}

class NewPostSuccessState extends CubitInformationState with SocialState {
  const NewPostSuccessState();
}

class NewPostErrorState extends CubitErrorState with SocialState {
  NewPostErrorState(super.error, [super.trace]);
}
 