import 'package:flutter/material.dart';
import 'package:potatoes/libs.dart';
import 'package:umai/common/bloc/user_cubit.dart';
import 'package:umai/common/services/cache_manager.dart';
import 'package:umai/utils/assets.dart';
import 'package:umai/utils/svg_utils.dart';

class ProfilePicture extends StatelessWidget {
  final String? image;
  final double size;

  const ProfilePicture({
    super.key,
    required this.image,
    this.size = 80,
  });

  @override
  Widget build(BuildContext context) {
    final defaultImage = toSvgIcon(
      icon: Assets.defaultAvatar,
      size: size
    );
    if (image == null) return defaultImage;
    return Container(
      height: size,
      width: size,
      clipBehavior: Clip.hardEdge,
      decoration: const BoxDecoration(shape: BoxShape.circle),
      child: Image(
        fit: BoxFit.cover,
        image: context.read<AppCacheManager>().getImage(image ?? ''),
        errorBuilder: (context, url, error) => defaultImage,
      ),
    );
  }
}

class UserProfilePicture extends StatelessWidget {
  final double size;

  const UserProfilePicture({
    super.key,
    this.size = 40.0,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserCubit, UserState>(
      buildWhen: (_, state) => state is UserLoggedState,
      builder: (_, state) => ProfilePicture(
        image: state is! CompleteUserProfileState
            ? context.read<UserCubit>().user.image
            : null,
        size: size,
      ),
    );
  }
}
