import 'package:flutter/material.dart';
import 'package:potatoes/libs.dart';
import 'package:umai/account/screens/person_account.dart';
import 'package:umai/common/bloc/person_cubit.dart';
import 'package:umai/common/bloc/user_cubit.dart';
import 'package:umai/common/models/user.dart';
import 'package:umai/common/services/person_cubit_manager.dart';
import 'package:umai/common/widgets/profile_picture.dart';
import 'package:umai/quiz/models/quiz.dart';
import 'package:umai/utils/assets.dart';

class UserItemQuiz extends StatelessWidget {
  final QuizParticipation quizParticipation;

  static Widget get(
      {required BuildContext context,
      required QuizParticipation quizParticipation,
      bool canNavigate = true}) {
    return BlocProvider.value(
      value: context.read<PersonCubitManager>().get(quizParticipation.user),
      child: UserItemQuiz._(quizParticipation: quizParticipation),
    );
  }

  const UserItemQuiz._({required this.quizParticipation});
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PersonCubit, PersonState>(
      listener: (context, state) {},
      builder: (context, state) {
        final userCubit = context.read<UserCubit>();

        final personCubit = context.read<PersonCubit>();
        return GestureDetector(
          onTap: () => (personCubit.user.id != userCubit.user.id)
              ? Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => PersonAccountScreen.get(
                      context: context, user: personCubit.user)))
              : null,
          child: ListTile(
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 16.0,
              vertical: 0.0,
            ),
            leading: ProfilePicture(
              image: quizParticipation.user.image,
              height: 48.0,
              width: 48.0,
            ),
            title: Text(quizParticipation.user.username,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.bodyLarge),
            subtitle: Text('${quizParticipation.score} points',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.labelMedium!.copyWith(
                    color: Theme.of(context).colorScheme.surfaceTint)),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                if (quizParticipation.rank == 1)
                  Image.asset(
                    Assets.iconMedalFirst,
                    height: 20,
                    width: 20,
                  )
                else if (quizParticipation.rank == 1)
                  Image.asset(
                    Assets.iconMedalSecond,
                    height: 20,
                    width: 20,
                  )
                else if (quizParticipation.rank == 3)
                  Image.asset(
                    Assets.iconMedalThird,
                    height: 20,
                    width: 20,
                  )
                else
                  Text(
                    "${quizParticipation.rank}e",
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
              ],
            ),
          ),
        );
      },
    );
  }
}
