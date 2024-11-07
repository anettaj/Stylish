import 'package:flutter/material.dart';
import 'package:stylish/Views/Screens/Login.dart';
import '../Widget/Login_Register/BrandIcon.dart';
import '../Widget/Login_Register/LoginForm.dart';
import '../Widget/Login_Register/NoAccountText.dart';
import '../Widget/Login_Register/RegisterForm.dart';
import '../Widget/Login_Register/SectionTitle.dart';
import 'package:get/get.dart';

class Register extends StatelessWidget {
  Register({super.key});

  @override
  Widget build(BuildContext context) {
    double W= MediaQuery.of(context).size.width;
    double H= MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,

      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: SafeArea(
          child: SizedBox(
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const SizedBox(height: 20),
                    SectionTitle(W: W, title: 'Create an account',),
                    const SizedBox(height: 30),
                    RegisterForm(),
                    SizedBox(height: H * 0.04),
                    const ContinueText(),
                    const BrandIcon(),
                    const SizedBox(height: 16),
                    NoAccountText(text: "I Already Have an Account ", linkText: "Login", link: () { Get.off(()=>Login()); },),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}






