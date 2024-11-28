import 'package:flutter/material.dart';
import 'package:potatoes/libs.dart';
import 'package:umai/common/screens/common_details.dart';
import 'package:umai/social/bloc/new_post_cubit.dart';
import 'package:umai/utils/dialogs.dart';
import 'package:umai/utils/themes.dart';

class NewPostBanner extends StatefulWidget {
  const NewPostBanner({super.key});

  @override
  State<NewPostBanner> createState() => _NewPostBannerState();
}

class _NewPostBannerState extends State<NewPostBanner> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewPostCubit, NewPostState>(
     listener: (context, state) {
        if (state is NewPostErrorState) {
           showErrorToast(content: state.error, context: context);
          }
      },  builder: (context, state) {
        return AnimatedSwitcher(
          duration: const Duration(milliseconds: 500),
          switchInCurve: Curves.easeInOut,
          switchOutCurve: Curves.easeInOut,
          transitionBuilder: (Widget child, Animation<double> animation) {
            final slideAnimation = Tween<Offset>(
              begin: const Offset(0, -1),
              end: Offset.zero,
            ).animate(animation);
            return SlideTransition(
              position: slideAnimation,
              child: SizeTransition(
                sizeFactor: animation,
                child: FadeTransition(
                  opacity: animation,
                  child: child,
                ),
              ),
            );
          },
          child: state is NewPostUploadingState
              ? Container(
                  alignment: Alignment.centerLeft,
                  color: AppTheme.primaryYellow,
                  height: 40,
                  width: double.infinity,
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Publication en cours...',
                    style: Theme.of(context).textTheme.labelMedium,
                  ),
                )
              : state is NewPostUploadedState
                  ? Container(
                      color: AppTheme.primaryYellow,
                      height: 40,
                      width: double.infinity,
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Ton Social est publié!',
                            style: Theme.of(context).textTheme.labelMedium,
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      CommonDetailsScreen.fromPost(
                                          context: context,
                                          post: state.post,
                                      ),
                                ),
                              );
                            },
                            child: Text(
                              'Voir',
                              style: Theme.of(context).textTheme.labelLarge,
                            ),
                          ),
                        ],
                      ),
                    )
                  : const SizedBox(
                      width: double
                          .infinity), // Si aucun état correspondant, on cache l'élément
        );
      },
    );
  }
}
