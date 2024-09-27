import 'package:flutter/material.dart';
import 'package:potatoes/auto_content/widgets/auto_content_view.dart';
import 'package:potatoes/libs.dart';
import 'package:umai/auth/bloc/genre_cubit.dart';
import 'package:umai/auth/screens/registration/anime_selection.dart';
import 'package:umai/common/widgets/buttons.dart';

class GenresSelectionScreen extends StatefulWidget {
  const GenresSelectionScreen({super.key});

  @override
  State<GenresSelectionScreen> createState() =>
      _GenresSelectionScreenState();
}

class _GenresSelectionScreenState extends State<GenresSelectionScreen> {
  late final genresCubit = GenresListCubit(context.read());

  @override
  void dispose() {
    genresCubit.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Tu regardes quoi?")
      ),
      body: SafeArea(
        minimum: const EdgeInsets.only(bottom: 48.0),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: ListView(
            children: [
              Text(
                'Quels genres d’animes préfères-tu? Tu recevras une sélection de recommandation en fonction de ces choix',
                style: Theme.of(context).textTheme.bodySmall
              ),
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
                      final isSelected = genresCubit.isGenreSelected(genre);
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
                        avatar: isSelected ? const Icon(Icons.remove) : null,
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
        child: BlocBuilder<GenresListCubit, GenreState>(
          builder: (context, _) {
            return Container(
              color: Theme.of(context).bottomNavigationBarTheme.backgroundColor,
              child: SafeArea(
                minimum:
                const EdgeInsets.symmetric(horizontal: 32.0, vertical: 16.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    UmaiButton.primary(
                      onPressed: nextButtonAction,
                      text: "Continuer",
                    ),
                  ],
                ),
              ),
            );
          }
        ),
      ),
    );
  }

  VoidCallback? get nextButtonAction {
    if (genresCubit.state is GenreReadyWithSelectionState) {
      final state = genresCubit.state as GenreReadyWithSelectionState;
      if (state.selectedCategories.isNotEmpty) {
        return () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) =>
                RegistrationAnimeSelectionScreen(listGenre: state.selectedCategories),
            ),
          );
        };
      }
    }
    return null;
  }
}
