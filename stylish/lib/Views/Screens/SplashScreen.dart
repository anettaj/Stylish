import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'package:shared_preferences/shared_preferences.dart';
import 'package:stylish/Views/Screens/Login.dart';

import 'Home.dart';
import 'OnBoarding.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void initState() {
    super.initState();
    _navigateToNextScreen();
  }

  void _navigateToNextScreen() async {
    await Future.delayed(Duration(seconds: 2));


    // SharedPreferences prefs = await SharedPreferences.getInstance();
    // bool loggedIn = prefs.getBool('isLoggedIn') ?? false;
    // bool isOnboardingCompleted = prefs.getBool('isOnboardingCompleted') ?? false;

    Get.off(() => Onboarding());
    // if (loggedIn) {
    //   Get.off(() => HomeScreen());
    // } else {
    //   if(isOnboardingCompleted){
    //     Get.off(()=>Login());
    //   }
    //   Get.off(() => Onboarding());
    // }
  }

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
