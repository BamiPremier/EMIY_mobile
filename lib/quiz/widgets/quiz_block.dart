import 'package:flutter/material.dart';
import 'package:flutter_sticky_header/flutter_sticky_header.dart';
import 'package:potatoes/auto_list/widgets/auto_list_view.dart';
import 'package:potatoes/libs.dart';
import 'package:umai/quiz/bloc/load_quiz_cubit.dart';
import 'package:umai/quiz/models/quiz.dart';
import 'package:umai/quiz/widgets/item_quiz.dart';

class QuizBlock extends StatefulWidget {
  final String title;
  final QuizBlockFilter? filter;
  final QuizBlockType type;

  const QuizBlock({super.key, required this.title, required this.filter})
      : type = QuizBlockType.regular;

  const QuizBlock.empty({
    super.key,
    required this.title,
  })  : type = QuizBlockType.empty,
        filter = null;

  const QuizBlock.skinless({
    super.key,
    required this.filter,
  })  : type = QuizBlockType.skinless,
        title = '';

  @override
  State<QuizBlock> createState() => _QuizBlockState();
}

class _QuizBlockState extends State<QuizBlock> {
  late final cubit = LoadQuizCubit(
      context.read(),
      context.read(),
      context.read(),
      widget.filter?.name ?? '',
      widget.type == QuizBlockType.skinless ? 9 : null);

  final gridDelegate = const SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: 3,
      crossAxisSpacing: 2.0,
      mainAxisSpacing: 2.0,
      childAspectRatio: .65);

  Widget headerBuilder(BuildContext context, SliverStickyHeaderState state) {
    return Container(
      alignment: Alignment.centerLeft,
      color: Theme.of(context).colorScheme.surface,
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.all(16.0),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
              color: state.isPinned
                  ? Theme.of(context).colorScheme.tertiaryContainer
                  : Theme.of(context).colorScheme.outline,
              width: 2.0),
          borderRadius: BorderRadius.circular(100),
          color: state.isPinned
              ? Theme.of(context).colorScheme.tertiaryContainer
              : null,
        ),
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 6.0),
        child: Text(widget.title,
            style: Theme.of(context).textTheme.labelLarge!.copyWith(
                color: state.isPinned
                    ? Theme.of(context).colorScheme.onTertiaryContainer
                    : Theme.of(context).colorScheme.onSurfaceVariant)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    switch (widget.type) {
      case QuizBlockType.regular:
        return SliverStickyHeader.builder(
          builder: headerBuilder,
          sliver: SliverToBoxAdapter(
            child: AutoListView.manual<Quiz>(
              cubit: cubit,
              autoManage: false,
              itemBuilder: (context, quiz) =>
                  ItemQuiz.get(context: context, quiz: quiz),
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              errorBuilder: (context, retry) => Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text("Une erreur s'est produite"),
                  TextButton(
                    onPressed: retry,
                    child: const Text("Réessayer"),
                  )
                ],
              ),
              loadingBuilder: widgetBuilder,
              manualLoadMoreBuilder: (ctx, loadMore) => Container(
                margin: const EdgeInsets.only(right: 16.0),
                alignment: Alignment.bottomRight,
                child: TextButton.icon(
                  iconAlignment: IconAlignment.end,
                  style: TextButton.styleFrom(
                    padding: EdgeInsets.zero,
                    textStyle: Theme.of(context).textTheme.labelMedium,
                  ),
                  onPressed: loadMore,
                  icon: const Icon(Icons.keyboard_arrow_down_outlined),
                  label: const Text("Voir plus"),
                ),
              ),
              loadingMoreBuilder: (context) => Container(
                  padding: const EdgeInsets.only(top: 16, bottom: 28)
                      .add(const EdgeInsets.symmetric(horizontal: 16)),
                  child: LinearProgressIndicator(
                    color: Theme.of(context).colorScheme.onTertiaryContainer,
                    backgroundColor:
                        Theme.of(context).colorScheme.tertiaryContainer,
                    borderRadius: BorderRadius.circular(30),
                  )),
            ),
          ),
        );
      case QuizBlockType.empty:
        return SliverStickyHeader.builder(
          builder: headerBuilder,
        );
      case QuizBlockType.skinless:
        return AutoListView.get<Quiz>(
          cubit: cubit,
          autoManage: false,
          itemBuilder: (context, quiz) =>
              ItemQuiz.get(context: context, quiz: quiz),
          errorBuilder: (context, retry) => Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text("Une erreur s'est produite"),
              TextButton(
                onPressed: retry,
                child: const Text("Réessayer"),
              )
            ],
          ),
          loadingBuilder: widgetBuilder,
          loadingMoreBuilder: (context) => Container(
              padding: const EdgeInsets.only(top: 16, bottom: 28)
                  .add(const EdgeInsets.symmetric(horizontal: 16)),
              child: LinearProgressIndicator(
                color: Theme.of(context).colorScheme.onTertiaryContainer,
                backgroundColor:
                    Theme.of(context).colorScheme.tertiaryContainer,
                borderRadius: BorderRadius.circular(30),
              )),
        );
    }
  }

  Widget widgetBuilder(context) => Column(
        children: [
          if (widget.type == QuizBlockType.regular)
            ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (context, index) => Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Container(
                          width: 72,
                          height: 88,
                          color:
                              Theme.of(context).colorScheme.tertiaryContainer,
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              height: 16,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: Theme.of(context)
                                    .colorScheme
                                    .tertiaryContainer,
                                borderRadius: BorderRadius.circular(4),
                              ),
                            ),
                            const SizedBox(height: 8),
                            Container(
                              height: 12,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: Theme.of(context)
                                    .colorScheme
                                    .tertiaryContainer,
                                borderRadius: BorderRadius.circular(4),
                              ),
                            ),
                            const SizedBox(height: 8),
                            Container(
                              height: 12,
                              width: 120,
                              decoration: BoxDecoration(
                                color: Theme.of(context)
                                    .colorScheme
                                    .tertiaryContainer,
                                borderRadius: BorderRadius.circular(4),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  )),
              itemCount: 3, // Nombre d'éléments souhaité
            ),
          if (widget.type != QuizBlockType.regular)
            Expanded(
              child: ListView.separated(
                separatorBuilder: (context, index) => const SizedBox(height: 8),
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (context, index) => Container(
                    margin:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Container(
                            width: 72,
                            height: 88,
                            color:
                                Theme.of(context).colorScheme.tertiaryContainer,
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                height: 16,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  color: Theme.of(context)
                                      .colorScheme
                                      .tertiaryContainer,
                                  borderRadius: BorderRadius.circular(4),
                                ),
                              ),
                              const SizedBox(height: 8),
                              Container(
                                height: 12,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  color: Theme.of(context)
                                      .colorScheme
                                      .tertiaryContainer,
                                  borderRadius: BorderRadius.circular(4),
                                ),
                              ),
                              const SizedBox(height: 8),
                              Container(
                                height: 12,
                                width: 120,
                                decoration: BoxDecoration(
                                  color: Theme.of(context)
                                      .colorScheme
                                      .tertiaryContainer,
                                  borderRadius: BorderRadius.circular(4),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    )),
                itemCount: 3, // Nombre d'éléments souhaité
              ),
            ),
          if (widget.type == QuizBlockType.regular)
            Container(
              margin: const EdgeInsets.only(right: 16.0),
              alignment: Alignment.bottomRight,
              child: TextButton.icon(
                iconAlignment: IconAlignment.end,
                style: TextButton.styleFrom(
                  padding: EdgeInsets.zero,
                  textStyle: Theme.of(context).textTheme.labelMedium,
                ),
                onPressed: null,
                icon: const Icon(Icons.keyboard_arrow_down_outlined),
                label: const Text("Voir plus"),
              ),
            ),
        ],
      );
}

enum QuizBlockType { regular, empty, skinless }

enum QuizBlockFilter { trending, favorites, recent }

extension QuizBlockFilterExtension on QuizBlockFilter {
  String get name {
    switch (this) {
      case QuizBlockFilter.trending:
        return 'TRENDING';
      case QuizBlockFilter.favorites:
        return 'FAVORITE';
      case QuizBlockFilter.recent:
        return 'RECENT';
    }
  }
}
