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
        final personCubit = context.read<PersonCubit>();
        return GestureDetector(
          child: ListTile(
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 0.0, vertical: 0.0),
            leading: ProfilePicture(
              image: personCubit.user.imageFull ?? '',
              height: 48.0,
              width: 48.0,
            ),
            title: Text(personCubit.user.username,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.bodyLarge),
            subtitle: Text(
              '${personCubit.user.animesViewedCount} animes • ${personCubit.user.followingCount} suivent',
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            trailing: personCubit.user.hasBlocked
                ? SizedBox(
                    width: 141,
                    child: FilledButton(
                      onPressed: () => personCubit.unBlockUser(),
                      style: FilledButton.styleFrom(
                        backgroundColor: AppTheme.mainText,
                        foregroundColor: AppTheme.white,
                        padding: const EdgeInsets.symmetric(
                            vertical: 6, horizontal: 12),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          state is PersonLoadingBlockState
                              ? const SizedBox(
                                  width: 16,
                                  height: 16,
                                  child: CircularProgressIndicator(
                                    strokeWidth: 2,
                                    color: AppTheme.white,
                                  ),
                                )
                              : const Icon(
                                  Icons.block_flipped,
                                ),
                          const SizedBox(width: 4),
                          Text(
                            'Débloquer',
                            style: Theme.of(context)
                                .textTheme
                                .labelLarge!
                                .copyWith(
                                  color: AppTheme.white,
                                ),
                          ),
                        ],
                      ),
                    ))
                : !personCubit.user.followed
                    ? SizedBox(
                        width: 134,
                        child: FilledButton(
                          onPressed: () => personCubit.followUser(),
                          style: FilledButton.styleFrom(
                            backgroundColor:
                                Theme.of(context).colorScheme.primary,
                            textStyle: Theme.of(context).textTheme.labelLarge,
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
                              const SizedBox(width: 4),
                              Text(
                                'Ajouter',
                                style: Theme.of(context).textTheme.labelLarge!,
                              ),
                            ],
                          ),
                        ))
                    : SizedBox(
                        width: 134,
                        child: FilledButton(
                          onPressed: () => personCubit.unFollowUser(),
                          style: FilledButton.styleFrom(
                            backgroundColor:
                                Theme.of(context).colorScheme.tertiaryContainer,
                            textStyle: Theme.of(context)
                                .textTheme
                                .labelLarge!
                                .copyWith(
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
                                  : Icon(Icons.check,
                                      color: Theme.of(context)
                                          .colorScheme
                                          .onTertiaryContainer),
                              const SizedBox(width: 4),
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
          ),
          onTap: () => Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => PersonAccountScreen.get(
                  context: context, user: personCubit.user))),
        );
      },
    );
  }
}
