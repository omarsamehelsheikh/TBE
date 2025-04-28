import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tbe/features/onboarding/presentation%20layer/bloc/cubit/cubit_logic.dart';
import 'package:tbe/features/onboarding/presentation%20layer/bloc/cubit/cubit_state.dart';

class OnboardingPage extends StatelessWidget {
  final PageController pageController = PageController();

  // Dummy data for onboarding content
  final List<Map<String, String>> onboardingData = [
    {
      'title': 'Welcome to MyApp',
      'description': 'This is an app that will help you with awesome features.',
      'image': 'assets/images/onboarding_1.png',
    },
    {
      'title': 'Track Your Progress',
      'description': 'Monitor your activities and see improvements.',
      'image': 'assets/images/onboarding_2.png',
    },
    {
      'title': 'Achieve Your Goals',
      'description': 'Set your goals and achieve them with our tools.',
      'image': 'assets/images/onboarding_3.png',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => OnboardingCubit(),
      child: Scaffold(
        body: BlocConsumer<OnboardingCubit, OnboardingState>(
          listener: (context, state) {
            // You can use the listener to perform actions when state changes.
          },
          builder: (context, state) {
            var currentPage = onboardingData[state.pageIndex];
            return OnboardingContent(
              title: currentPage['title']!,
              description: currentPage['description']!,
              image: currentPage['image']!,
              isFirstPage: state.pageIndex == 0,
              isLastPage: state.pageIndex == onboardingData.length - 1,
              onNext: () {
                context.read<OnboardingCubit>().nextPage();
                pageController.nextPage(
                    duration: Duration(milliseconds: 300),
                    curve: Curves.easeIn);
              },
              onPrevious: () {
                context.read<OnboardingCubit>().previousPage();
                pageController.previousPage(
                    duration: Duration(milliseconds: 300),
                    curve: Curves.easeIn);
              },
            );
          },
        ),
      ),
    );
  }
}

class OnboardingContent extends StatelessWidget {
  final String title;
  final String description;
  final String image;
  final bool isFirstPage;
  final bool isLastPage;
  final VoidCallback onNext;
  final VoidCallback onPrevious;

  const OnboardingContent({
    Key? key,
    required this.title,
    required this.description,
    required this.image,
    required this.isFirstPage,
    required this.isLastPage,
    required this.onNext,
    required this.onPrevious,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(image), // Add image
          SizedBox(height: 20),
          Text(
            title,
            style: Theme.of(context).textTheme.headlineMedium,
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 10),
          Text(
            description,
            style: Theme.of(context).textTheme.bodyMedium,
            textAlign: TextAlign.center,
          ),
          Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              if (!isFirstPage)
                ElevatedButton(
                  onPressed: onPrevious,
                  child: Text('Previous'),
                ),
              if (!isLastPage)
                ElevatedButton(
                  onPressed: onNext,
                  child: Text('Next'),
                ),
              if (isLastPage)
                ElevatedButton(
                  onPressed: () {
                    // Handle when onboarding is completed (e.g., navigate to the main screen)
                    Navigator.pushReplacementNamed(context, '/home');
                  },
                  child: Text('Get Started'),
                ),
            ],
          ),
        ],
      ),
    );
  }
}
