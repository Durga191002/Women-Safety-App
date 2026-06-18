import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:woman_safety_app/lib_exports.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _decideStartScreen();
  }

  Future<void> _decideStartScreen() async {
    final prefs = await SharedPreferences.getInstance();
    final isSetupComplete = prefs.getBool('isProfileSetupComplete') ?? false;

    if (isSetupComplete) {
      // Navigate to main app (BottomNavBar)
      AppRouter.instance.pushReplacement(
        context: context,
        page: BottomNavBarScreen(),
      );
    } else {
      // Navigate to profile setup (onboarding)
      AppRouter.instance.pushReplacement(
        context: context,
        page: OnboardingScreen(),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    // Simple loading UI while deciding start screen
    return const Scaffold(body: Center(child: ShowMultiColorLoader()));
  }
}
