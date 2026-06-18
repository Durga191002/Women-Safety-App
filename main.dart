import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:woman_safety_app/lib_exports.dart';
import 'package:woman_safety_app/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  await PermissionsHelper.requestAll();
  runApp(ProviderScope(child: const FallDetectionApp()));
}

class FallDetectionApp extends StatelessWidget {
  const FallDetectionApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Fall detection app',
      theme: MainAppTheme.lightAppTheme(),
      // darkTheme: MainAppTheme.darkAppTheme(),
      home: const SplashScreen(),
    );
  }
}
