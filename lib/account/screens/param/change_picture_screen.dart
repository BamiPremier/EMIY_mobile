import 'package:flutter/material.dart';
import 'package:umai/common/widgets/buttons.dart';
import 'package:umai/utils/themes.dart';

class ChangePictureScreen extends StatelessWidget {
  const ChangePictureScreen({super.key});

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
          IconButton(
            icon: const Icon(Icons.mode_edit_outline_outlined,
                color: ThemeApp.white),
            onPressed: () {},
          ),
        ],
      ),
      backgroundColor: ThemeApp.black,
      body: SafeArea(
          minimum: const EdgeInsets.only(bottom: 48),
          child: Center(
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
          )),
      bottomNavigationBar: SafeArea(
        minimum: const EdgeInsets.symmetric(horizontal: 32.0, vertical: 16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            UmaiButton.primary(
              onPressed: () => print(''),
              text: "Enregistrer",
            ),
          ],
        ),
      ),
    );
  }
}
