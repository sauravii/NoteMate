import 'package:flutter/material.dart';
import 'package:note_mate/components/my_button.dart';
import 'package:note_mate/components/my_passwordfield.dart';
import 'package:note_mate/components/my_textfield.dart';
import 'package:note_mate/utils/constants/colors.dart';
import 'package:note_mate/utils/theme/custom_themes/text_themes.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({super.key});

  // text editing controller
  final usernameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  // login user method
  void loginUser() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Padding(
        // ignore: prefer_const_constructors
        padding: EdgeInsets.only(
          top: 120,
          left: 35,
          right: 35,
          bottom: 100,
        ),
        child: Column(
          children: [
            // Header
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Register',
                  style: NoteMateTextTheme.lightTextTheme.headlineLarge,
                )
              ],
            ),

            SizedBox(
              height: 30,
            ),

            // Username Form
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Username',
                  style: NoteMateTextTheme.lightTextTheme.titleMedium,
                ),
                MyTextField(
                  controller: usernameController,
                  hintText: 'Username',
                  obsecureText: false,
                )
              ],
            ),

            SizedBox(
              height: 15,
            ),

            // Email Form
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'E-mail',
                  style: NoteMateTextTheme.lightTextTheme.titleMedium,
                ),
                MyTextField(
                  controller: emailController,
                  hintText: 'Email',
                  obsecureText: false,
                )
              ],
            ),

            SizedBox(
              height: 15,
            ),

            // Password Form
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Password',
                  style: NoteMateTextTheme.lightTextTheme.titleMedium,
                ),
                MyPasswordField(
                  controller: passwordController,
                  hintText: 'Password',
                  obsecureText: true,
                )
              ],
            ),

            // Forgot Password
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  'Forgot Password?',
                  style: TextStyle(
                      color: NoteMateColors.error,
                      fontSize: 12,
                      fontWeight: FontWeight.w600),
                ),
              ],
            ),

            SizedBox(
              height: 40,
            ),

            // Button
            MyButton(
              onTap: loginUser,
              title: 'Register',
            ),

            SizedBox(
              height: 25,
            ),

            // Sign Up
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Already have an account?',
                  style: TextStyle(
                      color: NoteMateColors.textPrimary,
                      fontSize: 12,
                      fontWeight: FontWeight.w500),
                ),
                SizedBox(
                  width: 4,
                ),
                Text(
                  'Sign in here',
                  style: TextStyle(
                      color: NoteMateColors.primary,
                      fontSize: 12,
                      fontWeight: FontWeight.w600),
                ),
              ],
            )
          ],
        ),
      ),
    ));
  }
}
