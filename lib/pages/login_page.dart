// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:learnology/components/my_button.dart';
import 'package:learnology/components/text_field.dart';
import 'package:learnology/pages/signup.dart';

class LoginPage extends StatelessWidget {
  final userController = TextEditingController();
  final passwordController = TextEditingController();

  LoginPage({super.key});

  void signIn() async {
    await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: userController.text,
      password: passwordController.text,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[400],
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Learnology',
              style: TextStyle(
                  fontSize: 35,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 30,
            ),
            MyTextField(
              controller: userController,
              obsecure: false,
              hintText: 'Enter Username',
            ),
            SizedBox(
              height: 10,
            ),
            MyTextField(
              controller: passwordController,
              obsecure: true,
              hintText: 'Enter Password',
            ),
            SizedBox(
              height: 15,
            ),
            MyButton(
              onTap: signIn,
              btnText: 'Sign In',
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'New user?',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => SignUp()),
                      );
                    },
                    child: Text(
                      'Sign Up',
                      style: TextStyle(color: Colors.white),
                    ))
              ],
            )
          ],
        ),
      ),
    );
  }
}
