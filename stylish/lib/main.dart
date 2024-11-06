import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stylish/Views/Screens/Login.dart';
import 'package:stylish/Views/Screens/SplashScreen.dart';
import 'Views/Screens/Home.dart';
import 'Views/Screens/OnBoarding.dart';

void main() {
  runApp(const Stylish());
}

class Stylish extends StatefulWidget {
  const Stylish({super.key});

  @override
  State<Stylish> createState() => _StylishState();
}

class _StylishState extends State<Stylish> {

  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}
