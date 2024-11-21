import 'package:flutter/material.dart';
import 'package:potatoes/libs.dart';
import 'package:potatoes/potatoes.dart';
import 'package:share_plus/share_plus.dart';
import 'package:umai/common/services/cache_manager.dart';
import 'package:umai/common/services/report_util_service.dart';
import 'package:umai/common/widgets/action_widget.dart';
import 'package:umai/common/widgets/bottom_sheet.dart';
import 'package:umai/quiz/bloc/new_quiz_cubit.dart';
import 'package:umai/quiz/bloc/quiz_manage_cubit.dart';
import 'package:umai/quiz/models/quiz.dart';
import 'package:umai/quiz/services/quiz_service.dart';
import 'package:umai/utils/assets.dart';
import 'package:umai/utils/dialogs.dart';
import 'package:umai/utils/svg_utils.dart';
import 'package:umai/utils/themes.dart';

class HeadQuiz extends StatefulWidget {
  const HeadQuiz({super.key});

  @override
  State<HeadQuiz> createState() => _HeadQuizState();
}

class _HeadQuizState extends State<HeadQuiz> with CompletableMixin {
  late final quizManageCubit = context.read<QuizManageCubit>();
  late final quizCubit = context.read<NewQuizCubit>();
  late final Quiz quiz = quizManageCubit.quiz;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<QuizManageCubit, QuizManageState>(
        listener: onEventReceived,
        builder: (context, stateQuizManage) => SliverAppBar(
              backgroundColor: Theme.of(context).colorScheme.tertiaryContainer,
              expandedHeight: 200,
              systemOverlayStyle: Theme.of(context)
                  .appBarTheme
                  .systemOverlayStyle
                  ?.copyWith(statusBarIconBrightness: Brightness.light),
              pinned: true,
              flexibleSpace: FlexibleSpaceBar(
                background: Stack(
                  fit: StackFit.expand,
                  children: [
                    if (quiz.anime != null)
                      Image(
                        fit: BoxFit.cover,
                        image: context
                            .read<AppCacheManager>()
                            .getAnimeImage(quiz.anime!),
                        errorBuilder: (context, error, stackTrace) => toSvgIcon(
                          icon: Assets.iconsError,
                          color:
                              Theme.of(context).colorScheme.onTertiaryContainer,
                          // size: 32,
                        ),
                      ),
                    Align(
                      alignment: Alignment.topCenter,
                      child: Container(
                        height: MediaQuery.of(context).viewPadding.top +
                            kToolbarHeight,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              Theme.of(context).colorScheme.inverseSurface,
                              Colors.transparent
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              leading: const BackButton(
                color: AppTheme.white,
              ),
              actions: [
                IconButton(
                  padding: EdgeInsets.zero,
                  onPressed: () => actionsOptions(),
                  icon: toSvgIcon(
                    icon: Assets.iconsOptions,
                    color: AppTheme.white,
                  ),
                ),
              ],
            ));
  }

  void onEventReceived(BuildContext context, QuizManageState state) async {
    await waitForDialog();

    if (state is ShareQuizLoadingState) {
      loadingDialogCompleter = showLoadingBarrier(
        context: context,
      );
    } else if (state is ShareQuizSuccesState) {
      await Share.share(state.link);
    } else if (state is QuizManageErrorState) {
      showErrorToast(content: state.error, context: context);
    }
  }

  void actionsOptions() => showAppBottomSheet(
      context: context,
      horizontalPadding: 16.0,
      builder: (_) => Padding(
          padding: const EdgeInsets.only(top: 24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              ActionWidget(
                title: 'Partager...',
                icon: toSvgIcon(
                  icon: Assets.iconsShare,
                ),
                onTap: () => quizManageCubit.shareQuiz(),
              ),
              const SizedBox(
                height: 16,
              ),
              ActionWidget(
                title: 'Signaler',
                icon: toSvgIcon(
                  icon: Assets.iconsSignal,
                ),
                onTap: () =>    reportUtilService<Quiz>(
                  item: quiz,
                  reportService: context.read<QuizService>(),
                  context: context),
              ),
            ],
          )));
 }
