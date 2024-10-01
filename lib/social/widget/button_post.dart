import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:potatoes/libs.dart';
import 'package:umai/auth/bloc/auth_cubit.dart';
import 'package:umai/common/bloc/follow_cubit.dart';
import 'package:umai/common/bloc/user_cubit.dart';
import 'package:umai/common/widgets/image_profil.dart';
import 'package:umai/social/cubit/post_manip_cubit.dart';
import 'package:umai/social/model/post.dart';
import 'package:umai/social/screens/post_details.dart';
import 'package:umai/utils/assets.dart';
import 'package:umai/utils/themes.dart';

class ButtonPost extends StatelessWidget {
  final PostManipCubit postCubit;

  const ButtonPost({required this.postCubit});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PostManipCubit, PostManipState>(
        builder: (context, state) {
      final post = postCubit.post!;
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              post.hasLiked
                  ? IconButton(
                      icon: const Icon(
                        Icons.favorite,
                        color: Colors.red,
                      ),
                      onPressed: () {
                        postCubit.unLikePost();
                      },
                    )
                  : IconButton(
                      icon: const Icon(
                        Icons.favorite_border,
                        color: Colors.black,
                      ),
                      onPressed: () {
                        postCubit.likePost();
                      },
                    ),
              IconButton(
                icon: const Icon(Icons.chat_bubble_outline),
                onPressed: () {},
              ),
            ],
          ),
          IconButton(
            icon: const Icon(Icons.share),
            onPressed: () {},
          ),
        ],
      );
    });
  }
}
