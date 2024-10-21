import 'package:flutter/material.dart';
import 'package:potatoes/libs.dart';
import 'package:umai/common/bloc/person_cubit.dart';
import 'package:umai/common/bloc/user_cubit.dart';
import 'package:umai/common/models/user.dart';
import 'package:umai/common/services/person_cubit_manager.dart';
import 'package:umai/common/widgets/buttons.dart';
import 'package:umai/common/widgets/profile_picture.dart';
import 'package:umai/account/screens/person_account.dart';
import 'package:umai/social/bloc/post_cubit.dart';
import 'package:umai/utils/themes.dart';
import 'package:umai/common/widgets/bottom_sheet.dart';
import 'package:umai/utils/time_elapsed.dart';

class PostAction extends StatefulWidget {
  static Widget get({
    required BuildContext context,
    required User user,
  }) {
    return BlocProvider.value(
      value: context.read<PersonCubitManager>().get(user),
      child: const PostAction._(),
    );
  }

  const PostAction._();
  @override
  State<PostAction> createState() => _PostActionState();
}

class _PostActionState extends State<PostAction> {
  late final postCubit = context.read<PostCubit>();

  late final post = postCubit.post;

  @override
  Widget build(BuildContext context) {
    return ListTile(
        contentPadding: EdgeInsets.zero,
        leading: InkWell(
          child: ProfilePicture(
            image: post.user.image,
            height: 48.0,
            width: 48.0,
          ),
          onTap: () => Navigator.of(context).push(MaterialPageRoute(
              builder: (context) =>
                  PersonAccountScreen.get(context: context, user: post.user))),
        ),
        title: InkWell(
          child: Text(post.user.username,
              style: Theme.of(context).textTheme.bodyLarge),
          onTap: () => Navigator.of(context).push(MaterialPageRoute(
              builder: (context) =>
                  PersonAccountScreen.get(context: context, user: post.user))),
        ),
        subtitle: Text(
          post.createdAt.elapsed(),
          style: Theme.of(context)
              .textTheme
              .labelMedium!
              .copyWith(color: AppTheme.grey),
        ),
        trailing: PopupMenuButton<String>(
          onSelected: (value) {
            if (value == 'Signaler') {
              reportPost(context: context);
            } else if (value == 'Bloquer') {
              blockUser(context: context);
            } else if (value == 'Supprimer') {
              postCubit.delete();
            }
          },
          padding: EdgeInsets.zero,
          itemBuilder: (BuildContext context) {
            List<String> options = ['Signaler', 'Bloquer'];
            if (post.user.id == context.read<UserCubit>().user.id) {
              options.add('Supprimer');
            }
            return options.map((String choice) {
              return PopupMenuItem<String>(
                padding: const EdgeInsets.only(right: 48.0, left: 16.0),
                value: choice,
                child: Text(choice),
              );
            }).toList();
          },
        ));
  }
}

Future reportPost({required BuildContext context}) {
  late final postCubit = context.read<PostCubit>();
  String? selectedReason;

  return showAppBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
            return BlocProvider.value(
              value: postCubit,
              child: BlocBuilder<PostCubit, PostState>(
                builder: (context, state) => Padding(
                  padding: const EdgeInsets.only(top: 24.0, bottom: 16.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Text('Signaler ce contenu ?',
                          style: Theme.of(context).textTheme.titleLarge!),
                      (state is SendRepportLoadingState)
                          ? const Center(
                              child: CircularProgressIndicator(),
                            )
                          : (state is SuccessSendRepportPostState)
                              ? Center(
                                  child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 16.0),
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
                              : Column(
                                  children: [
                                    RadioListTile<String>(
                                      title:
                                          const Text('Haine / Discrimination'),
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
                      const SizedBox(
                        height: 24,
                      ),
                      UmaiButton.primary(
                        onPressed: selectedReason != null &&
                                state is InitializingPostState
                            ? () {
                                postCubit.report(reason: selectedReason!);
                              }
                            : (state is SuccessSendRepportPostState)
                                ? () {
                                    Navigator.of(context).pop();
                                    postCubit.reset();
                                  }
                                : null,
                        text: state is SuccessSendRepportPostState
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

Future blockUser({required BuildContext context}) {
  late final personCubit = context.read<PersonCubit>();

  return showAppBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return BlocProvider.value(
          value: personCubit,
          child: BlocBuilder<PersonCubit, PersonState>(
            builder: (context, state) => Padding(
              padding: const EdgeInsets.only(top: 24.0, bottom: 16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Text('BLOQUER ${personCubit.user.username} ?',
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.titleLarge!),
                  (state is PersonLoadingState)
                      ? const Center(
                          child: CircularProgressIndicator(),
                        )
                      : (state is SuccessBlockPersonState)
                          ? Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 16.0)
                                      .add(
                                const EdgeInsets.only(top: 24.0),
                              ),
                              child: RichText(
                                  textAlign: TextAlign.center,
                                  text: TextSpan(
                                    style:
                                        Theme.of(context).textTheme.bodyMedium,
                                    children: <TextSpan>[
                                      const TextSpan(text: 'Tu as bloqué '),
                                      TextSpan(
                                        text: 'Hari Randoll',
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
                                  )))
                          : Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 16.0)
                                      .add(
                                const EdgeInsets.only(top: 4.0),
                              ),
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
                                          .copyWith(
                                              fontWeight: FontWeight.bold),
                                    ),
                                    const TextSpan(
                                        text:
                                            ' ne pourra plus interagir avec ton contenu non plus. Veux-tu vraiment continuer?'),
                                  ],
                                ),
                              )),
                  const SizedBox(
                    height: 80,
                  ),
                  UmaiButton.primary(
                    onPressed: state is InitializingPersonState
                        ? () {
                            personCubit.blockUser();
                          }
                        : (state is SuccessBlockPersonState)
                            ? () {
                                Navigator.of(context).pop();
                                personCubit.reset();
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
