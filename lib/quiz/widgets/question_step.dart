// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:flutter/material.dart';
// import 'package:potatoes/libs.dart';
// import 'package:umai/common/widgets/buttons.dart';
// import 'package:umai/quiz/bloc/quiz_participation_cubit.dart';
// import 'package:umai/quiz/bloc/quiz_question_cubit.dart';
// import 'package:umai/quiz/bloc/timer_cubit.dart';
// import 'package:umai/quiz/models/quiz.dart';
// import 'package:umai/quiz/models/quiz_response.dart';
// import 'package:umai/quiz/services/quiz_cubit_manager.dart';
// import 'package:umai/quiz/services/quiz_participation_cubit_manager.dart';
// import 'package:umai/quiz/services/quiz_service.dart';
// import 'package:umai/quiz/widgets/head_quiz.dart';
// import 'package:umai/utils/themes.dart';

// class QuestionStepWidget extends StatefulWidget {
//   static Widget get({
//     required BuildContext context,
//     required QuizQuestionResponse quizQuestionResponse,
//   }) {
//     return MultiBlocProvider(
//       providers: [
//         BlocProvider(
//           create: (context) => TimerCubit.duration(const Duration(seconds: 30)),
//         ),
//         BlocProvider.value(
//           value: context
//               .read<QuizParticipationCubitManager>()
//               .get(quizQuestionResponse),
//         )
//       ],
//       child: QuestionStepWidget._(),
//     );
//   }

//   const QuestionStepWidget._();

//   @override
//   State<QuestionStepWidget> createState() => _QuestionStepWidgetState();
// }

// class _QuestionStepWidgetState extends State<QuestionStepWidget> {
//   late final QuizParticipationCubit quizParticipationCubit =
//       context.read<QuizParticipationCubit>();
//   late final QuizQuestionResponse questionResponse =
//       quizParticipationCubit.quizQuestionResponse;

//   @override
//   void initState() {
//     print(questionResponse.toJson());
//     super.initState();
//   }

//   @override
//   void dispose() {}
//   @override
//   Widget build(BuildContext context) {
//     return BlocBuilder<QuizQuestionCubit, QuizQuestionState>(
//         builder: (context, stateQuizQuestion) {
//       return BlocBuilder<QuizParticipationCubit, QuizParticipationState>(
//           builder: (context, stateParticipation) {
//         return SingleChildScrollView(
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text(
//                 questionResponse.label,
//                 style: Theme.of(context).textTheme.bodyMedium!.copyWith(
//                       color: AppTheme.disabledText,
//                     ),
//               ),
//               const SizedBox(height: 16.0),
//               const Divider(),
//               Align(
//                   alignment: Alignment.centerLeft,
//                   child: BlocBuilder<TimerCubit, ATimerState>(
//                       builder: (context, state) {
//                     if (state is TimerState) {
//                       return Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           LinearProgressIndicator(
//                             value: state.timer.inSeconds /
//                                 quizParticipationCubit
//                                     .timerCubit.maxDuration.inSeconds,
//                             color: Theme.of(context)
//                                 .colorScheme
//                                 .onTertiaryContainer,
//                             backgroundColor:
//                                 Theme.of(context).colorScheme.tertiaryContainer,
//                             borderRadius: BorderRadius.circular(30),
//                           ),
//                         ],
//                       );
//                     } else if (state is TimerFinished) {
//                       return const SizedBox.shrink();
//                     }
//                     return const SizedBox.shrink();
//                   })),
//               const SizedBox(height: 32.0),
//               ListView.separated(
//                 shrinkWrap: true,
//                 physics: const NeverScrollableScrollPhysics(),
//                 itemCount: questionResponse.responses.length,
//                 separatorBuilder: (context, index) =>
//                     const SizedBox(height: 12.0),
//                 itemBuilder: (context, index) {
//                   return GestureDetector(
//                     onTap: () => quizParticipationCubit
//                         .selectResponse(questionResponse.responses[index]),
//                     child: (stateParticipation
//                                         as InitializingQuizParticipationState)
//                                     .userResponse !=
//                                 null &&
//                             (stateParticipation).userResponse!.label ==
//                                 questionResponse.responses[index].label
//                         ? selectedOption(
//                             questionResponse.responses[index].label)
//                         : unSelectedOption(
//                             questionResponse.responses[index].label),
//                   );
//                 },
//               ),
//             ],
//           ),
//         );
//       });
//     });
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
