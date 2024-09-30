part of 'anime_manip_cubit.dart';

mixin AnimeManipState on Equatable {}

class InitializingAnimeManipState extends CubitSuccessState
    with AnimeManipState {
  final Anime anime;

  const InitializingAnimeManipState(this.anime);

  @override
  List<Object?> get props => [anime];
}

class AnimeManipWatchlistLoadingState extends CubitLoadingState
    with AnimeManipState {
  const AnimeManipWatchlistLoadingState() : super();
}

class AnimeManipViewedLoadingState extends CubitLoadingState
    with AnimeManipState {
  const AnimeManipViewedLoadingState() : super();
}

class WatchListAddSuccesState extends CubitInformationState
    with AnimeManipState {
  WatchListAddSuccesState();
}

class AnimeViewedAddSuccesState extends CubitInformationState
    with AnimeManipState {
  AnimeViewedAddSuccesState();
}

class AnimeManipErrorState extends CubitErrorState with AnimeManipState {
  AnimeManipErrorState(super.error, [super.trace]);
}
