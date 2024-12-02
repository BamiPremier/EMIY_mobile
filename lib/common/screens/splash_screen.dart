import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:umai/auth/screens/onboarding_screen.dart';
import 'package:umai/utils/assets.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key, required this.fromOnboarding});
  final bool fromOnboarding;
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: widget.fromOnboarding
            ? () => Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(builder: (_) => const OnboardingScreen()),
                  (route) => false,
                )
            : null,
        child: Image.asset(
          Assets.splashScreen,
          fit: BoxFit.cover,
          width: double.infinity,
          height: double.infinity,
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
