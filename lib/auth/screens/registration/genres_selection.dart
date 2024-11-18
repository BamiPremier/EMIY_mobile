import 'package:flutter/material.dart';
import 'package:potatoes/auto_content/widgets/auto_content_view.dart';
import 'package:potatoes/common/widgets/loaders.dart';
import 'package:potatoes/libs.dart';
import 'package:umai/auth/bloc/genre_cubit.dart';
import 'package:umai/auth/screens/registration/anime_viewed.dart';
import 'package:umai/auth/screens/registration/anime_watchlist.dart';
import 'package:umai/common/bloc/user_cubit.dart';
import 'package:umai/common/widgets/buttons.dart';
import 'package:umai/utils/dialogs.dart';

class RegistrationGenresSelection extends StatefulWidget {
  const RegistrationGenresSelection({super.key});

  @override
  State<RegistrationGenresSelection> createState() =>
      _RegistrationGenresSelectionState();
}

class _RegistrationGenresSelectionState
    extends State<RegistrationGenresSelection> with CompletableMixin {
  late final genresCubit = GenresListCubit(context.read());
  late final userCubit = context.read<UserCubit>();
  @override
  void dispose() {
    genresCubit.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<UserCubit, UserState>(
        listener: onEventReceived,
        child: Scaffold(
          appBar: AppBar(title: const Text("C'est quoi ton style?")),
          body: SafeArea(
            minimum: const EdgeInsets.only(bottom: 48.0),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: ListView(
                children: [
                  Text(
                      'Quels genres d’animes préfères-tu? Tu recevras une sélection de recommandation en fonction de ces choix',
                      style: Theme.of(context).textTheme.bodySmall),
                  const SizedBox(height: 16.0),
                  AutoContentView.get<List<String>>(
                      cubit: genresCubit,
                      autoManage: false,
                      loadingBuilder: (_) => Container(
                          alignment: Alignment.center,
                          padding: const EdgeInsets.only(top: 80.0),
                          child: const CircularProgressIndicator()),
                      builder: (context, categories) {
                        return Wrap(
                          spacing: 8.0,
                          children: categories.map((genre) {
                            final isSelected =
                                genresCubit.isGenreSelected(genre);
                            return FilterChip(
                              label: Text(genre),
                              labelStyle: Theme.of(context)
                                  .textTheme
                                  .labelLarge!
                                  .copyWith(fontWeight: FontWeight.normal),
                              selected: isSelected,
                              side: isSelected ? BorderSide.none : null,
                              onSelected: (selected) {
                                genresCubit.selectGenre(genre);
                              },
                              showCheckmark: false,
                              avatar:
                                  isSelected ? const Icon(Icons.remove) : null,
                              deleteIcon: const Icon(Icons.remove),
                            );
                          }).toList(),
                        );
                      })
                ],
              ),
            ),
          ),
          bottomNavigationBar: BlocProvider.value(
            value: genresCubit,
            child:
                BlocBuilder<GenresListCubit, GenreState>(builder: (context, _) {
              return SafeArea(
                minimum: const EdgeInsets.symmetric(
                    horizontal: 32.0, vertical: 16.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    UmaiButton.primary(
                      onPressed: nextButtonAction,
                      text: "Continuer",
                    ),
                  ],
                ),
              );
            }),
          ),
        ));
  }

  VoidCallback? get nextButtonAction {
    if (genresCubit.state is GenreReadyWithSelectionState) {
      final state = genresCubit.state as GenreReadyWithSelectionState;
      if (state.selectedCategories.isNotEmpty) {
        return () {
          userCubit.updateUser(genres: state.selectedCategories);
        };
      }
    }
    return null;
  }

  void onEventReceived(BuildContext context, UserState state) async {
    await waitForDialog();

    if (state is UserUpdatingState) {
      loadingDialogCompleter = showLoadingBarrier(context: context);
    } else if (state is UserUpdatedState) {
      Navigator.of(context).push(
        MaterialPageRoute(
            builder: (context) =>
                  RegistrationAnimeWatchlist.init(context: context)),
      );
    } else if (state is UserErrorState) {
      showErrorToast(content: state.error, context: context);
    }
  }
}
