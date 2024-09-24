import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:umai/account/screens/param/change_picture_screen.dart';
import 'package:umai/common/widgets/bottom_sheet.dart';
import 'package:umai/utils/themes.dart';

class EditProfilePictureScreen extends StatelessWidget {
  const EditProfilePictureScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ThemeApp.black,
        title: Text('Photo de profil',
            style: Theme.of(context)
                .appBarTheme
                .titleTextStyle!
                .copyWith(color: ThemeApp.white)),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: ThemeApp.white),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        actions: [
          PopupMenuButton(
            itemBuilder: (_) => [
              /*const PopupMenuItem(
              child: ListTile(
                leading: Icon(Icons.mic),
                minLeadingWidth: 24.0,
                title: Text('Message vocal'),
                dense: true,
              ),
            ),*/
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
            elevation: 4.0,
            offset: const Offset(0, -120),
            onSelected: (value) => onPickImage(source: value, context: context),
            child: Container(
              height: 24.0,
              width: 24.0,
              child: const Icon(
                Icons.mode_edit_outline_outlined,
                color: ThemeApp.white,
              ),
            ),
          )
        ],
      ),
      backgroundColor: ThemeApp.black,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.network(
              'https://img.freepik.com/photos-gratuite/representations-experience-utilisateur-design-interface_23-2150104489.jpg?t=st=1726481260~exp=1726484860~hmac=71aa8b5d32271a5f3d6a968bb6731cb8d35a797e60f574caa80514a1ff4bcac3&w=900',
              height: 375,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ],
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
