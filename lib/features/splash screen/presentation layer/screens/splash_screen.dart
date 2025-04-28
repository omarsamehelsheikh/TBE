// splash_screen.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tbe/features/splash%20screen/presentation%20layer/bloc/cubit/cubit_logic.dart';
import 'package:tbe/features/splash%20screen/presentation%20layer/bloc/cubit/cubit_state.dart';


class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<SplashCubit, SplashState>(
      listener: (context, state) {
        if (state is SplashToOnBoarding) {
          Navigator.pushReplacementNamed(context, '/onboarding');
        } else if (state is SplashToHome) {
          Navigator.pushReplacementNamed(context, '/home');
        }
      },
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const FlutterLogo(size: 100),
              const SizedBox(height: 20),
              CircularProgressIndicator(color: Colors.red.shade700),
            ],
          ),
        ),
      ),
    );
  }
}
