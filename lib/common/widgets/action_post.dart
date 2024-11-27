import 'package:flutter/material.dart';
import 'package:potatoes/libs.dart';
import 'package:umai/account/screens/person_account.dart';
import 'package:umai/common/bloc/person_cubit.dart';
import 'package:umai/common/bloc/report_cubit.dart';
import 'package:umai/common/bloc/user_cubit.dart';
import 'package:umai/common/services/home_quiz_service.dart';
import 'package:umai/common/services/report_util_service.dart';
import 'package:umai/common/widgets/bottom_sheet.dart';
import 'package:umai/common/widgets/buttons.dart';
import 'package:umai/common/widgets/profile_picture.dart';
import 'package:umai/social/bloc/post_cubit.dart';
import 'package:umai/social/bloc/post_feed_cubit.dart';
import 'package:umai/social/models/post.dart';
import 'package:umai/social/services/social_service.dart';
import 'package:umai/utils/assets.dart';
import 'package:umai/utils/svg_utils.dart';
import 'package:umai/utils/themes.dart';
import 'package:umai/utils/time_elapsed.dart';

class PostAction extends StatelessWidget {
  final void Function(BuildContext context, XReportState state)
      onReportEventReceived;
  const PostAction({super.key, required this.onReportEventReceived});

  @override
  Widget build(BuildContext context) {
    final postCubit = context.read<PostCubit>();
    final user = postCubit.x.itemUser!;

    return Padding(
      padding: const EdgeInsets.only(left: 16.0, right: 8.0),
      child: Row(
        children: [
          GestureDetector(
            child: ProfilePicture(
              image: user.image,
              size: 32.0,
            ),
            onTap: () => Navigator.of(context).push(MaterialPageRoute(
                builder: (context) =>
                    PersonAccountScreen.get(context: context, user: user))),
          ),
          const SizedBox(width: 16.0),
          Expanded(
            child: GestureDetector(
              onTap: () => Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) =>
                      PersonAccountScreen.get(context: context, user: user))),
              behavior: HitTestBehavior.translucent,
              child: Text(user.username,
                  style: Theme.of(context).textTheme.bodyLarge),
            ),
          ),
          Text(
            postCubit.x.itemCreatedAt.elapsed(),
            style: Theme.of(context)
                .textTheme
                .labelMedium!
                .copyWith(color: AppTheme.disabledText),
          ),
          PopupMenuButton<String>(
            onSelected: (value) {
              if (value == 'Signaler') {
                reportUtilService<Post>(
                    item: postCubit.x as Post,
                    onReportEventReceived: onReportEventReceived,
                    reportService: context.read<SocialService>(),
                    context: context);
              } else if (value == 'Bloquer') {
                blockUser(context: context);
              } else if (value == 'Supprimer') {
                postCubit.delete();
              }
            },
            icon: toSvgIcon(
                icon: Assets.iconsOptions,
                color: Theme.of(context).colorScheme.onSurfaceVariant,
                size: 16),
            itemBuilder: (BuildContext context) {
              List<String> options = [];

              if (user.id == context.read<UserCubit>().user.id) {
                options.add('Supprimer');
              } else {
                options.addAll(['Signaler', 'Bloquer']);
              }

              return options.map((String choice) {
                return PopupMenuItem<String>(
                  padding: const EdgeInsets.only(right: 48.0, left: 16.0),
                  value: choice,
                  child: Text(choice),
                );
              }).toList();
            },
          )
        ],
      ),
    );
  }
}

Future<void> blockUser({required BuildContext context}) {
  late final personCubit = context.read<PersonCubit>();

  return showAppBottomSheet(
      context: context,
      maxHeight: 320,
      builder: (BuildContext context) {
        return BlocProvider.value(
          value: personCubit,
          child: BlocConsumer<PersonCubit, PersonState>(
            listener: (context, state) {
              if (state is SuccessBlockPersonState) {
                context.read<PostFeedCubit>().deleteUserPost(state.user);
                context.read<HomeQuizService>().deleteUserQuiz(state.user);

                // à voir si on remet ou pas...
                //Navigator.of(context).popUntil((route) => route.isFirst);
              }
            },
            builder: (context, state) => Padding(
              padding: const EdgeInsets.only(top: 24.0, bottom: 16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Text('BLOQUER ${personCubit.user.username} ?',
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.titleLarge!),
                  if (state is InitializingPersonState)
                    Expanded(
                      child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0)
                              .add(const EdgeInsets.only(top: 8.0)),
                          child: RichText(
                            textAlign: TextAlign.center,
                            text: TextSpan(
                              style: Theme.of(context).textTheme.bodyMedium,
                              children: <TextSpan>[
                                const TextSpan(
                                    text:
                                        'Tu ne verras plus les contenus de cette personne dans tes fils d\'actualité. '),
                                TextSpan(
                                  text: personCubit.user.username,
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium!
                                      .copyWith(fontWeight: FontWeight.bold),
                                ),
                                const TextSpan(
                                    text:
                                        ' ne pourra plus interagir avec ton contenu non plus. Veux-tu vraiment continuer?'),
                              ],
                            ),
                          )),
                    ),
                  if (state is PersonLoadingBlockState)
                    const Expanded(
                      child: Center(child: CircularProgressIndicator()),
                    ),
                  if (state is SuccessSendBlockPersonState)
                    Expanded(
                      child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0)
                              .add(const EdgeInsets.only(top: 8.0)),
                          child: Column(
                            children: [
                              RichText(
                                  textAlign: TextAlign.center,
                                  text: TextSpan(
                                    style:
                                        Theme.of(context).textTheme.bodyMedium,
                                    children: <TextSpan>[
                                      const TextSpan(text: 'Tu as bloqué '),
                                      TextSpan(
                                        text: personCubit.user.username,
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyMedium!
                                            .copyWith(
                                                fontWeight: FontWeight.bold),
                                      ),
                                      const TextSpan(
                                          text:
                                              '. Pour annuler cette décision, rends-toi dans les paramètres de ton compte.'),
                                    ],
                                  )),
                              const SizedBox(height: 40.0),
                              toSvgIcon(icon: Assets.iconsTick, size: 24),
                            ],
                          )),
                    ),
                  UmaiButton.primary(
                    onPressed: state is InitializingPersonState
                        ? personCubit.blockUser
                        : (state is SuccessSendBlockPersonState)
                            ? () {
                                Navigator.of(context).pop();
                                personCubit.applyBlock();
                              }
                            : null,
                    text:
                        state is InitializingPersonState ? "Bloquer" : "Fermer",
                  ),
                ],
              ),
            ),
          ),
        );
      });
}
