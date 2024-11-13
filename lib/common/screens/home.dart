import 'package:flutter/material.dart';
import 'package:potatoes/common/widgets/loaders.dart';
import 'package:potatoes/libs.dart';
import 'package:umai/account/screens/account.dart';
import 'package:umai/account/screens/person_account.dart';
import 'package:umai/animes/bloc/load_episode_anime_cubit.dart';
import 'package:umai/animes/screens/home.dart';
import 'package:umai/common/bloc/home_cubit.dart';
import 'package:umai/common/bloc/link_cubit.dart';
import 'package:umai/common/bloc/user_cubit.dart';
import 'package:umai/common/widgets/profile_picture.dart';
import 'package:umai/quiz/screens/home.dart';
import 'package:umai/social/screens/home.dart';
import 'package:umai/utils/themes.dart';
import 'package:potatoes/potatoes.dart';
import 'package:umai/animes/screens/anime_details.dart';
import 'package:umai/animes/widgets/episode_head.dart';
import 'package:umai/common/screens/common_details.dart';
import 'package:umai/quiz/screens/quiz_details.dart';
import 'package:umai/social/widgets/head_post.dart';
import 'package:umai/utils/dialogs.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen();

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with CompletableMixin {
  final pages = const [
    {'title': 'Social', 'page': SocialHomeScreen()},
    {'title': 'Évènements', 'page': SizedBox()},
    {'title': 'Pour toi', 'page': SizedBox()},
    {'title': 'Animes', 'page': AnimeHomeScreen()},
    {'title': 'Quiz', 'page': QuizHomeScreen()},
  ];

  @override
  Widget build(BuildContext context) {
    return BlocListener<LinkCubit, LinkState>(
        listener: onEventReceived,
        child: BlocBuilder<HomeCubit, int>(builder: (context, index) {
          return Scaffold(
            appBar: AppBar(
              forceMaterialTransparency: true,
              title: Text(pages[index]['title'] as String),
              centerTitle: true,
              systemOverlayStyle:
                  Theme.of(context).appBarTheme.systemOverlayStyle?.copyWith(
                        systemNavigationBarColor: Theme.of(context)
                            .bottomNavigationBarTheme
                            .backgroundColor,
                        systemNavigationBarDividerColor: Theme.of(context)
                            .bottomNavigationBarTheme
                            .backgroundColor,
                      ),
              actions: [
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const AccountScreen()));
                  },
                  child: const UserProfilePicture(),
                ),
                const SizedBox(width: 16.0)
              ],
            ),
            body: pages[index]['page'] as Widget,
            bottomNavigationBar: BottomNavigationBar(
              onTap: context.read<HomeCubit>().set,
              useLegacyColorScheme: false,
              items: <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                  icon: _buildIconWithDecoration(
                      icon: Icons.location_on, selected: index == 0),
                  label: pages[0]['title'] as String,
                ),
                BottomNavigationBarItem(
                  icon: _buildIconWithDecoration(
                      icon: Icons.commute, selected: index == 1),
                  label: pages[1]['title'] as String,
                ),
                BottomNavigationBarItem(
                  icon: _buildIconWithDecoration(
                      icon: Icons.bookmark_outline_rounded,
                      selected: index == 2),
                  label: pages[2]['title'] as String,
                ),
                BottomNavigationBarItem(
                  icon: _buildIconWithDecoration(
                      icon: Icons.add_circle_outline_rounded,
                      selected: index == 3),
                  label: pages[3]['title'] as String,
                ),
                BottomNavigationBarItem(
                  icon: _buildIconWithDecoration(
                      icon: Icons.notifications_outlined, selected: index == 4),
                  label: pages[4]['title'] as String,
                ),
              ],
              currentIndex: index,
              selectedItemColor: Colors.amber,
            ),
          );
        }));
  }

  void onEventReceived(BuildContext context, LinkState state) async {
    await waitForDialog();
    print("state $state");
    if (state is LinkLoading) {
      print("state loo");
      loadingDialogCompleter = showLoadingBarrier(context: context);
    } else if (state is PostLinkLoaded) {
      Navigator.of(context).push(
        MaterialPageRoute(
            builder: (context) => CommonDetailsScreen.fromPost(
                context: context,
                post: state.post,
                head: (context) => HeadPost())),
      );
    } else if (state is AnimeLinkLoaded) {
      Navigator.of(context).push(MaterialPageRoute(
          builder: (_) =>
              AnimeDetailScreen.get(context: context, anime: state.anime)));
    } else if (state is EpisodeLinkLoaded) {
      Navigator.of(context).push(
        MaterialPageRoute(
            builder: (context) => CommonDetailsScreen.fromEpisode(
                context: context,
                episode: state.episode,
                loadEpisodeAnimeCubit: LoadEpisodeAnimeCubit(context.read(),
                    context.read(), state.episode.id.toString()),
                head: (context) => const EpisodeHead())),
      );
    } else if (state is QuizLinkLoaded) {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (_) =>
              QuizDetailScreen.get(context: context, quiz: state.quiz),
          settings: const RouteSettings(name: quizRouteName),
        ),
      );
    } else if (state is UserLinkLoaded) {
      if (state.user.id != context.read<UserCubit>().user.id) {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) =>
                PersonAccountScreen.get(context: context, user: state.user)));
      }
    } else if (state is LinkError) {
      showErrorToast(content: state.error, context: context);
    }
  }

  Widget _buildIconWithDecoration({required icon, required bool selected}) {
    return Container(
        padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 20),
        decoration: selected
            ? BoxDecoration(
                color: AppTheme.primaryYellow,
                borderRadius: BorderRadius.circular(16))
            : null,
        child: Icon(
          icon,
        ));
  }
}
