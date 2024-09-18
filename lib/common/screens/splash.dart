import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:umai/utils/assets.dart';
import 'package:umai/utils/themes.dart';

class SplashScreen extends StatefulWidget {
  final ValueChanged<BuildContext> onFutureCompleted;

  const SplashScreen({super.key, required this.onFutureCompleted});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  // late final AnimationController _animationController =
  //     AnimationController(vsync: this, duration: const Duration(seconds: 1))
  //       ..repeat();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      loadContent().whenComplete(() => widget.onFutureCompleted(context));
    });
  }

  Future<void> loadContent() {
    const appleLoader = SvgAssetLoader(Assets.iconsApple);
    const googleLoader = SvgAssetLoader(Assets.iconsGoogle);

    return Future.wait([
      Future.delayed(const Duration(seconds: 2)),
      svg.cache.putIfAbsent(
          appleLoader.cacheKey(null), () => appleLoader.loadBytes(null)),
      svg.cache.putIfAbsent(
          googleLoader.cacheKey(null), () => googleLoader.loadBytes(null)),
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 32.0),
              child: const Text('UMAI'),
            ),
            const SizedBox(height: 48.0),
            const CircularProgressIndicator(
              color: ThemeApp.primaryYellow,
            )
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    // _animationController.dispose();
    super.dispose();
  }
}
