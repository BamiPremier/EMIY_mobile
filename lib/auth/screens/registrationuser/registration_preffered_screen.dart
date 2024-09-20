import 'package:potatoes/auto_content/bloc/auto_content_cubit.dart';
import 'package:potatoes/auto_content/widgets/auto_content_view.dart';
import 'package:potatoes/libs.dart';
import 'package:potatoes/potatoes.dart';
import 'package:umai/auth/bloc/categorie_cubit.dart';
import 'package:umai/auth/bloc/preference_user_cubit.dart';
import 'package:umai/auth/screens/registrationuser/registration_anime_selection_screen.dart';
import 'package:umai/common/widgets/buttons.dart';
import 'package:flutter/material.dart';
import 'package:umai/utils/dialogs.dart';

class RegistrationPrefferedScreen extends StatefulWidget {
  const RegistrationPrefferedScreen({super.key});

  @override
  State<RegistrationPrefferedScreen> createState() =>
      _RegistrationPrefferedScreenState();
}

class _RegistrationPrefferedScreenState
    extends State<RegistrationPrefferedScreen> with WidgetsBindingObserver {
  late final CategorieCubit categorieCubit = context.read<CategorieCubit>();
  late final SelectedCategorieCubit selectedCategorieCubit =
      context.read<SelectedCategorieCubit>();

  @override
  void initState() {
    WidgetsBinding.instance.addObserver(this);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SelectedCategorieCubit, AutoContentState<List<String>>>(
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
              AutoContentView.get<List<String>>(
                  cubit: categorieCubit,
                  autoManage: false,
                  loadingBuilder: (_) => Container(
                      alignment: Alignment.center,
                      padding: const EdgeInsets.only(top: 80.0),
                      child: const CircularProgressIndicator()),
                  builder: (context, categories) {
                    return Wrap(
                      spacing: 8,
                      runSpacing: 8,
                      children: categories.map((category) {
                        final isSelected =
                            selectedCategorieCubit.isCategorySelected(category);

                        return FilterChip(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16.0, vertical: 6.0),
                          label: Text(category),
                          labelStyle: Theme.of(context)
                              .textTheme
                              .labelLarge!
                              .copyWith(fontWeight: FontWeight.normal),
                          selected: isSelected,
                          side: isSelected ? BorderSide.none : null,
                          onSelected: (selected) {
                            selectedCategorieCubit.selectCategory(category);
                          },
                          showCheckmark: false,
                          avatar: isSelected ? const Icon(Icons.remove) : null,
                          deleteIcon: const Icon(Icons.remove),
                        );
                      }).toList(),
                    );
                  })
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
                    selectedCategorieCubit.isEmpty()
                        ? showWarningToast(
                            context: context,
                            content: "Veuillez sélectionner au moins un genre")
                        : Navigator.of(context).push(
                            MaterialPageRoute(
                                builder: (context) =>
                                    RegistrationAnimeSelectionScreen(
                                      listCategory: selectedCategorieCubit
                                          .getSelectedCategories(),
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
