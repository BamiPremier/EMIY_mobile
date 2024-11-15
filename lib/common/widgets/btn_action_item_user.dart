import 'package:flutter/material.dart';
import 'package:potatoes/libs.dart';
import 'package:umai/common/bloc/person_cubit.dart';
import 'package:umai/common/bloc/user_cubit.dart';
import 'package:umai/utils/assets.dart';
import 'package:umai/utils/svg_utils.dart';
import 'package:umai/utils/themes.dart';

class BtnActionitemUser extends StatelessWidget {
  const BtnActionitemUser({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserCubit, UserState>(
      builder: (context, stateUser) {
        return BlocBuilder<PersonCubit, PersonState>(
          builder: (context, state) {
            final userCubit = context.read<UserCubit>();
            final personCubit = context.read<PersonCubit>();
            if (stateUser is! CompleteUserProfileState) if (personCubit
                    .user.id ==
                userCubit.user.id) return const SizedBox();

            final onPressed, backgroundColor, foregroundColor, icon, text;
            if (personCubit.user.hasBlocked) {
              onPressed = personCubit.unBlockUser;
              backgroundColor = AppTheme.mainText;
              foregroundColor = AppTheme.white;
              text = Text(
                'Débloquer',
                style: Theme.of(context)
                    .textTheme
                    .labelLarge!
                    .copyWith(color: AppTheme.white),
              );
              if (state is PersonLoadingBlockState) {
                icon = const SizedBox(
                  width: 16,
                  height: 16,
                  child: CircularProgressIndicator(
                    strokeWidth: 2,
                    color: AppTheme.white,
                  ),
                );
              } else
                icon = const Icon(Icons.block_flipped);
            } else if (personCubit.user.followed) {
              onPressed = personCubit.unFollowUser;
              backgroundColor = Theme.of(context).colorScheme.tertiaryContainer;
              foregroundColor =
                  Theme.of(context).colorScheme.onTertiaryContainer;
              text = Text(
                'Ajouté(e)',
                style: Theme.of(context).textTheme.labelLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onTertiaryContainer),
              );
              if (state is PersonLoadingState) {
                icon = SizedBox(
                  width: 16,
                  height: 16,
                  child: CircularProgressIndicator(
                    strokeWidth: 2,
                    color: Theme.of(context).colorScheme.onTertiaryContainer,
                  ),
                );
              } else
                icon = toSvgIcon(
                  icon: Assets.iconsTick,
                  height: 16,
                  width: 16,
                  color: Theme.of(context).colorScheme.onTertiaryContainer,
                );
            } else {
              onPressed = personCubit.followUser;
              backgroundColor = null;
              foregroundColor = null;
              text = Text(
                'Ajouter',
                style: Theme.of(context).textTheme.labelLarge,
              );
              if (state is PersonLoadingState) {
                icon = SizedBox(
                  width: 16,
                  height: 16,
                  child: CircularProgressIndicator(
                    strokeWidth: 2,
                    color: Theme.of(context).textTheme.labelLarge?.color,
                  ),
                );
              } else
                 icon = toSvgIcon(
                  icon: Assets.iconsMore,
                  height: 16,
                  width: 16,
                  color: Theme.of(context).textTheme.labelLarge?.color,
                );
            }

            return FilledButton(
              onPressed: onPressed,
              style: FilledButton.styleFrom(
                  backgroundColor: backgroundColor,
                  foregroundColor: foregroundColor,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  minimumSize: Size.zero),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [icon, const SizedBox(width: 4.0), text],
              ),
            );
          },
        );
      },
    );
  }
}
