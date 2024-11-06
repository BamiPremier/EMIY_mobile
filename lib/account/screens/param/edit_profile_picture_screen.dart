 
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:potatoes/libs.dart';
import 'package:umai/account/screens/param/change_picture_screen.dart';
import 'package:umai/common/bloc/user_cubit.dart';
import 'package:umai/common/services/cache_manager.dart';
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
        body: BlocBuilder<UserCubit, UserState>(
          buildWhen: (_, state) => state is UserLoggedState,
          builder: (_, __) => Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image(
                  fit: BoxFit.cover,
                  image: context
                      .read<AppCacheManager>()
                      .getImage(context.read<UserCubit>().user.imageFull ?? ''),
                  width: double.infinity,
                  errorBuilder: (context, url, error) => Container(
                    height: 368,
                    width: double.infinity,
                    color: Theme.of(context).colorScheme.tertiaryContainer,
                  ),
                ),
              ],
            ),
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
