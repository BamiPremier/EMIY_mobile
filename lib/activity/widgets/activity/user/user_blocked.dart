import 'package:flutter/material.dart';
import 'package:potatoes/libs.dart'; 
import 'package:umai/account/screens/person_account.dart'; 
import 'package:umai/common/bloc/person_cubit.dart'; 
import 'package:umai/common/models/user.dart'; 
import 'package:umai/common/services/person_cubit_manager.dart'; 
import 'package:umai/common/widgets/profile_picture.dart'; 
import 'package:umai/utils/assets.dart';
import 'package:umai/utils/svg_utils.dart';
import 'package:umai/utils/themes.dart'; 

class UserBlockedWidget extends StatelessWidget {
  static Widget get({
    required BuildContext context,
    required User user,
  }) {
    return BlocProvider.value(
      value: context.read<PersonCubitManager>().get(user),
      child: UserBlockedWidget._(),
    );
  }

  const UserBlockedWidget._();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PersonCubit, PersonState>(
        listener: (context, state) {},
        builder: (context, state) {
          final personCubit = context.read<PersonCubit>();
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                child: Row(
                  children: <Widget>[
                    Stack(
                      alignment: Alignment.bottomRight,
                      children: [
                        GestureDetector(
                          child: const ProfilePicture(
                            image: "profile",
                            size: 32.0,
                          ),
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => PersonAccountScreen.get(
                                    context: context, user: personCubit.user)));
                          },
                        ),
                        Align(
                          alignment: Alignment.bottomRight,
                          child: Container(
                            decoration: BoxDecoration(
                                color: Theme.of(context)
                                    .colorScheme
                                    .onInverseSurface,
                                shape: BoxShape.circle),
                            height: 16,
                            width: 16,
                            padding: const EdgeInsets.all(3),
                            child: IconButton(
                              padding: EdgeInsets.zero,
                              icon: toSvgIcon(
                                icon: Assets.iconsLike,
                                size: 10,
                                color: Theme.of(context)
                                    .colorScheme
                                    .onSurfaceVariant,
                              ),
                              onPressed: () {},
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        "Tu as bloqué cette personne",
                        style: Theme.of(context).textTheme.bodyMedium,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding:
                    const EdgeInsets.all(8).add(const EdgeInsets.only(left: 8)),
                decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.onInverseSurface,
                    borderRadius: BorderRadius.circular(8)),
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        "Le contenu est masqué",
                        style: Theme.of(context).textTheme.titleSmall!.copyWith(
                              color: Theme.of(context)
                                  .colorScheme
                                  .onSurfaceVariant,
                            ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    FilledButton(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => PersonAccountScreen.get(
                                context: context, user: personCubit.user)));
                      },
                      style: FilledButton.styleFrom(
                          backgroundColor: AppTheme.mainText,
                          foregroundColor: AppTheme.white,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 40, vertical: 12),
                          minimumSize: Size.zero),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            'VOIR',
                            style: Theme.of(context)
                                .textTheme
                                .labelLarge!
                                .copyWith(color: AppTheme.white),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ],
          );
        });
  }
}
