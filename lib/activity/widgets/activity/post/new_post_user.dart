import 'package:flutter/material.dart';
import 'package:potatoes/libs.dart';
import 'package:readmore/readmore.dart'; 
import 'package:umai/activity/widgets/activity/actu_btn_type1.dart'; 
import 'package:umai/activity/widgets/activity/actu_head.dart'; 
import 'package:umai/common/bloc/common_cubit.dart'; 
import 'package:umai/common/screens/common_details.dart';
import 'package:umai/common/services/person_cubit_manager.dart'; 
import 'package:umai/social/bloc/post_cubit.dart';
import 'package:umai/social/models/post.dart';
import 'package:umai/social/services/post_cubit_manager.dart'; 
import 'package:umai/social/widgets/head_post.dart';
import 'package:umai/social/widgets/post_image.dart'; 

class NewPostUserWidget extends StatefulWidget {
  const NewPostUserWidget._({required this.targetEntity});
  final String targetEntity;

  static Widget get(
      {required BuildContext context,
      required Post post,
      required String targetEntity}) {
    return MultiBlocProvider(
      providers: [
        BlocProvider.value(value: context.read<PostCubitManager>().get(post)),
        BlocProvider<XCommonCubit<Post>>(
            create: (context) => context.read<PostCubit>()),
        BlocProvider.value(
            value: context.read<PersonCubitManager>().get(post.user)),
      ],
      child: NewPostUserWidget._(targetEntity: targetEntity),
    );
  }

  @override
  State<NewPostUserWidget> createState() => _NewPostUserWidgetState();
}

class _NewPostUserWidgetState extends State<NewPostUserWidget> {
  late final postCubit = context.read<PostCubit>();
  final isCollapsed = ValueNotifier<bool>(true);
  final _trimMode = TrimMode.Line;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PostCubit, XCommonState>(builder: (context, state) {
      final post = postCubit.x as Post;
      return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
       ActuHeadWidget.get(
              targetEntity: widget.targetEntity,
              context: context,
              user: post.user),
       
        Padding(
            padding: const EdgeInsets.only(bottom: 16, left: 16, right: 16,top:8),
            child: AnimatedSize(
                duration: const Duration(milliseconds: 300),
                alignment: Alignment.topCenter,
                curve: Curves.easeInOut,
                child: ReadMoreText(
                  post.content,
                  trimMode: _trimMode,
                  trimLines: 3,
                  isCollapsed: isCollapsed,
                  style: Theme.of(context).textTheme.bodySmall!.copyWith(
                        color: Theme.of(context).colorScheme.onSurfaceVariant,
                      ),
                  colorClickableText: Theme.of(context).primaryColor,
                  trimCollapsedText: 'Lire plus',
                  trimExpandedText: ' moins',
                ))),
        if (post.image?.isNotEmpty ?? false) PostImage(url: post.image!),
        ActuBtnType1Widget<Post>(onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
                builder: (context) => CommonDetailsScreen.fromPost(
                    context: context,
                    post: post,
                    head: (context) => const HeadPost())),
          );
        })
      ]);
    });
  }
}
