import 'package:flutter/material.dart';

import '../../../Constant/Colors.dart';
import '../../../Constant/TextStyle.dart';
import '../../../Controller/LoginController.dart';
import 'package:get/get.dart';

class LoginForm extends StatefulWidget {
  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {

  final loginController = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    double W = MediaQuery.of(context).size.width;

    return Form(
      key: loginController.LoginformKey,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            Obx(() => TextFormField(
              controller: loginController.emailController,
              textInputAction: TextInputAction.next,
              decoration: InputDecoration(
                fillColor: TextfieldFillColor,
                filled: true,
                floatingLabelBehavior: FloatingLabelBehavior.never,
                prefixIcon: Icon(Icons.person_rounded,color: IconColor),
                border: authOutlineInputBorder,
                enabledBorder: authOutlineInputBorder,
                labelText: 'Username or Email',
                errorText: loginController.emailError.value.isNotEmpty
                    ? loginController.emailError.value
                    : null,
                labelStyle:  TextStyle(color: TextfieldLabelColor),
                focusedBorder: authOutlineInputBorder.copyWith(
                  borderSide:  BorderSide(color: Colors.pink),
                ),
              ),
              onChanged: loginController.onEmailChanged,
              onFieldSubmitted: (_) {
                loginController.LoginformKey.currentState?.validate();
              },
            )),
            const SizedBox(height: 20.0),

            Obx(() => TextFormField(
              controller: loginController.passwordController,
              decoration: InputDecoration(
                fillColor: TextfieldFillColor,
                filled: true,
                floatingLabelBehavior: FloatingLabelBehavior.never,
                border: authOutlineInputBorder,
                labelText: 'Password',
                prefixIcon: Icon(Icons.lock_rounded,color:IconColor),
                errorText: loginController.passwordError.value.isNotEmpty
                    ? loginController.passwordError.value
                    : null,
                labelStyle: TextStyle(color: TextfieldLabelColor),
                suffixIcon: IconButton(
                  icon: Icon(
                    loginController.isPasswordVisible.value
                        ? Icons.visibility // Show password icon
                        : Icons.visibility_off, // Hide password icon
                    color: IconColor,
                  ),
                  onPressed: () {
                    loginController.togglePasswordVisibility(); // Toggle visibility
                  },
                ),
                enabledBorder: authOutlineInputBorder,
                focusedBorder: authOutlineInputBorder.copyWith(
                  borderSide:  BorderSide(color: Colors.pink),
                ),
              ),
              obscureText: !loginController.isPasswordVisible.value, // Use visibility state
              onChanged: loginController.onPasswordChanged,
              onFieldSubmitted: (_) {
                loginController.LoginformKey.currentState?.validate();
              },
            )),

            const SizedBox(
              height: 8,
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: GestureDetector(
                onTap: () {
                  // Get.to(()=>Register());
                },
                child: const Text(
                  'Forgot Password?',
                  style: TextStyle(color:Colors.pink,fontSize: 12),
                ),
              ),
            ),

            const SizedBox(height: 50.0),
            Obx(() => loginController.isProcessing.value
                ? const CircularProgressIndicator()
                :  ElevatedButton(
                  onPressed: () {
                    if (loginController.LoginformKey.currentState!.validate()) {
                  // loginController.login();
                }
                    },
                  style:SubmitButtonStyle,
                  child: const Text("Login",style: TextStyle(fontSize: 20),),
            )
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}

