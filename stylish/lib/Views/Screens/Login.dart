import 'package:flutter/material.dart';
import 'package:stylish/Views/Screens/Register.dart';
import '../Widget/Login_Register/BrandIcon.dart';
import '../Widget/Login_Register/LoginForm.dart';
import '../Widget/Login_Register/NoAccountText.dart';
import 'package:get/get.dart';
import '../Widget/Login_Register/SectionTitle.dart';

class Login extends StatelessWidget {
   Login({super.key});

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
                    SectionTitle(W: W, title: 'Welcome Back ! ',),
                    const SizedBox(height: 30),
                    LoginForm(),
                    SizedBox(height: H * 0.095),
                    ContinueText(),
                    BrandIcon(),
                    const SizedBox(height: 16),
                    NoAccountText(text: "Create An Account? ", linkText: "Sign Up", link: () { Get.to(Register()); },),
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

class ContinueText extends StatelessWidget {
  const ContinueText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Text('- OR Continue with -',style: TextStyle(color: Colors.grey),),
    );
  }
}







