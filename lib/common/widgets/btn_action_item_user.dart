import 'package:flutter/material.dart';
import 'package:potatoes/libs.dart'; 
import 'package:umai/common/bloc/person_cubit.dart';
import 'package:umai/common/bloc/user_cubit.dart'; 
import 'package:umai/utils/themes.dart';

class BtnActionItemUser extends StatelessWidget {
  const BtnActionItemUser({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PersonCubit, PersonState>(
      builder: (context, state) {
        final userCubit = context.read<UserCubit>();

        final personCubit = context.read<PersonCubit>();
        return personCubit.user == userCubit.user
            ? const SizedBox()
            : personCubit.user.hasBlocked
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
                        ));
      },
    );
  }
}
