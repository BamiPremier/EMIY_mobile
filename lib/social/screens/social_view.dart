import 'package:flutter/material.dart';
import 'package:potatoes/auto_list/widgets/auto_list_view.dart';
import 'package:potatoes/libs.dart';
import 'package:umai/social/cubit/post_cubit.dart';
import 'package:umai/social/cubit/social_cubit.dart';
import 'package:umai/social/model/post_response.dart';
import 'package:umai/social/widget/post_social_card.dart';
import 'package:umai/utils/themes.dart';

class SocialView extends StatelessWidget {
  const SocialView({super.key});

  @override
  Widget build(BuildContext context) {
    late final socialCubit = context.read<SocialCubit>();

    late final postCubit = context.read<PostCubit>();

    return Column(
      children: [
        BlocBuilder<SocialCubit, SocialState>(
          builder: (context, state) {
            if (state is NewPostLoadingState) {
              return Container(
                padding: const EdgeInsets.all(8.0),
                height: 32,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: ThemeApp.primaryYellow,
                ),
                child: Text(
                  'Publication en cours...',
                  style: Theme.of(context).textTheme.labelMedium,
                ),
              );
            } else if (state is NewPostSuccessState) {
              return Container(
                  padding: const EdgeInsets.all(8.0),
                  height: 40,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: ThemeApp.primaryYellow,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Ton Social est publié!',
                        style: Theme.of(context).textTheme.labelMedium,
                      ),
                      Text(
                        'Voir',
                        style: Theme.of(context).textTheme.labelLarge,
                      ),
                    ],
                  ));
            } else {
              return SizedBox
                  .shrink(); // Ne rien afficher si la publication n'est pas en cours
            }
          },
        ),
        Expanded(
            child: AutoListView.get<Post>(
                padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).viewInsets.bottom),
                cubit: postCubit,
                itemBuilder: (context, post) => PostSocialCard(
                      post: post,
                    ),
                emptyBuilder: (context) => const Center(
                      child: Text("Empty list"),
                    ),
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
    );
  }
}
