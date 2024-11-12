import 'package:flutter/material.dart';
import 'package:potatoes/libs.dart';
import 'package:potatoes/potatoes.dart';
import 'package:share_plus/share_plus.dart';
import 'package:umai/common/services/cache_manager.dart';
import 'package:umai/common/widgets/action_widget.dart';
import 'package:umai/common/widgets/bottom_sheet.dart';
import 'package:umai/common/widgets/buttons.dart';
import 'package:umai/quiz/bloc/quiz_cubit.dart';
import 'package:umai/quiz/bloc/quiz_manage_cubit.dart';
import 'package:umai/quiz/models/quiz.dart';
import 'package:umai/utils/dialogs.dart';
import 'package:umai/utils/themes.dart';

class HeadQuiz extends StatefulWidget {
  const HeadQuiz({super.key});

  @override
  State<HeadQuiz> createState() => _HeadQuizState();
}

class _HeadQuizState extends State<HeadQuiz> with CompletableMixin {
  late final quizManageCubit = context.read<QuizManageCubit>();
  late final quizCubit = context.read<QuizCubit>();
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
                    Image(
                      fit: BoxFit.cover,
                      image: context
                          .read<AppCacheManager>()
                          .getImage(quiz.anime?.coverImage.extraLarge ?? ''),
                      color: quiz.anime == null
                          ? Theme.of(context).colorScheme.onTertiaryContainer
                          : null,
                      errorBuilder: (context, error, stackTrace) =>
                          quiz.anime != null
                              ? Icon(
                                  Icons.error,
                                  color: Theme.of(context)
                                      .colorScheme
                                      .onTertiaryContainer,
                                  size: 32,
                                )
                              : Container(),
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
                  color: AppTheme.white,
                  icon: const Icon(Icons.more_vert),
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
                icon: Icons.share_outlined,
                onTap: () => quizManageCubit.shareQuiz(),
              ),
              
              const SizedBox(
                height: 16,
              ),
              ActionWidget(
                title: 'Signaler',
                icon: Icons.report_gmailerrorred_rounded,
                onTap: () => reportQuiz(context: context),
              ),
            ],
          )));

  Future reportQuiz({required BuildContext context}) {
    String? selectedReason;

    return showAppBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return StatefulBuilder(
            builder: (BuildContext context, StateSetter setState) {
              return BlocProvider.value(
                value: quizManageCubit,
                child: BlocBuilder<QuizManageCubit, QuizManageState>(
                  builder: (context, state) => Padding(
                    padding: const EdgeInsets.only(top: 24.0, bottom: 16.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Text('Signaler ce contenu ?',
                            style: Theme.of(context).textTheme.titleLarge!),
                        (state is SendQuizRepportLoadingState)
                            ? const Padding(
                                padding:
                                    EdgeInsets.only(top: 118.0, bottom: 130),
                                child: Center(
                                  child: CircularProgressIndicator(),
                                ))
                            : (state is SuccessSendQuizRepportPostState)
                                ? Center(
                                    child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                                horizontal: 16.0)
                                            .copyWith(top: 80, bottom: 100),
                                        child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            mainAxisSize: MainAxisSize.min,
                                            children: <Widget>[
                                              const Text(
                                                'Merci d’avoir signalé ce contenu. Nous allons prendre les mesures nécessaires en cas de contenu inapproprié avéré.',
                                                textAlign: TextAlign.center,
                                              ),
                                              const SizedBox(height: 40.0),
                                              Icon(
                                                Icons.check_box_outlined,
                                                size: 40.0,
                                                color: Theme.of(context)
                                                    .colorScheme
                                                    .onSurfaceVariant,
                                              ),
                                            ])))
                                : Padding(
                                    padding: const EdgeInsets.only(top: 24),
                                    child: Column(
                                      children: [
                                        RadioListTile<String>(
                                          title: const Text(
                                              'Haine / Discrimination'),
                                          value: 'Haine / Discrimination',
                                          groupValue: selectedReason,
                                          onChanged: (value) {
                                            setState(() {
                                              selectedReason = value;
                                            });
                                          },
                                          controlAffinity:
                                              ListTileControlAffinity.trailing,
                                        ),
                                        RadioListTile<String>(
                                          title: const Text('Contenu sexuel'),
                                          value: 'Contenu sexuel',
                                          groupValue: selectedReason,
                                          onChanged: (value) {
                                            setState(() {
                                              selectedReason = value;
                                            });
                                          },
                                          controlAffinity:
                                              ListTileControlAffinity.trailing,
                                        ),
                                        RadioListTile<String>(
                                          title: const Text('Harcèlement'),
                                          value: 'Harcèlement',
                                          groupValue: selectedReason,
                                          onChanged: (value) {
                                            setState(() {
                                              selectedReason = value;
                                            });
                                          },
                                          controlAffinity:
                                              ListTileControlAffinity.trailing,
                                        ),
                                        RadioListTile<String>(
                                          title: const Text(
                                              'Divulgation d\'informations privées'),
                                          value:
                                              'Divulgation d\'informations privées',
                                          groupValue: selectedReason,
                                          onChanged: (value) {
                                            setState(() {
                                              selectedReason = value;
                                            });
                                          },
                                          controlAffinity:
                                              ListTileControlAffinity.trailing,
                                        ),
                                        RadioListTile<String>(
                                          title: const Text('Autre'),
                                          value: 'Autre',
                                          groupValue: selectedReason,
                                          onChanged: (value) {
                                            setState(() {
                                              selectedReason = value;
                                            });
                                          },
                                          controlAffinity:
                                              ListTileControlAffinity.trailing,
                                        ),
                                      ],
                                    ),
                                  ),
                        const SizedBox(
                          height: 24,
                        ),
                        UmaiButton.primary(
                          onPressed: selectedReason != null &&
                                  state is InitializingQuizManageState
                              ? () {
                                  quizManageCubit.reportQuiz(
                                      reason: selectedReason!);
                                }
                              : (state is SuccessSendQuizRepportPostState)
                                  ? () {
                                      Navigator.of(context).pop();
                                      // quizManageCubit.reset();
                                    }
                                  : null,
                          text: state is SuccessSendQuizRepportPostState
                              ? "Fermer"
                              : "Signaler",
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          );
        });
  }
}
