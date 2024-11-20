import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:learnology/components/my_button.dart';
import 'package:learnology/components/text_field.dart';

class SignUp extends StatelessWidget {
  final userSignUpController = TextEditingController();
  final passSignUpController = TextEditingController();

  SignUp({super.key});

  void register() async {
    String email = userSignUpController.text;
    String password = passSignUpController.text;

    if (email.isEmpty || password.isEmpty) {
      Fluttertoast.showToast(
        msg: 'Please enter credentials',
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.SNACKBAR,
        backgroundColor: Colors.black54,
        textColor: Colors.white,
        fontSize: 14.0,
      );
      return; // Return early if validation fails
    }

    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: userSignUpController.text,
          password: passSignUpController.text);

      // Clear text fields after successful signup
      userSignUpController.clear();
      passSignUpController.clear();

      Fluttertoast.showToast(
        msg: 'Sign up successful!',
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.SNACKBAR,
        backgroundColor: Colors.green,
        textColor: Colors.white,
        fontSize: 14.0,
      );
      await FirebaseAuth.instance.signOut();
    } on FirebaseAuthException catch (e) {
      String message = '';
      if (e.code == 'weak-password') {
        message = 'Password weak';
      } else if (e.code == 'email-already-in-use') {
        message = 'An account already exists with that email.';
      }
      Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.SNACKBAR,
        backgroundColor: Colors.black54,
        textColor: Colors.white,
        fontSize: 14.0,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[400],
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Learnology',
              style: TextStyle(
                  fontSize: 35,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 20,
            ),
            MyTextField(
                controller: userSignUpController,
                hintText: 'Enter your name',
                obsecure: false),
            const SizedBox(
              height: 15,
            ),
            MyTextField(
                controller: passSignUpController,
                hintText: 'Enter your Password',
                obsecure: false),
            const SizedBox(
              height: 15,
            ),
            MyButton(
              padValue: 10,
              color: Colors.black,
              onTap: register,
              btnText: 'Sign Up',
            ),
          ],
        ),
      ),
    );
  }
}
