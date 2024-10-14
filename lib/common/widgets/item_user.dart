import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:potatoes/libs.dart';
import 'package:umai/common/bloc/person_cubit.dart';
import 'package:umai/common/bloc/user_cubit.dart';
import 'package:umai/common/models/user.dart';
import 'package:umai/utils/themes.dart';

class UserItem extends StatelessWidget {
  static Widget get({required BuildContext context, required User user}) {
    return BlocProvider(
      create: (context) => PersonCubit(context.read(), user),
      child: const UserItem._(),
    );
  }

  const UserItem._();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PersonCubit, PersonState>(
      listener: (context, state) {
        if (state is InitializingPersonState) {
          final userCubit = context.read<UserCubit>();
          userCubit.refreshData();
        }
      },
      builder: (context, state) {
        final followCubit = context.read<PersonCubit>();
        return ListTile(
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 0.0, vertical: 0.0),
          leading: CachedNetworkImage(
            imageUrl: followCubit.user.imageFull ?? '',
            imageBuilder: (context, imageProvider) => CircleAvatar(
              radius: 28,
              backgroundImage: imageProvider,
            ),
            placeholder: (context, url) => const CircleAvatar(
              radius: 28,
              child: CircularProgressIndicator(strokeWidth: 2),
            ),
            errorWidget: (context, url, error) => const CircleAvatar(
              radius: 28,
              child: Icon(Icons.person, size: 28, color: Colors.white),
            ),
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
                    textStyle: Theme.of(context).textTheme.labelLarge!.copyWith(
                          color: AppTheme.mainText,
                        ),
                    padding:
                        const EdgeInsets.symmetric(vertical: 6, horizontal: 12),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      state is PersonLoadingState
                          ? const SizedBox(
                              width: 20,
                              height: 20,
                              child: CircularProgressIndicator(
                                strokeWidth: 2,
                                color: AppTheme.white,
                              ),
                            )
                          : const Icon(
                              Icons.add,
                            ),
                      const SizedBox(width: 8),
                      Text(
                        'Ajouter',
                        style: Theme.of(context).textTheme.labelLarge!.copyWith(
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
                    textStyle: Theme.of(context).textTheme.labelLarge!.copyWith(
                          color:
                              Theme.of(context).colorScheme.onTertiaryContainer,
                        ),
                    padding:
                        const EdgeInsets.symmetric(vertical: 6, horizontal: 12),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      state is PersonLoadingState
                          ? const SizedBox(
                              width: 20,
                              height: 20,
                              child: CircularProgressIndicator(
                                strokeWidth: 2,
                                color: AppTheme.white,
                              ),
                            )
                          : const Icon(Icons.check),
                      const SizedBox(width: 8),
                      Text(
                        'Ajouté(e)',
                        style: Theme.of(context).textTheme.labelLarge!.copyWith(
                            color: Theme.of(context)
                                .colorScheme
                                .onTertiaryContainer),
                      ),
                    ],
                  ),
                ),
        );
      },
    );
  }
}
