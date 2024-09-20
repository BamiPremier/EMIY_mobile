part of 'anime_cubit.dart';

mixin AnimeState on Equatable {}

class AnimeIdleState extends CubitSuccessState with AnimeState {
  const AnimeIdleState();

  @override
  List<Object?> get props => [identityHashCode(this)];
}
