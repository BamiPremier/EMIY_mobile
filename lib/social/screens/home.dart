import 'dart:async';

import 'package:flutter/material.dart';
import 'package:potatoes/auto_list/bloc/auto_list_cubit.dart';
import 'package:potatoes/auto_list/widgets/auto_list_view.dart';
import 'package:potatoes/libs.dart';
import 'package:umai/social/cubit/new_post_cubit.dart';
import 'package:umai/social/model/post.dart';
import 'package:umai/social/screens/new_post_screen.dart';
import 'package:umai/social/screens/post_details.dart';
import 'package:umai/social/services/social_service.dart';
import 'package:umai/social/widget/item_post.dart';
import 'package:umai/utils/themes.dart';

class SocialHomeScreen extends StatefulWidget {
  const SocialHomeScreen({super.key});

  @override
  State<SocialHomeScreen> createState() => _SocialHomeScreenState();
}

class _SocialHomeScreenState extends State<SocialHomeScreen>
    with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      primary: false,
      body: Column(
        children: [
          // TODO: Implémenter la logique avec un cubit au liext de statefull builder

          BlocBuilder<NewPostCubit, NewPostState>(
            builder: (context, state) {
              return AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                height: (state is NewPostUploadingState ||
                        state is NewPostUploadedState)
                    ? 40.0
                    : 0.0, // Animation de hauteur
                width: double.infinity,
                curve: Curves.easeInOut,

                child: AnimatedSwitcher(
                  duration: const Duration(milliseconds: 1000),
                  transitionBuilder:
                      (Widget child, Animation<double> animation) {
                    final slideAnimation = Tween<Offset>(
                      begin: const Offset(0, 1),
                      end: Offset.zero,
                    ).animate(animation);
                    return SlideTransition(
                      position: slideAnimation,
                      child: FadeTransition(
                        opacity: animation,
                        child: child,
                      ),
                    );
                  },
                  child: state is NewPostUploadingState
                      ? Container(
                          padding: const EdgeInsets.all(8.0),
                          height: 40,
                          width: double.infinity,
                          decoration: const BoxDecoration(
                            color: AppTheme.primaryYellow,
                          ),
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Publication en cours...',
                            style: Theme.of(context).textTheme.labelMedium,
                          ),
                        )
                      : state is NewPostUploadedState
                          ? Container(
                              padding: const EdgeInsets.all(8.0),
                              height: 40,
                              width: double.infinity,
                              decoration: const BoxDecoration(
                                color: AppTheme.primaryYellow,
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Ton Social est publié!',
                                    style:
                                        Theme.of(context).textTheme.labelMedium,
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              PostDetailsScreen.fromNew(
                                            context: context,
                                            post: state.post,
                                          ),
                                        ),
                                      );
                                    },
                                    child: Text(
                                      'Voir',
                                      style: Theme.of(context)
                                          .textTheme
                                          .labelLarge,
                                    ),
                                  ),
                                ],
                              ),
                            )
                          : const SizedBox
                              .shrink(), // Si aucun état correspondant, on cache l'élément
                ),
              );
            },
          ),
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
        onPressed: () => Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => const NewPostScreen())),
        child: const Icon(Icons.add),
      ),
    );
  }
}
