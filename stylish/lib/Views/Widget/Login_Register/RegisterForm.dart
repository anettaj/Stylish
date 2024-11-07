import 'package:flutter/material.dart';

import '../../../Constant/Colors.dart';
import '../../../Constant/TextStyle.dart';
import '../../../Controller/LoginController.dart';
import 'package:get/get.dart';
import '../../../Controller/RegisterController.dart';

class RegisterForm extends StatefulWidget {
  @override
  State<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  final registerController = Get.put(RegisterController());

  @override
  Widget build(BuildContext context) {
    double W = MediaQuery.of(context).size.width;

    return Form(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            // Name Field
            Obx(() => TextFormField(
              controller: registerController.nameController,
              decoration: InputDecoration(
                fillColor: TextfieldFillColor,
                filled: true,
                floatingLabelBehavior: FloatingLabelBehavior.never,
                prefixIcon: Icon(Icons.person_rounded, color: IconColor),
                border: authOutlineInputBorder,
                enabledBorder: authOutlineInputBorder,
                labelText: 'Username or Email',
                errorText: registerController.nameError.value.isNotEmpty
                    ? registerController.nameError.value
                    : null,
                labelStyle: TextStyle(color: Colors.black),
                focusedBorder: authOutlineInputBorder.copyWith(
                  borderSide: BorderSide(color: Colors.pink),
                ),
              ),
              onChanged: registerController.onNameChanged,
              onFieldSubmitted: (_) {
                setState(() {}); // Trigger revalidation on submit
              },
            )),
            SizedBox(height: 16.0),

            // Password Field
            Obx(() => TextFormField(
              controller: registerController.passwordController,
              decoration: InputDecoration(
                fillColor: TextfieldFillColor,
                filled: true,
                floatingLabelBehavior: FloatingLabelBehavior.never,
                border: authOutlineInputBorder,
                labelText: 'Password',
                prefixIcon: Icon(Icons.lock_rounded, color: IconColor),
                errorText: registerController.passwordError.value.isNotEmpty
                    ? registerController.passwordError.value
                    : null,
                labelStyle: TextStyle(color: TextfieldLabelColor),
                suffixIcon: IconButton(
                  icon: Icon(
                    registerController.isPasswordVisible.value
                        ? Icons.visibility // Show password icon
                        : Icons.visibility_off, // Hide password icon
                  ),
                  onPressed: () {
                    registerController.togglePasswordVisibility(); // Toggle visibility
                  },
                ),
                enabledBorder: authOutlineInputBorder,
                focusedBorder: authOutlineInputBorder.copyWith(
                  borderSide: const BorderSide(color: Colors.pink),
                ),
              ),
              obscureText: !registerController.isPasswordVisible.value, // Updated obscureText
              onChanged: registerController.onPasswordChanged,
              onFieldSubmitted: (_) {
                setState(() {}); // Trigger revalidation on submit
              },
            )),
            const SizedBox(height: 16.0),

            // Confirm Password Field
            Obx(() => TextFormField(
              controller: registerController.confirmPasswordController,
              decoration: InputDecoration(
                fillColor: TextfieldFillColor,
                filled: true,
                floatingLabelBehavior: FloatingLabelBehavior.never,
                border: authOutlineInputBorder,
                labelText: 'Confirm Password',
                prefixIcon: Icon(Icons.lock_rounded, color: IconColor),
                errorText: registerController.confirmPasswordError.value.isNotEmpty
                    ? registerController.confirmPasswordError.value
                    : null,
                labelStyle: TextStyle(color: TextfieldLabelColor),
                suffixIcon: IconButton(
                  icon: Icon(
                    registerController.isConfirmPasswordVisible.value
                        ? Icons.visibility
                        : Icons.visibility_off,
                    color: IconColor,
                  ),
                  onPressed: () {
                    registerController.toggleConfirmPasswordVisibility(); // Toggle visibility
                  },
                ),
                enabledBorder: authOutlineInputBorder,
                focusedBorder: authOutlineInputBorder.copyWith(
                  borderSide: BorderSide(color: Colors.pink),
                ),
              ),
              obscureText: !registerController.isConfirmPasswordVisible.value, // Updated obscureText
              onChanged: registerController.onConfirmPasswordChanged,
              onFieldSubmitted: (_) {
                setState(() {}); // Trigger revalidation on submit
              },
            )),
            const SizedBox(height: 12.0),
            Align(
              alignment: Alignment.topLeft,
              child: Container(
                width: W * 0.68,
                padding: const EdgeInsets.only(left: 5),
                child: RichText(
                    text: const TextSpan(children: [
                      TextSpan(
                          text: 'By clicking the ',
                          style: TextStyle(color: Colors.grey)),
                      TextSpan(
                          text: 'Register',
                          style: TextStyle(color: Colors.pink)),
                      TextSpan(
                          text: ' button, you agree to the public offer',
                          style: TextStyle(color: Colors.grey)),
                    ])),
              ),
            ),
            SizedBox(height: 40.0),

            // Register Button
            Obx(() => registerController.isProcessing.value
                ? const CircularProgressIndicator()
                : ElevatedButton(
              onPressed: () {
                // Trigger manual validation before registering
                final isValid = registerController.validateFields();
                if (isValid) {
                  registerController.register();
                }
              },
              child: Text(
                'Create Account',
                style: TextStyle(fontSize: 20),
              ),
              style: SubmitButtonStyle,
            )),
            SizedBox(height: 16),
          ],
        ),
      ),
    );
  }


}
