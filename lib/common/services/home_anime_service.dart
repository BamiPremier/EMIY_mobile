import 'package:flutter/material.dart';
import 'package:potatoes/libs.dart';
import 'package:umai/animes/bloc/category_anime_cubit.dart';
import 'package:umai/animes/widgets/anime_block.dart';

class HomeAnimeService {
  late final CategoryAnimeCubit trendingCubit;
  late final CategoryAnimeCubit nextSeasonCubit;
  late final CategoryAnimeCubit allCubit;

  HomeAnimeService(BuildContext context) {
    trendingCubit = CategoryAnimeCubit(
        context.read(), context.read(), AnimeBlockFilter.trending.name, null);

    nextSeasonCubit = CategoryAnimeCubit(
        context.read(), context.read(), AnimeBlockFilter.nextSeason.name, null);

    allCubit = CategoryAnimeCubit(
        context.read(), context.read(), AnimeBlockFilter.all.name, 15);
  }

  void refresh() {
    trendingCubit.reset();
    nextSeasonCubit.reset();
    allCubit.reset();
  }

  void dispose() {
    trendingCubit.close();
    nextSeasonCubit.close();
    allCubit.close();
  }
}
