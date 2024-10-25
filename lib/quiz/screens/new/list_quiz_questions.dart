import 'package:flutter/material.dart';
import 'package:umai/utils/themes.dart';

class ListQuizQuestionsScreen extends StatelessWidget {
  final List<String> questions = List.generate(
    10,
    (index) => "Quel est le nom de l'attaquant principal de Inazuma Japon?",
  );

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: questions.length,
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
                            questions[index],
                            maxLines: 2,
                            style: Theme.of(context).textTheme.bodySmall,
                          )),
                          const Icon(
                            Icons.arrow_forward_ios,
                            size: 16,
                          ),
                        ],
                      ),
                      Text(
                        '4 propositions',
                        style: Theme.of(context).textTheme.bodySmall!.copyWith(
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
  }
}
