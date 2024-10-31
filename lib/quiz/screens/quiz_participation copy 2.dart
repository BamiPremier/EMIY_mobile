// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:umai/common/widgets/buttons.dart';
// import 'package:umai/quiz/bloc/quiz_participation_cubit.dart';
// import 'package:umai/quiz/bloc/quiz_question_cubit.dart';
// import 'package:umai/quiz/bloc/timer_cubit.dart';
// import 'package:umai/quiz/models/quiz.dart';
// import 'package:umai/quiz/models/quiz_response.dart';
// import 'package:umai/quiz/services/quiz_participation_cubit_manager.dart';
// import 'package:umai/quiz/widgets/question_step.dart';
// import 'package:umai/quiz/services/quiz_cubit_manager.dart';
// import 'package:umai/quiz/services/quiz_service.dart';
// import 'package:umai/quiz/widgets/head_quiz.dart';
// import 'package:umai/utils/themes.dart';

// class QuizParticipationScreen extends StatefulWidget {
//   final Quiz quiz;

//   const QuizParticipationScreen({super.key, required this.quiz});

//   @override
//   State<QuizParticipationScreen> createState() =>
//       _QuizParticipationScreenState();
// }

// class _QuizParticipationScreenState extends State<QuizParticipationScreen> {
//   late final QuizQuestionCubit quizQuestionCubit =
//       context.read<QuizQuestionCubit>();

//   @override
//   void initState() {
//     super.initState();
//     quizQuestionCubit.getQuizQuestions(quiz: widget.quiz);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return BlocBuilder<QuizQuestionCubit, QuizQuestionState>(
//         builder: (context, stateQuizQuestion) {
//       return Scaffold(
//         body: CustomScrollView(
//           slivers: [
//             HeadQuiz.get(context: context, quiz: widget.quiz),
//             if (stateQuizQuestion is QuizQuestionLoadingState)
//               _buildLoadingIndicator(context)
//             else if (stateQuizQuestion is QuizListQuestionState &&
//                 stateQuizQuestion.questions.isNotEmpty)
//               _buildQuestionContent(context, stateQuizQuestion)
//             else if (stateQuizQuestion is QuizQuestionResponseValidateState &&
//                 stateQuizQuestion.questions.isNotEmpty)
//               _buildQuestionContent0(context, stateQuizQuestion)
//             else
//               const SliverToBoxAdapter(
//                 child: Center(
//                   child: Text('Erreur Chargement des questions...'),
//                 ),
//               ),
//           ],
//         ),
//         bottomNavigationBar: _buildBottomNavigation(context, stateQuizQuestion),
//       );
//     });
//   }

//   Widget _buildQuestionContent0(
//       BuildContext context, QuizQuestionResponseValidateState state) {
//     final questionResponse = state.questions[state.currentQuestion];

//     return SliverPadding(
//       padding: const EdgeInsets.all(16.0),
//       sliver: SliverList(
//         delegate: SliverChildBuilderDelegate(
//           (context, index) {
//             if (index == 0) {
//               return Text(
//                 'Question ${state.currentQuestion + 1} - ${state.questions.length}',
//                 style: Theme.of(context).textTheme.titleSmall,
//               );
//             }

//             return BlocProvider.value(
//               value: context
//                   .read<QuizParticipationCubitManager>()
//                   .get(questionResponse),
//               child: _buildQuestionDetails(context, questionResponse, state),
//             );
//           },
//           childCount: 2,
//           addAutomaticKeepAlives: false,
//           addRepaintBoundaries: false,
//         ),
//       ),
//     );
//   }

//   Widget _buildLoadingIndicator(BuildContext context) {
//     return SliverPadding(
//         padding: const EdgeInsets.all(16.0),
//         sliver: SliverToBoxAdapter(
//             child: Center(
//                 child: LinearProgressIndicator(
//           color: Theme.of(context).colorScheme.onTertiaryContainer,
//           backgroundColor: Theme.of(context).colorScheme.tertiaryContainer,
//           borderRadius: BorderRadius.circular(30),
//         ))));
//   }

//   Widget _buildQuestionContent(
//       BuildContext context, QuizListQuestionState state) {
//     final questionResponse = state.questions[state.currentQuestion];

//     return SliverPadding(
//       padding: const EdgeInsets.all(16.0),
//       sliver: SliverList(
//         delegate: SliverChildBuilderDelegate(
//           (context, index) {
//             if (index == 0) {
//               return Text(
//                 'Question ${state.currentQuestion + 1} - ${state.questions.length}',
//                 style: Theme.of(context).textTheme.titleSmall,
//               );
//             }

//             return BlocProvider.value(
//               value: context
//                   .read<QuizParticipationCubitManager>()
//                   .get(questionResponse),
//               child: _buildQuestionDetails(context, questionResponse, state),
//             );
//           },
//           childCount: 2,
//           addAutomaticKeepAlives: false,
//           addRepaintBoundaries: false,
//         ),
//       ),
//     );
//   }

//   Widget _buildQuestionDetails(BuildContext context,
//       QuizQuestionResponse questionResponse, QuizQuestionState quizState) {
//     return BlocBuilder<QuizParticipationCubit, QuizParticipationState>(
//       builder: (context, stateParticipation) {
//         if (stateParticipation is! InitializingQuizParticipationState) {
//           return const SizedBox.shrink();
//         }

//         return Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text(
//               questionResponse.label,
//               style: Theme.of(context).textTheme.bodyMedium!.copyWith(
//                     color: AppTheme.disabledText,
//                   ),
//             ),
//             const SizedBox(height: 16.0),
//             const Divider(),
//             _buildTimer(context),
//             const SizedBox(height: 32.0),
//             _buildResponsesList(
//                 context, questionResponse, stateParticipation, quizState),
//           ],
//         );
//       },
//     );
//   }

//   Widget _buildTimer(BuildContext context) {
//     return BlocBuilder<TimerCubit, ATimerState>(builder: (context, timerState) {
//       if (timerState is! TimerState) return const SizedBox.shrink();

//       final timerCubit = context.read<QuizParticipationCubit>().timerCubit;
//       return LinearProgressIndicator(
//         value: timerState.timer.inSeconds / timerCubit.maxDuration.inSeconds,
//         color: Theme.of(context).colorScheme.onTertiaryContainer,
//         backgroundColor: Theme.of(context).colorScheme.tertiaryContainer,
//         borderRadius: BorderRadius.circular(30),
//       );
//     });
//   }

//   Widget _buildResponsesList(
//       BuildContext context,
//       QuizQuestionResponse questionResponse,
//       InitializingQuizParticipationState stateParticipation,
//       QuizQuestionState quizState) {
//     return ListView.separated(
//       shrinkWrap: true,
//       physics: const NeverScrollableScrollPhysics(),
//       itemCount: questionResponse.responses.length,
//       separatorBuilder: (_, __) => const SizedBox(height: 12.0),
//       itemBuilder: (context, index) {
//         final currentResponse = questionResponse.responses[index];
//         final isSelected =
//             stateParticipation.userResponse?.label == currentResponse.label;

//         if (quizState is QuizQuestionResponseValidateState) {
//           final selectedResponse =
//               quizState.getSelectedResponse(quizState.currentQuestion);
//           if (selectedResponse?.label == currentResponse.label) {
//             return correctOption(currentResponse.label);
//           } else if (isSelected) {
//             return inCorrectOption(currentResponse.label);
//           }
//         }

//         return GestureDetector(
//           onTap: () => context
//               .read<QuizParticipationCubit>()
//               .selectResponse(currentResponse),
//           child: isSelected
//               ? selectedOption(currentResponse.label)
//               : unSelectedOption(currentResponse.label),
//         );
//       },
//     );
//   }

//   Widget _buildBottomNavigation(BuildContext context, QuizQuestionState state) {
//     if (state is! QuizListQuestionState) return const SizedBox.shrink();

//     final questionResponse = state.questions[state.currentQuestion];

//     return BlocProvider.value(
//       value:
//           context.read<QuizParticipationCubitManager>().get(questionResponse),
//       child: BlocBuilder<QuizParticipationCubit, QuizParticipationState>(
//         builder: (context, stateParticipation) {
//           return SafeArea(
//             minimum:
//                 const EdgeInsets.symmetric(horizontal: 32.0, vertical: 16.0),
//             child: UmaiButton.primary(
//               onPressed:
//                   ((stateParticipation is! InitializingQuizParticipationState ||
//                           stateParticipation.userResponse == null)
//                       ? null
//                       : () => quizQuestionCubit.nextQuestion(
//                           response: stateParticipation.userResponse!)),
//               text: "Valider",
//             ),
//           );
//         },
//       ),
//     );
//   }

//   Widget selectedOption(String text) {
//     return Container(
//       padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 16),
//       decoration: BoxDecoration(
//         color: Theme.of(context).colorScheme.primary,
//         borderRadius: BorderRadius.circular(24.0),
//       ),
//       child: Text(
//         text,
//         style: Theme.of(context).textTheme.bodyMedium!.copyWith(
//               color: Theme.of(context).colorScheme.onPrimary,
//             ),
//       ),
//     );
//   }

//   Widget unSelectedOption(String text) {
//     return Container(
//       padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 16),
//       decoration: BoxDecoration(
//         color: Theme.of(context).colorScheme.surfaceBright,
//         borderRadius: BorderRadius.circular(24.0),
//       ),
//       child: Text(
//         text,
//         style: Theme.of(context).textTheme.bodyMedium!.copyWith(
//               color: Theme.of(context).colorScheme.onSurfaceVariant,
//             ),
//       ),
//     );
//   }

//   Widget correctOption(String text) {
//     return Container(
//       padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 16),
//       decoration: BoxDecoration(
//         color: AppTheme.green,
//         borderRadius: BorderRadius.circular(24.0),
//       ),
//       child: Text(
//         text,
//         style: Theme.of(context).textTheme.bodyMedium!.copyWith(
//               color: AppTheme.onHighGreen,
//             ),
//       ),
//     );
//   }

//   Widget inCorrectOption(String text) {
//     return Container(
//       padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 16),
//       decoration: BoxDecoration(
//         color: AppTheme.errorRed,
//         borderRadius: BorderRadius.circular(24.0),
//       ),
//       child: Text(
//         text,
//         style: const TextStyle(color: Colors.white),
//       ),
//     );
//   }
// }
