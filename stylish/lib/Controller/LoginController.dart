import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:stylish/Views/Screens/Home.dart';

class LoginController extends GetxController {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final emailError = ''.obs;
  final passwordError = ''.obs;
  final isProcessing = false.obs;
  final isPasswordVisible = false.obs;

  // Method to toggle password visibility
  void togglePasswordVisibility() {
    isPasswordVisible.value = !isPasswordVisible.value;
  }

  // Method to handle email input changes
  void onEmailChanged(String value) {
    if (value.isNotEmpty) {
      emailError.value = '';
    } else {
      emailError.value = 'Enter a valid email';
    }
  }

  // Method to handle password input changes
  void onPasswordChanged(String value) {
    if (value.isNotEmpty) {
      passwordError.value = '';
    } else {
      passwordError.value = 'Password must be at least 6 characters';
    }
  }

  // New validateFields method
  bool validateFields() {
    bool isValid = true;

    // Validate email
    if (emailController.text.isEmpty) {
      emailError.value = 'Email cannot be empty';
      isValid = false;
    } else {
      emailError.value = '';
    }

    // Validate password
    if (passwordController.text.isEmpty) {
      passwordError.value = 'Password cannot be empty';
      isValid = false;
    } else if (passwordController.text.length < 6) {
      passwordError.value = 'Password must be at least 6 characters';
      isValid = false;
    } else {
      passwordError.value = '';
    }

    return isValid;
  }

  // Login method
  Future<void> login() async {
    if (!validateFields()) {
      return; // Stop login if fields are not valid
    }

    isProcessing.value = true;

    try {
      final querySnapshot = await FirebaseFirestore.instance
          .collection('Users')
          .where('name', isEqualTo: emailController.text)
          .where('password', isEqualTo: passwordController.text)
          .get();

      if (querySnapshot.docs.isNotEmpty) {
        Get.off(HomeScreen());
      } else {
        Get.snackbar('Error', 'Invalid email or password',
            backgroundColor: Colors.red, colorText: Colors.white);
      }
    } catch (e) {
      Get.snackbar('Error', 'An error occurred during login',
          backgroundColor: Colors.red, colorText: Colors.white);
    } finally {
      isProcessing.value = false;
    }
  }

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    super.onClose();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}
