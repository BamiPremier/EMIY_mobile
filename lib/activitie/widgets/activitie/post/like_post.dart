import 'package:flutter/material.dart';
import 'package:potatoes/libs.dart';
import 'package:readmore/readmore.dart';
import 'package:umai/account/screens/person_account.dart';
import 'package:umai/activitie/widgets/activitie/actu_btn_type1.dart';
import 'package:umai/activitie/widgets/activitie/actu_btn_type3.dart';
import 'package:umai/activitie/widgets/activitie/actu_head.dart';
import 'package:umai/activitie/widgets/activitie/post/post_actu_image.dart';
import 'package:umai/common/bloc/common_cubit.dart';
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
import 'package:umai/social/services/post_cubit_manager.dart';
import 'package:umai/social/services/social_service.dart';
import 'package:umai/social/widgets/post_image.dart';
import 'package:umai/utils/assets.dart';
import 'package:umai/utils/svg_utils.dart';
import 'package:umai/utils/themes.dart';
import 'package:umai/utils/time_elapsed.dart';

class LikePostWidget extends StatefulWidget {
  LikePostWidget._();

  static Widget get({required BuildContext context, required Post post,
  
      required User user
  }) {
    return MultiBlocProvider(
      providers: [
        BlocProvider.value(value: context.read<PostCubitManager>().get(post)),
        BlocProvider<XCommonCubit<Post>>(
            create: (context) => context.read<PostCubit>()),
        BlocProvider.value(
            value: context.read<PersonCubitManager>().get(post.user)),
       BlocProvider<PersonCubit>.value(
          value: context.read<PersonCubitManager>().get(user),
        ),  ],
      child: LikePostWidget._(),
    );
  }

  @override
  State<LikePostWidget> createState() => _LikePostWidgetState();
}

class _LikePostWidgetState extends State<LikePostWidget> {
  late final postCubit = context.read<PostCubit>();
  final isCollapsed = ValueNotifier<bool>(true);
  final _trimMode = TrimMode.Line;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PostCubit, XCommonState>(builder: (context, state) {
      final post = postCubit.x as Post;
      final personCubit = context.read<PersonCubit>();

      final user = personCubit.user; return Container(
        padding: const EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ActuHeadWidget.get(
                action: " a aimé", context: context, user: user),

            const SizedBox(height: 8),
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.onInverseSurface,
                  borderRadius: BorderRadius.circular(8)),
              child: Column(
                children: [
                  Row(
                    children: <Widget>[
                      GestureDetector(
                        child: const ProfilePicture(
                          image: "user.image",
                          size: 24.0,
                        ),
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => PersonAccountScreen.get(
                                  context: context, user: post.user)));
                        },
                      ),
                      const SizedBox(width: 4),
                      Expanded(
                        child: GestureDetector(
                          child: Text(
                            post.user.username,
                            style:
                                Theme.of(context).textTheme.bodyLarge!.copyWith(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .onSurfaceVariant,
                                    ),
                            overflow: TextOverflow.ellipsis,
                          ),
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => PersonAccountScreen.get(
                                    context: context, user: post.user)));
                          },
                        ),
                      ),
                      Text(
                        "Il y a 16h",
                        style: Theme.of(context)
                            .textTheme
                            .labelMedium!
                            .copyWith(color: AppTheme.disabledText),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  AnimatedSize(
                      duration: const Duration(milliseconds: 300),
                      alignment: Alignment.topCenter,
                      curve: Curves.easeInOut,
                      child: ReadMoreText(
                        post.content,
                        trimMode: _trimMode,
                        trimLines: 3,
                        isCollapsed: isCollapsed,
                        style: Theme.of(context).textTheme.bodySmall!.copyWith(
                              color: Theme.of(context)
                                  .colorScheme
                                  .onSurfaceVariant,
                            ),
                        colorClickableText: Theme.of(context).primaryColor,
                        trimCollapsedText: 'Lire plus',
                        trimExpandedText: ' moins',
                      )),
                  const SizedBox(height: 8),
                  if (post.image?.isNotEmpty ?? false)
                    PostActuImage(url: post.image!),
                ],
              ),
            ),
            ActuBtnType1Widget()
          ],
        ),
      );
    });
  }
}
