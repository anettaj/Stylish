import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:shared_preferences/shared_preferences.dart';

class LoginController extends GetxController {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final emailError = ''.obs;
  final passwordError = ''.obs;
  final isProcessing = false.obs;
  final isPasswordVisible = false.obs; // New property for password visibility

  final LoginformKey = GlobalKey<FormState>();


  // Method to toggle password visibility
  void togglePasswordVisibility() {
    isPasswordVisible.value = !isPasswordVisible.value;
  }

  // Method to handle email input changes
  void onEmailChanged(String value) {
    if (value.isEmail) {
      emailError.value = '';
    } else {
      emailError.value = 'Enter a valid email';
    }
  }

  // Method to handle password input changes
  void onPasswordChanged(String value) {
    if (value.length >= 6) {
      passwordError.value = '';
    } else {
      passwordError.value = 'Password must be at least 6 characters';
    }
  }

  // Login method

  // Future<void> login() async {
  //   // Check if email or password fields are empty
  //   if (emailController.text.isEmpty) {
  //     emailError.value = 'Email cannot be empty';
  //     return;
  //   }
  //   if (passwordController.text.isEmpty) {
  //     passwordError.value = 'Password cannot be empty';
  //     return;
  //   }
  //
  //   // If no errors, proceed with login
  //   isProcessing.value = true;
  //
  //   try {
  //     // Simulated authentication with Firestore
  //     final querySnapshot = await FirebaseFirestore.instance
  //         .collection('Users')
  //         .where('email', isEqualTo: emailController.text)
  //         .where('password', isEqualTo: passwordController.text)
  //         .get();
  //
  //     if (querySnapshot.docs.isNotEmpty) {
  //       final userDoc = querySnapshot.docs.first; // Get the first document
  //       String userId = userDoc.id; // Get the document ID as userId
  //       String username = userDoc['name']; // Assuming you have a 'username' field
  //
  //       // Proceed to save session and user data
  //       final prefs = await SharedPreferences.getInstance();
  //       prefs.setBool('isLoggedIn', true);
  //       prefs.setString('userEmail', emailController.text);
  //       prefs.setString('userName', username); // Save username to SharedPreferences
  //       prefs.setString('userId', userId); // Save userId to SharedPreferences
  //       if (userDoc['userType']=='Admin'){
  //         // Navigate to Home page
  //         Get.offAllNamed('/adminmenu');
  //       }else{
  //         // Navigate to Home page
  //         Get.offAllNamed('/menu');
  //       }
  //
  //
  //
  //     } else {
  //       // User not found
  //       Get.snackbar('Error', 'Invalid email or password',
  //           backgroundColor: Colors.red, colorText: Colors.white);
  //     }
  //   } catch (e) {
  //     // Handle any login errors
  //     Get.snackbar('Error', 'An error occurred during login',
  //         backgroundColor: Colors.red, colorText: Colors.white);
  //   } finally {
  //     isProcessing.value = false;
  //   }
  // }

  // @override
  // void onClose() {
  //   emailController.dispose();
  //   passwordController.dispose();
  //   super.onClose();
  // }
  //
  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}
