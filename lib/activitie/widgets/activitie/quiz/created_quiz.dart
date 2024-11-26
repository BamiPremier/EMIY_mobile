import 'package:flutter/material.dart';
import 'package:potatoes/libs.dart';
import 'package:readmore/readmore.dart';
import 'package:umai/account/screens/person_account.dart';
import 'package:umai/activitie/widgets/activitie/actu_btn_type1.dart';
import 'package:umai/activitie/widgets/activitie/actu_btn_type3.dart';
import 'package:umai/activitie/widgets/activitie/actu_head.dart';
import 'package:umai/activitie/widgets/activitie/post/post_actu_image.dart';
import 'package:umai/common/bloc/person_cubit.dart';
import 'package:umai/common/bloc/user_cubit.dart';
import 'package:umai/common/services/report_util_service.dart';
import 'package:umai/common/widgets/bottom_sheet.dart';
import 'package:umai/common/widgets/buttons.dart';
import 'package:umai/common/widgets/profile_picture.dart';
import 'package:umai/quiz/bloc/quiz_manage_cubit.dart';
import 'package:umai/quiz/models/quiz.dart';
import 'package:umai/quiz/services/quiz_cubit_manager.dart';
import 'package:umai/quiz/widgets/item_quiz.dart';
import 'package:umai/social/bloc/post_cubit.dart';
import 'package:umai/social/models/post.dart';
import 'package:umai/social/services/social_service.dart';
import 'package:umai/social/widgets/post_image.dart';
import 'package:umai/utils/assets.dart';
import 'package:umai/utils/svg_utils.dart';
import 'package:umai/utils/themes.dart';
import 'package:umai/utils/time_elapsed.dart';

class CreatedQuizWidget extends StatefulWidget {
  final String targetEntity;

  static Widget get({
    required BuildContext context,
    required String targetEntity,
    required Quiz quiz,
  }) {
    return BlocProvider.value(
      value: context.read<QuizManageCubitManager>().get(quiz),
      child: CreatedQuizWidget._(targetEntity: targetEntity),
    );
  }

  const CreatedQuizWidget._({required this.targetEntity});
  @override
  State<CreatedQuizWidget> createState() => _CreatedQuizWidgetState();
}

class _CreatedQuizWidgetState extends State<CreatedQuizWidget>
    with SingleTickerProviderStateMixin {
  late final quizManageCubit = context.read<QuizManageCubit>();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<QuizManageCubit, QuizManageState>(
        builder: (context, state) {
      final Quiz quiz = quizManageCubit.quiz;
      return Container(
        padding: const EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            ActuHeadWidget.get(
             targetEntity: widget.targetEntity, context: context, user: quiz.user),
            const SizedBox(height: 8),
            Container(
                padding:
                    const EdgeInsets.all(8).add(const EdgeInsets.only(left: 8)),
                decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.onInverseSurface,
                    borderRadius: BorderRadius.circular(8)),
                child: ItemQuiz.get(context: context, quiz: quiz)),
            IconButton(
              padding: EdgeInsets.zero,
              icon: toSvgIcon(
                icon: Assets.iconsShare,
                color: Theme.of(context).colorScheme.onSurfaceVariant,
              ),
              onPressed: () {},
            ),
          ],
        ),
      );
    });
  }
}
