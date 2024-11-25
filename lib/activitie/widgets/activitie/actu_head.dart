import 'package:flutter/material.dart';
import 'package:potatoes/libs.dart';
import 'package:readmore/readmore.dart';
import 'package:umai/account/screens/person_account.dart';
import 'package:umai/common/bloc/person_cubit.dart';
import 'package:umai/common/bloc/user_cubit.dart';
import 'package:umai/common/models/user.dart';
import 'package:umai/common/services/person_cubit_manager.dart';
import 'package:umai/common/services/report_util_service.dart';
import 'package:umai/common/widgets/bottom_sheet.dart';
import 'package:umai/common/widgets/buttons.dart';
import 'package:umai/common/widgets/profile_picture.dart';
import 'package:umai/social/bloc/post_cubit.dart';
import 'package:umai/social/models/post.dart';
import 'package:umai/social/services/social_service.dart';
import 'package:umai/utils/assets.dart';
import 'package:umai/utils/svg_utils.dart';
import 'package:umai/utils/themes.dart';
import 'package:umai/utils/time_elapsed.dart';

class ActuHeadWidget extends StatelessWidget {
  final String action;

  static Widget get({
    required BuildContext context,
    required User user,
    required String action,
  }) {
    return BlocProvider.value(
      value: context.read<PersonCubitManager>().get(user),
      child: ActuHeadWidget._(action: action),
    );
  }

  ActuHeadWidget._({required this.action});
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PersonCubit, PersonState>(
        listener: (context, state) {},
        builder: (context, state) {
          final personCubit = context.read<PersonCubit>();
          final user = personCubit.user;
          return Container(
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
                        //  Navigator.of(context).push(MaterialPageRoute(
                        //     builder: (context) => PersonAccountScreen.get(
                        //         context: context, user: user)));
                      },
                    ),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: Container(
                        decoration: BoxDecoration(
                            color:
                                Theme.of(context).colorScheme.onInverseSurface,
                            shape: BoxShape.circle),
                        height: 16,
                        width: 16,
                        padding: const EdgeInsets.all(3),
                        child: IconButton(
                          padding: EdgeInsets.zero,
                          icon: toSvgIcon(
                            icon: Assets.iconsLike,
                            size: 10,
                            color:
                                Theme.of(context).colorScheme.onSurfaceVariant,
                          ),
                          onPressed: () {},
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: GestureDetector(
                    child: RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: "user.username",
                            style: Theme.of(context).textTheme.bodyLarge,
                          ),
                          WidgetSpan(
                            child: Text(
                              " $action",
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                          ),
                        ],
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => PersonAccountScreen.get(
                              context: context, user: user)));
                    },
                  ),
                ),
              ],
            ),
          );
        });
  }
}
