// onboarding_cubit.dart
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tbe/features/onboarding/presentation%20layer/bloc/cubit/cubit_state.dart';

class OnboardingCubit extends Cubit<OnboardingState> {
  OnboardingCubit() : super(OnboardingState(pageIndex: 0));

  void nextPage() {
    if (state.pageIndex < 2) {
      emit(OnboardingState(pageIndex: state.pageIndex + 1));
    }
  }

  void previousPage() {
    if (state.pageIndex > 0) {
      emit(OnboardingState(pageIndex: state.pageIndex - 1));
    }
  }

  void setPage(int pageIndex) {
    emit(OnboardingState(pageIndex: pageIndex));
  }

  // ✅ These methods must be inside the class
  Future<void> skip(BuildContext context) async {
    await completeOnboarding(context);
  }

  Future<void> completeOnboarding(BuildContext context) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('onboarding_seen', true);
    Navigator.pushReplacementNamed(context, '/home');
  }
}
