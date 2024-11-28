import 'package:flutter/material.dart';
import 'package:potatoes/libs.dart';
import 'package:umai/account/screens/person_account.dart';
import 'package:umai/common/widgets/profile_picture.dart';
import 'package:umai/quiz/bloc/quiz_manage_cubit.dart';
import 'package:umai/quiz/models/quiz.dart';
import 'package:umai/quiz/services/quiz_cubit_manager.dart';
import 'package:umai/utils/assets.dart';
import 'package:umai/utils/svg_utils.dart';
import 'package:umai/utils/themes.dart';

class ReportedQuizWidget extends StatelessWidget {
  final String targetEntity;

  static Widget get({
    required BuildContext context,
    required String targetEntity,
    required Quiz quiz,
  }) {
    return BlocProvider.value(
      value: context.read<QuizManageCubitManager>().get(quiz),
      child: ReportedQuizWidget._(targetEntity: targetEntity),
    );
  }

  ReportedQuizWidget._({required this.targetEntity});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<QuizManageCubit, QuizManageState>(
        builder: (context, state) {
      final quizManageCubit = context.read<QuizManageCubit>();
      final Quiz quiz = quizManageCubit.quiz;
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.only(top: 16, left: 16, right: 16),
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: Row(
              children: <Widget>[
                Stack(
                  alignment: Alignment.bottomRight,
                  children: [
                    GestureDetector(
                      child: ProfilePicture(
                        image: quiz.user.image,
                        size: 32.0,
                      ),
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => PersonAccountScreen.get(
                                context: context, user: quiz.user)));
                      },
                    ),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: Container(
                        decoration: BoxDecoration(
                            color:
                                Theme.of(context).colorScheme.onInverseSurface,
                            shape: BoxShape.circle),
                        height: 16,
                        width: 16,
                        padding: const EdgeInsets.all(3),
                        child: IconButton(
                          padding: EdgeInsets.zero,
                          icon: toSvgIcon(
                            icon: Assets.iconsLike,
                            size: 10,
                            color:
                                Theme.of(context).colorScheme.onSurfaceVariant,
                          ),
                          onPressed: () {},
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    "Tu as signalé un quiz",
                    style: Theme.of(context).textTheme.bodyMedium,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 8),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 8),
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.onInverseSurface,
                borderRadius: BorderRadius.circular(8)),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    "Le contenu est masqué",
                    style: Theme.of(context).textTheme.titleSmall!.copyWith(
                          color: Theme.of(context).colorScheme.onSurfaceVariant,
                        ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                FilledButton(
                  onPressed: () {},
                  style: FilledButton.styleFrom(
                      backgroundColor: AppTheme.mainText,
                      foregroundColor: AppTheme.white,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 40, vertical: 12),
                      minimumSize: Size.zero),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'VOIR',
                        style: Theme.of(context)
                            .textTheme
                            .labelLarge!
                            .copyWith(color: AppTheme.white),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      );
    });
  }
}
