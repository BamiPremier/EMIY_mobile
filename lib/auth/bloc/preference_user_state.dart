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
  final List<String> Genre;
  final List<AnimeResponse> anime;
  final List<FollowerResponse> follow;

  SelectedPrefenceUserState(this.Genre, this.anime, this.follow);

  @override
  List<Object?> get props => [Genre, anime, follow];
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

class GenreIdleState extends CubitSuccessState with PreferenceUserState {
  const GenreIdleState();

  @override
  List<Object?> get props => [identityHashCode(this)];
}

class GenreLoadingState extends CubitLoadingState with PreferenceUserState {
  const GenreLoadingState();
}

class GenreSuccessLoadedState extends CubitInformationState
    with PreferenceUserState {
  final GenreAnime  genre;

  GenreSuccessLoadedState(
    this.genre,
  );

  @override
  List<Object?> get props => [
        genre,
      ];
}

class GenreErrorState extends CubitErrorState with PreferenceUserState {
  GenreErrorState(super.error, [super.trace]);
}

// WatchList
class WatchListIdleState extends CubitSuccessState with PreferenceUserState {
  const WatchListIdleState();

  @override
  List<Object?> get props => [identityHashCode(this)];
}

class WatchListSelectAnimeState extends CubitSuccessState
    with PreferenceUserState {
  final List<String> anime;

  WatchListSelectAnimeState(this.anime);

  @override
  List<Object?> get props => [anime];
}

class WatchListAddLoadingState extends CubitLoadingState
    with PreferenceUserState {
  const WatchListAddLoadingState();
}

class WatchListAddSuccesState extends CubitInformationState
    with PreferenceUserState {
  WatchListAddSuccesState();
}

class WatchListAddErrorState extends CubitErrorState with PreferenceUserState {
  WatchListAddErrorState(super.error, [super.trace]);
}

// AnimeViewed
class AnimeViewedIdleState extends CubitSuccessState with PreferenceUserState {
  const AnimeViewedIdleState();

  @override
  List<Object?> get props => [identityHashCode(this)];
}

class AnimeViewedSelectAnimeState extends CubitSuccessState
    with PreferenceUserState {
  final List<String> anime;

  AnimeViewedSelectAnimeState(this.anime);

  @override
  List<Object?> get props => [anime];
}

class AnimeViewedAddLoadingState extends CubitLoadingState
    with PreferenceUserState {
  const AnimeViewedAddLoadingState();
}

class AnimeViewedAddSuccesState extends CubitInformationState
    with PreferenceUserState {
  AnimeViewedAddSuccesState();
}

class AnimeViewedAddErrorState extends CubitErrorState
    with PreferenceUserState {
  AnimeViewedAddErrorState(super.error, [super.trace]);
}

// Follower
class FollowerIdleState extends CubitSuccessState with PreferenceUserState {
  const FollowerIdleState();

  @override
  List<Object?> get props => [identityHashCode(this)];
}

class SelectFollowerState extends CubitSuccessState with PreferenceUserState {
  final List<String> followers;

  SelectFollowerState(this.followers);

  @override
  List<Object?> get props => [followers];
}

class FollowerAddLoadingState extends CubitLoadingState
    with PreferenceUserState {
  const FollowerAddLoadingState();
}

class FollowerAddSuccessState extends CubitInformationState
    with PreferenceUserState {
  final User user;
  FollowerAddSuccessState(this.user);

  @override
  List<Object?> get props => [user];
}

class FollowerAddErrorState extends CubitErrorState with PreferenceUserState {
  FollowerAddErrorState(super.error, [super.trace]);
}
