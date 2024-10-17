import 'package:flutter/material.dart';
import 'package:potatoes/libs.dart';
import 'package:umai/account/screens/person_account.dart';
import 'package:umai/common/bloc/person_cubit.dart';
import 'package:umai/common/models/user.dart';
import 'package:umai/common/services/person_cubit_manager.dart';
import 'package:umai/common/widgets/profile_picture.dart';
import 'package:umai/utils/themes.dart';

class UserItem extends StatelessWidget {
  static Widget get({required BuildContext context, required User user}) {
    return BlocProvider.value(
      value: context.read<PersonCubitManager>().get(user),
      child: const UserItem._(),
    );
  }

  const UserItem._();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PersonCubit, PersonState>(
      listener: (context, state) {},
      builder: (context, state) {
        final followCubit = context.read<PersonCubit>();
        return InkWell(
          child: ListTile(
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 0.0, vertical: 0.0),
            leading: ProfilePicture(
              image: followCubit.user.imageFull ?? '',
              height: 48.0,
              width: 48.0,
            ),
            title: Text(
              followCubit.user.username,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            subtitle: Text(
              '${followCubit.user.animesViewedCount} animes • ${followCubit.user.followingCount} suivent',
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            trailing: !followCubit.user.followed
                ? ElevatedButton(
                    onPressed: () => followCubit.followUser(),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Theme.of(context).colorScheme.primary,
                      textStyle:
                          Theme.of(context).textTheme.labelLarge!.copyWith(
                                color: AppTheme.mainText,
                              ),
                      padding: const EdgeInsets.symmetric(
                          vertical: 6, horizontal: 12),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        state is PersonLoadingState
                            ? const SizedBox(
                                width: 16,
                                height: 16,
                                child: CircularProgressIndicator(
                                  strokeWidth: 2,
                                  color: AppTheme.black,
                                ),
                              )
                            : const Icon(
                                Icons.add,
                              ),
                        const SizedBox(width: 8),
                        Text(
                          'Ajouter',
                          style:
                              Theme.of(context).textTheme.labelLarge!.copyWith(
                                    color: AppTheme.mainText,
                                  ),
                        ),
                      ],
                    ),
                  )
                : ElevatedButton(
                    onPressed: () => followCubit.unFollowUser(),
                    style: ElevatedButton.styleFrom(
                      backgroundColor:
                          Theme.of(context).colorScheme.tertiaryContainer,
                      textStyle:
                          Theme.of(context).textTheme.labelLarge!.copyWith(
                                color: Theme.of(context)
                                    .colorScheme
                                    .onTertiaryContainer,
                              ),
                      padding: const EdgeInsets.symmetric(
                          vertical: 6, horizontal: 12),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        state is PersonLoadingState
                            ? const SizedBox(
                                width: 16,
                                height: 16,
                                child: CircularProgressIndicator(
                                  strokeWidth: 2,
                                  color: AppTheme.black,
                                ),
                              )
                            : const Icon(Icons.check),
                        const SizedBox(width: 8),
                        Text(
                          'Ajouté(e)',
                          style: Theme.of(context)
                              .textTheme
                              .labelLarge!
                              .copyWith(
                                  color: Theme.of(context)
                                      .colorScheme
                                      .onTertiaryContainer),
                        ),
                      ],
                    ),
                  ),
          ),
          onTap: () => Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => PersonAccountScreen.get(
                  context: context, user: followCubit.user))),
        );
      },
    );
  }
}
