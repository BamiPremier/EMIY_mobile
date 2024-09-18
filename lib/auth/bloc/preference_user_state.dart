part of 'preference_user_cubit.dart';

mixin PreferenceUserState on Equatable {}

class PreferenceUserIdleState extends CubitSuccessState
    with PreferenceUserState {
  const PreferenceUserIdleState();

  @override
  List<Object?> get props => [identityHashCode(this)];

  @override
  // TODO: implement stringify
  bool? get stringify => throw UnimplementedError();
}

class SelectedPrefenceUserState extends CubitSuccessState
    with PreferenceUserState {
  final List<String> category;
  final List<AnimeResponse> anime;
  final List<FollowerResponse> follow;

  SelectedPrefenceUserState(this.category, this.anime, this.follow);

  @override
  List<Object?> get props => [category, anime, follow];
}

class PreferenceUserLoadingState extends CubitLoadingState
    with PreferenceUserState {
  const PreferenceUserLoadingState();
}

class PreferenceUserSuccessState extends CubitInformationState
    with PreferenceUserState {
  const PreferenceUserSuccessState();
}

class PreferenceUserMissingSupplierInformation extends CubitInformationState
    with PreferenceUserState {
  const PreferenceUserMissingSupplierInformation();
}

class PreferenceUserErrorState extends CubitErrorState
    with PreferenceUserState {
  PreferenceUserErrorState(super.error, [super.trace]);
}

class CategoryIdleState extends CubitSuccessState with PreferenceUserState {
  const CategoryIdleState();

  @override
  List<Object?> get props => [identityHashCode(this)];
}

class CategoryLoadingState extends CubitLoadingState with PreferenceUserState {
  const CategoryLoadingState();
}

class CategorySuccessLoadedState extends CubitInformationState
    with PreferenceUserState {
  final CategoryAnimeResponse category;

  CategorySuccessLoadedState(
    this.category,
  );

  @override
  List<Object?> get props => [
        category,
      ];
}

class CategoryErrorState extends CubitErrorState with PreferenceUserState {
  CategoryErrorState(super.error, [super.trace]);
}
