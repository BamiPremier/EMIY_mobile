part of 'new_post_cubit.dart';

mixin NewPostState on Equatable {}

class NewPostIdleState extends CubitSuccessState with NewPostState {
  const NewPostIdleState();

  @override
  List<Object?> get props => [identityHashCode(this)];
}

class NewPostUploadingState extends CubitLoadingState with NewPostState {
  const NewPostUploadingState();
}

class NewPostUploadedState extends CubitInformationState with NewPostState {
  final Post post;

  const NewPostUploadedState(this.post);
  @override
  List<Object?> get props => [...super.props, post];
}

class NewPostErrorState extends CubitErrorState with NewPostState {
  NewPostErrorState(super.error, [super.trace]);
}
