import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void initState() {
    super.initState();
    // _navigateToNextScreen();
  }

  // void _navigateToNextScreen() async {
  //   await Future.delayed(Duration(seconds: 3)); // 3-second delay
  //
  //   // Check if user has completed onboarding
  //   bool isOnboardingCompleted = false; // Replace with actual onboarding check logic
  //   if (isOnboardingCompleted) {
  //     Get.off(() => HomeScreen());
  //   } else {
  //     Get.off(() => OnBoardingScreen());
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Image.asset('Assets/logoipsum-255 1.png'),
      ),
    );
  }
}
