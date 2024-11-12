import 'package:flutter/material.dart';
import 'package:potatoes/libs.dart';
import 'package:umai/common/bloc/common_cubit.dart';
import 'package:umai/common/screens/common_details.dart';
import 'package:umai/common/services/person_cubit_manager.dart';
import 'package:umai/social/bloc/post_cubit%20copy.dart';
import 'package:umai/social/bloc/post_cubit.dart';
import 'package:umai/social/model/post.dart';
import 'package:umai/social/screens/post_details.dart';
import 'package:umai/social/services/post_cubit_manager.dart';
import 'package:umai/social/widget/action_post.dart';
import 'package:umai/social/widget/button_post.dart';
import 'package:readmore/readmore.dart';
import 'package:umai/social/widget/post_image.dart';

class HeadPost extends StatefulWidget {
  @override
  State<HeadPost> createState() => _HeadPostState();
}

class _HeadPostState extends State<HeadPost> {
  late final postCubit = context.read<PostCubit>();
  final isCollapsed = ValueNotifier<bool>(true);
  final _trimMode = TrimMode.Line;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PostCubit, XCommonState>(builder: (context, state) {
      final post = postCubit.x as Post;
      return Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            MultiBlocProvider(
              providers: [
                BlocProvider.value(
                    value: context.read<PostCubitManager>().get(post)),
                BlocProvider.value(
                    value: context.read<PersonCubitManager>().get(post.user)),
              ],
              child: const PostAction(),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: AnimatedSize(
                duration: const Duration(milliseconds: 300),
                alignment: Alignment.topCenter,
                curve: Curves.easeInOut,
                child: ReadMoreText(
                  post.itemContent,
                  trimMode: _trimMode,
                  trimLines: 3,
                  trimLength: 240,
                  isCollapsed: isCollapsed,
                  style: Theme.of(context).textTheme.bodyMedium,
                  colorClickableText: Theme.of(context).primaryColor,
                  trimCollapsedText: 'Lire plus',
                  trimExpandedText: ' moins',
                ),
              ),
            ),
            const SizedBox(height: 8.0),
            if (post.itemImage?.isNotEmpty ?? false)
              PostImage(url: post.itemImage!),
          ]);
    });
  }
}
