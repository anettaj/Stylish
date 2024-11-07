import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:stylish/Views/Screens/SplashScreen.dart';
import 'ApiKey/ApiKey.dart';

void main() async {
  // Ensure Flutter binding is initialized
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize Firebase
  await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: ApiKey.apiKey,
      appId: ApiKey.appId,
      messagingSenderId: ApiKey.messagingSenderId,
      projectId: ApiKey.projectId,
    ),
  );


  runApp(Stylish());
}

class Stylish extends StatefulWidget {
  const Stylish({super.key,});


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
