import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:potatoes/libs.dart';
import 'package:umai/account/screens/param/change_picture_screen.dart';
import 'package:umai/common/bloc/user_cubit.dart';
import 'package:umai/utils/assets.dart';
import 'package:umai/utils/themes.dart';

class EditProfilePictureScreen extends StatelessWidget {
  const EditProfilePictureScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: AppTheme.fullBlackTheme(context),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Photo de profil'),
          centerTitle: true,
          actions: [
            PopupMenuButton(
              itemBuilder: (_) => [
                const PopupMenuItem(
                  value: ImageSource.camera,
                  child: ListTile(
                    leading: Icon(Icons.camera_alt),
                    minLeadingWidth: 24.0,
                    title: Text('Prendre une photo'),
                    dense: true,
                  ),
                ),
                const PopupMenuItem(
                  value: ImageSource.gallery,
                  child: ListTile(
                    leading: Icon(Icons.image),
                    minLeadingWidth: 24.0,
                    title: Text('Choisir une image'),
                    dense: true,
                  ),
                ),
              ],
              onSelected: (value) =>
                  onPickImage(source: value, context: context),
              icon: const Icon(
                Icons.mode_edit_outline_outlined,
              ),
            )
          ],
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CachedNetworkImage(
                imageUrl: context.read<UserCubit>().user.imageFull ?? '',
                // height: 375,
                width: double.infinity,
                fit: BoxFit.cover,
                // imageBuilder: (context, imageProvider) => Container(
                //   margin: const EdgeInsets.only(right: 16),
                //   child: CircleAvatar(
                //     radius: 40,
                //     backgroundImage: imageProvider,
                //   ),
                // ),
                placeholder: (context, url) => SvgPicture.asset(
                  Assets.defaultAvatar,
                  height: 48.0,
                  width: 48.0,
                ),
                errorWidget: (context, url, error) => SvgPicture.asset(
                  Assets.defaultAvatar,
                  height: 48.0,
                  width: 48.0,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  onPickImage({required ImageSource source, required BuildContext context}) {
    ImagePicker().pickImage(source: source).then((image) {
      if (image == null) return;

      Navigator.of(context).push(
        MaterialPageRoute(
            builder: (context) => ChangePictureScreen(image: image)),
      );
    });
  }
}
