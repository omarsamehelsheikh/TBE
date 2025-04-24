// lib/core/routes.dart
import 'package:flutter/material.dart';
import 'package:tbe/features/on_boarding/presentation%20_layer/screens/on_boarding_screen.dart';
import 'package:tbe/splash_screen.dart';


class Routes {
  static const String splash = '/';
  static const String onboarding = '/onboarding';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case splash:
        return MaterialPageRoute(builder: (_) => SplashScreen());
      case onboarding:
        return MaterialPageRoute(builder: (_) => OnboardingScreen());
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(child: Text("No route defined for ${settings.name}")),
          ),
        );
    }
  }
}
