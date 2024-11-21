import 'package:flutter/material.dart';
import 'package:potatoes/libs.dart';
import 'package:umai/common/services/cache_manager.dart';
import 'package:umai/quiz/bloc/create_quiz_question_cubit.dart';
import 'package:umai/quiz/bloc/new_quiz_cubit.dart';
import 'package:umai/quiz/screens/new/add_quiz_question.dart';
import 'package:umai/utils/assets.dart';
import 'package:umai/utils/svg_utils.dart';
import 'package:umai/utils/themes.dart';

class ListQuizQuestionsScreen extends StatelessWidget {
  const ListQuizQuestionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CreateQuizQuestionCubit, CreateQuizQuestionState>(
        listener: (context, state) {
      if (state is QuizUpdateQuestionFormBuildState) {
        Navigator.of(context).push(
          MaterialPageRoute(builder: (_) => AddQuizQuestionScreen()),
        );
      }
    }, builder: (context, state) {
      return BlocBuilder<NewQuizCubit, NewQuizState>(
          buildWhen: (previous, current) =>
              current is QuizIdleState ||
              current is QuizCreatedState ||
              current is QuizUpdateState,
          builder: (context, state) {
      
            if (state is QuizIdleState ||
                state is QuizCreatedState && state.questions.isEmpty  ) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 150),
                  Center(
                    child: Text(
                      'Vos questions apparaissent ici',
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium!
                          .copyWith(color: AppTheme.disabledText),
                    ),
                  ),
                ],
              );
            }

            final questions = state is QuizCreatedState
                ? state.questions
                :   [];

            return ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              itemCount: questions.length,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                final question = questions[index];

                return GestureDetector(
                  onTap: () {
                    context
                        .read<CreateQuizQuestionCubit>()
                        .initializeUpdateForm(question);
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        if (question.image != null)
                          Container(
                            width: 48,
                            height: 60,
                            clipBehavior: Clip.hardEdge,
                            decoration: BoxDecoration(
                              color: AppTheme.surfaceGrey,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Image(
                              fit: BoxFit.cover,
                              image: context
                                  .read<AppCacheManager>()
                                  .getImage(question.image ?? ''),
                              errorBuilder: (context, url, error) => toSvgIcon(
                                icon: Assets.iconsError,
                                color: Theme.of(context)
                                    .colorScheme
                                    .onTertiaryContainer,
                              ),
                            ),
                          ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Expanded(
                                    child: Text(
                                      question.label,
                                      maxLines: 2,
                                      style:
                                          Theme.of(context).textTheme.bodySmall,
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 8,
                                  ),
                                  const Icon(
                                    Icons.arrow_forward_ios,
                                    size: 16,
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 12,
                              ),
                              Text(
                                '${question.responses.length} propositions',
                                style: Theme.of(context)
                                    .textTheme
                                    .labelSmall!
                                    .copyWith(
                                      color: AppTheme.disabledText,
                                    ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          });
    });
  }
}
