import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:photo_manager/photo_manager.dart';
import 'package:potatoes/auto_list/bloc/auto_list_cubit.dart';
import 'package:potatoes/auto_list/widgets/auto_list_view.dart';
import 'package:potatoes/libs.dart';
import 'package:umai/social/model/post.dart';
import 'package:umai/social/screens/new_post_screen.dart';
import 'package:umai/social/services/social_service.dart';
import 'package:umai/social/widget/item_post.dart';
import 'package:umai/social/widget/new_post_banner.dart';

class SocialHomeScreen extends StatefulWidget {
  const SocialHomeScreen({super.key});

  @override
  State<SocialHomeScreen> createState() => _SocialHomeScreenState();
}

class _SocialHomeScreenState extends State<SocialHomeScreen>
    with TickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
  }

  Future<bool> requestPermission() async {
    final status = await Permission.camera.request();
    if (status.isGranted) {
      final PermissionState photoManagerStatus =
          await PhotoManager.requestPermissionExtend();
      if (photoManagerStatus == PermissionState.denied) {
        print('Permission refusée');
        return false;
      } else {
        print('Permission acceptée');
        return true;
      }
    } else {
      print('Permission photos refusée');
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      primary: false,
      body: Column(
        children: [
          const NewPostBanner(),
          Expanded(
              child: AutoListView.get<Post>(
                  padding: EdgeInsets.only(
                      bottom: MediaQuery.of(context).viewInsets.bottom),
                  cubit: AutoListCubit(
                      provider: context.read<SocialService>().getFeed),
                  itemBuilder: (context, post) =>
                      PostItem.get(context: context, post: post),
                  errorBuilder: (context, retry) => Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Text("An error occured"),
                          TextButton(
                            onPressed: retry,
                            child: const Text("Retry"),
                          )
                        ],
                      ))),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          bool hasPermission = await requestPermission();
          if (hasPermission) {
            Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => const NewPostScreen()),
            );
          } else {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                  content: Text(
                      "Vous devez accorder la permission d'accès aux photos pour continuer.")),
            );
          }
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
