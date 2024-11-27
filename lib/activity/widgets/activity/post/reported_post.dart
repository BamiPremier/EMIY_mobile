import 'package:flutter/material.dart';
import 'package:potatoes/libs.dart'; 
import 'package:umai/account/screens/person_account.dart'; 
import 'package:umai/common/bloc/common_cubit.dart'; 
import 'package:umai/common/screens/common_details.dart';
import 'package:umai/common/services/person_cubit_manager.dart'; 
import 'package:umai/common/widgets/profile_picture.dart';
import 'package:umai/social/bloc/post_cubit.dart';
import 'package:umai/social/models/post.dart';
import 'package:umai/social/services/post_cubit_manager.dart'; 
import 'package:umai/social/widgets/head_post.dart'; 
import 'package:umai/utils/assets.dart';
import 'package:umai/utils/svg_utils.dart';
import 'package:umai/utils/themes.dart'; 

class ReportedPostWidget extends StatefulWidget {
  const ReportedPostWidget._({
    required this.targetEntity,
  });
  final String targetEntity;

  static Widget get(
      {required BuildContext context,
      required String targetEntity,
      required Post post}) {
    return MultiBlocProvider(
      providers: [
        BlocProvider.value(value: context.read<PostCubitManager>().get(post)),
        BlocProvider<XCommonCubit<Post>>(
            create: (context) => context.read<PostCubit>()),
        BlocProvider.value(
            value: context.read<PersonCubitManager>().get(post.user)),
      ],
      child: ReportedPostWidget._(targetEntity: targetEntity),
    );
  }

  @override
  State<ReportedPostWidget> createState() => _ReportedPostWidgetState();
}

class _ReportedPostWidgetState extends State<ReportedPostWidget> {
  late final postCubit = context.read<PostCubit>();
  final isCollapsed = ValueNotifier<bool>(true);
 
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PostCubit, XCommonState>(builder: (context, state) {
      final post = postCubit.x as Post;
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
                      child: ProfilePicture(
                        image: post.user.image,
                        size: 32.0,
                      ),
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => PersonAccountScreen.get(
                                context: context, user: post.user)));
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
                  child: Text(
                    "Tu as signalé un social",
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
                          color: Theme.of(context).colorScheme.onSurfaceVariant,
                        ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                FilledButton(
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                          builder: (context) => CommonDetailsScreen.fromPost(
                              context: context,
                              post: post,
                              head: (context) => const HeadPost())),
                    );
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
