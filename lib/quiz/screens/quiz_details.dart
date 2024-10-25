import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';
import 'package:umai/common/widgets/action_widget.dart';
import 'package:umai/common/widgets/bottom_sheet.dart';
import 'package:umai/quiz/models/quiz.dart';
import 'package:umai/quiz/widgets/item_user_quiz.dart';
import 'package:umai/quiz/widgets/quiz_info.dart';
import 'package:umai/utils/themes.dart';

class QuizDetailScreen extends StatefulWidget {
  final Quiz? quiz;
  QuizDetailScreen({required this.quiz});
  @override
  State<QuizDetailScreen> createState() => _QuizDetailScreenState();
}

class _QuizDetailScreenState extends State<QuizDetailScreen>
    with SingleTickerProviderStateMixin {
  final _trimMode = TrimMode.Line;
  final isCollapsed = ValueNotifier<bool>(true);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: Theme.of(context).colorScheme.tertiaryContainer,
            expandedHeight: 200,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              background: Stack(
                fit: StackFit.expand,
                children: [
                  CachedNetworkImage(
                    imageUrl:
                        "https://s4.anilist.co/file/anilistcdn/media/anime/cover/large/bx21856-gutauxhWAwn6.png",
                    fit: BoxFit.cover,
                    errorWidget: (context, url, error) => Icon(
                      Icons.error,
                      color: Theme.of(context).colorScheme.onTertiaryContainer,
                      size: 32,
                    ),
                  ),
                  Align(
                    alignment: Alignment.topCenter,
                    child: Container(
                      height: MediaQuery.of(context).viewPadding.top +
                          kToolbarHeight,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Theme.of(context).colorScheme.inverseSurface,
                            Colors.transparent
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            leading: BackButton(
                style: ButtonStyle(
              foregroundColor: MaterialStateProperty.all(AppTheme.white),
            )),
            actions: [
              IconButton(
                padding: EdgeInsets.zero,
                onPressed: () => actionsOptions(),
                color: AppTheme.white,
                icon: const Icon(Icons.more_vert),
              ),
            ],
          ),
          const SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.only(
                  top: 8.0, bottom: 32, left: 16.0, right: 16.0),
              child: QuizInfo(),
            ),
          ),
          SliverToBoxAdapter(
              child: ListView.builder(
            itemCount: 5,
            itemBuilder: (context, index) => UserItemQuiz(),
          )),
        ],
      ),
    );
  }

  void actionsOptions() => showAppBottomSheet(
      context: context,
      horizontalPadding: 16.0,
      builder: (_) => Padding(
          padding: const EdgeInsets.only(top: 24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              ActionWidget(
                title: 'Partager...',
                icon: Icons.share_outlined,
                onTap: () => print(''),
              ),
              const SizedBox(
                height: 16,
              ),
            ],
          )));
}
