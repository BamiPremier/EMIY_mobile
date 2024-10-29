import 'package:flutter/material.dart';
import 'package:potatoes/libs.dart';
import 'package:umai/quiz/bloc/quiz_cubit.dart';
import 'package:umai/utils/themes.dart';

class ListQuizQuestionsScreen extends StatelessWidget {
  const ListQuizQuestionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<QuizCubit, QuizState>(
        builder: (context, state) => (state as QuizCreatedState)
                .questions
                .isEmpty
            ? Text(
                'Vos questions apparaissent ici',
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium!
                    .copyWith(color: AppTheme.disabledText),
              )
            : ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                itemCount: (state).questions.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      // Action lors de la sélection d'une question
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Row(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              color: AppTheme.surfacegrey,
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            width: 48,
                            height: 60,
                          ),
                          const SizedBox(width: 16),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Expanded(
                                        child: Text(
                                      (state).questions[index].label,
                                      maxLines: 2,
                                      style:
                                          Theme.of(context).textTheme.bodySmall,
                                    )),
                                    const Icon(
                                      Icons.arrow_forward_ios,
                                      size: 16,
                                    ),
                                  ],
                                ),
                                Text(
                                  '${(state).questions[index].responses.length} propositions',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodySmall!
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
              ));
  }
}
