import 'package:flutter/material.dart';
import 'package:potatoes/libs.dart';
import 'package:umai/account/screens/person_account.dart';
import 'package:umai/common/bloc/common_cubit.dart';
import 'package:umai/common/bloc/person_cubit.dart';
import 'package:umai/common/bloc/user_cubit.dart';
import 'package:umai/common/widgets/bottom_sheet.dart';
import 'package:umai/common/widgets/buttons.dart';
import 'package:umai/common/widgets/profile_picture.dart';
import 'package:umai/social/bloc/post_cubit.dart';
import 'package:umai/utils/themes.dart';
import 'package:umai/common/widgets/bottom_sheet.dart';
import 'package:umai/utils/time_elapsed.dart';

class PostCommon extends StatelessWidget {
  const PostCommon({super.key});

  @override
  Widget build(BuildContext context) {
    final postCubit = context.read<PostCubit>();
    final user = postCubit.x.itemUser;

    return ListTile(
        contentPadding: const EdgeInsets.only(left: 16.0, right: 8.0),
        leading: GestureDetector(
          child: ProfilePicture(
            image: user!.image,
            height: 48.0,
            width: 48.0,
          ),
          onTap: () => Navigator.of(context).push(MaterialPageRoute(
              builder: (context) =>
                  PersonAccountScreen.get(context: context, user: user))),
        ),
        title: GestureDetector(
          child:
              Text(user.username, style: Theme.of(context).textTheme.bodyLarge),
          onTap: () => Navigator.of(context).push(MaterialPageRoute(
              builder: (context) =>
                  PersonAccountScreen.get(context: context, user: user))),
        ),
        subtitle: Text(
          postCubit.x.itemCreatedAt.elapsed(),
          style: Theme.of(context)
              .textTheme
              .labelMedium!
              .copyWith(color: AppTheme.disabledText),
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
              child: BlocBuilder<PostCubit, XCommonState>(
                builder: (context, state) => Padding(
                  padding: const EdgeInsets.only(top: 24.0, bottom: 16.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Text('Signaler ce contenu ?',
                          style: Theme.of(context).textTheme.titleLarge!),
                      (state is SendReportLoadingState)
                          ? const Padding(
                              padding: EdgeInsets.only(top: 118.0, bottom: 130),
                              child: Center(
                                child: CircularProgressIndicator(),
                              ))
                          : (state is SuccessSendReportItemState)
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
                                state is InitializingXCommonState
                            ? () {
                                postCubit.report(reason: selectedReason!);
                              }
                            : (state is SuccessSendReportItemState)
                                ? () {
                                    Navigator.of(context).pop();
                                    postCubit.reset();
                                  }
                                : null,
                        text: state is SuccessSendReportItemState
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
                  (state is PersonLoadingBlockState)
                      ? const Padding(
                          padding: EdgeInsets.only(top: 60.0),
                          child: Center(
                            child: CircularProgressIndicator(),
                          ))
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
