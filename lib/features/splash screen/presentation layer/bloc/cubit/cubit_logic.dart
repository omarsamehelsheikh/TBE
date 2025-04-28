import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tbe/features/splash%20screen/presentation%20layer/bloc/cubit/cubit_state.dart';
import 'package:shared_preferences/shared_preferences.dart';
class SplashCubit extends Cubit<SplashState> {
  SplashCubit(super.initialState);

  Future<void> checkFirstTime() async {
    final prefs = await SharedPreferences.getInstance();
    final bool? seen = prefs.getBool('onboarding_seen');
    await Future.delayed(const Duration(seconds: 3));
    if (seen == Null || seen!) {
      emit(SplashToOnBoarding());
    } else {
      emit(SplashToHome());
    }
  }
}
