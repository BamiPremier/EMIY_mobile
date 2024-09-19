import 'package:potatoes/auto_list/widgets/auto_list_view.dart';
import 'package:potatoes/libs.dart';
import 'package:potatoes/potatoes.dart';
import 'package:umai/auth/bloc/auth_cubit.dart';
import 'package:umai/auth/bloc/preference_user_cubit.dart';
import 'package:umai/auth/models/category_anime_response.dart';
import 'package:umai/auth/screens/registrationuser/registration_anime_selection_screen.dart';
import 'package:umai/common/widgets/buttons.dart';
import 'package:flutter/material.dart';
import 'package:umai/utils/themes.dart';

class RegistrationPrefferedScreen extends StatefulWidget {
  const RegistrationPrefferedScreen({super.key});

  @override
  State<RegistrationPrefferedScreen> createState() =>
      _RegistrationPrefferedScreenState();
}

class _RegistrationPrefferedScreenState
    extends State<RegistrationPrefferedScreen> with CompletableMixin {
  late final PreferenceUserCubit preferenceUserCubit;
  List<String> categories = [];
  @override
  void initState() {
    super.initState();
    preferenceUserCubit = context.read<PreferenceUserCubit>();
    preferenceUserCubit.getCategories().then((value) {
      setState(() {
        categories = value.genres;
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PreferenceUserCubit, PreferenceUserState>(
        builder: (context, state) {
      return Scaffold(
        appBar: AppBar(
            title: const Text(
          "Tu regardes quoi?",
        )),
        body: SafeArea(
          minimum: const EdgeInsets.only(bottom: 48),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(children: [
              Container(
                  margin: const EdgeInsets.only(top: 8, bottom: 16),
                  child: Text(
                      'Quels genres d’animes préfères-tu? Tu recevras une sélection de recommandation en fonction de ces choix',
                      style: Theme.of(context).textTheme.bodySmall)),
              BlocBuilder<PreferenceUserCubit, PreferenceUserState>(
                builder: (context, state) {
                  if (state is CategoryLoadingState) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  return Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: categories.map((item) {
                      return BlocBuilder<PreferenceUserCubit,
                          PreferenceUserState>(
                        builder: (context, state) {
                          final isSelected =
                              state is SelectedPrefenceUserState &&
                                  state.category
                                      .any((category) => category == item);
                          return FilterChip(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 16.0, vertical: 6.0),
                            label: Text(item),
                            labelStyle: Theme.of(context)
                                .textTheme
                                .labelLarge!
                                .copyWith(fontWeight: FontWeight.normal),
                            selected: isSelected,
                            side: isSelected ? BorderSide.none : null,
                            onSelected: (selected) {
                              context
                                  .read<PreferenceUserCubit>()
                                  .selectCategory(item);
                            },
                            showCheckmark: false,
                            avatar:
                                isSelected ? const Icon(Icons.remove) : null,
                            deleteIcon: const Icon(Icons.remove),
                          );
                        },
                      );
                    }).toList(),
                  );
                },
              ),
            ]),
          ),
        ),
        bottomNavigationBar: Container(
          color: Theme.of(context).bottomNavigationBarTheme.backgroundColor,
          child: SafeArea(
            minimum:
                const EdgeInsets.symmetric(horizontal: 32.0, vertical: 16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                UmaiButton.primary(
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                          builder: (context) =>
                              RegistrationAnimeSelectionScreen.get(
                                context: context,
                                listCategory:
                                    (state as SelectedPrefenceUserState)
                                        .category,
                              )),
                    );
                  },
                  text: "Continuer",
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
