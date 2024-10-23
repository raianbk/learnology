import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:learnology/components/my_button.dart';
import 'package:learnology/constants.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({super.key});

  void signOut() {
    FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Account'),
      ),
      body: Column(children: [
        Center(
            child: Text(
          '${user?.email}',
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        )),
        const SizedBox(
          height: 10,
        ),
        Center(
          child: MyButton(onTap: signOut, btnText: 'Sign Out'),
        )
      ]),
    );
  }
}
