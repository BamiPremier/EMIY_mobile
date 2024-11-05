
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:potatoes/libs.dart';
import 'package:umai/common/bloc/user_cubit.dart';
import 'package:umai/common/services/cache_manager.dart';
import 'package:umai/utils/assets.dart';

class ProfilePicture extends StatelessWidget {
  final String? image;
  final double height;
  final double width;

  const ProfilePicture({
    super.key,
    required this.image,
    this.height = 80,
    this.width = 80,
  });

  @override
  Widget build(BuildContext context) {
    final defaultImage = SvgPicture.asset(
      Assets.defaultAvatar,
      height: height,
      width: width,
    );

    if (image == null) return defaultImage;
    return Container(
      height: height,
      width: width,
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
  final double height;
  final double width;

  const UserProfilePicture({
    super.key,
    this.height = 40.0,
    this.width = 40.0,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserCubit, UserState>(
      buildWhen: (_, state) => state is UserLoggedState,
      builder: (_, __) => ProfilePicture(
        image: context.read<UserCubit>().user.image,
        height: height,
        width: width,
      ),
    );
  }
}
