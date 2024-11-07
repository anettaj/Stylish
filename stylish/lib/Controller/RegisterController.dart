import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class RegisterController extends GetxController {
  final nameController = TextEditingController();

  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  var nameError = ''.obs;

  var passwordError = ''.obs;
  var confirmPasswordError = ''.obs;
  var isProcessing = false.obs;

  // New variables for password visibility
  var isPasswordVisible = false.obs;
  var isConfirmPasswordVisible = false.obs;


  @override
  void onClose() {
    nameController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.onClose();
  }

  void togglePasswordVisibility() {
    isPasswordVisible.value = !isPasswordVisible.value;
  }

  // Toggle confirm password visibility
  void toggleConfirmPasswordVisibility() {
    isConfirmPasswordVisible.value = !isConfirmPasswordVisible.value;
  }

  void onNameChanged(String value) {
    if (value.isEmpty) {
      nameError.value = 'Name cannot be empty';
    } else {
      nameError.value = '';
    }
  }



  void onPasswordChanged(String value) {
    if (value.isEmpty) {
      passwordError.value = 'Password cannot be empty';
    } else if (value.length < 6) {
      passwordError.value = 'Password must be at least 6 characters';
    } else {
      passwordError.value = '';
    }
  }

  void onConfirmPasswordChanged(String value) {
    if (value.isEmpty) {
      confirmPasswordError.value = 'Please confirm your password';
    } else if (value != passwordController.text) {
      confirmPasswordError.value = 'Passwords do not match';
    } else {
      confirmPasswordError.value = '';
    }
  }

  void register() async {
    if (nameError.value.isNotEmpty ||
        passwordError.value.isNotEmpty ||
        confirmPasswordError.value.isNotEmpty) {
      // Return if there are any validation errors
      return;
    }

    isProcessing.value = true;

    try {
      // Check if email already exists in Firestore
      final usersRef = FirebaseFirestore.instance.collection('Users');

      await usersRef.add({
        'name': nameController.text,
        'password': passwordController.text, // Ideally, hash passwords
      });
      Get.snackbar('Success', 'Registration successful!');
      nameController.clear();
      passwordController.clear();
      confirmPasswordController.clear();
    }
      catch (e) {
      Get.snackbar('Error', 'Failed to register. Please try again later.');
    } finally {
      isProcessing.value = false;
    }
  }

}
