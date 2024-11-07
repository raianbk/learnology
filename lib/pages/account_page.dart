// ignore_for_file: prefer_const_constructors

import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
import 'package:learnology/constants.dart';

class Accounts extends StatefulWidget {
  const Accounts({Key? key}) : super(key: key);

  @override
  _AccountsState createState() => _AccountsState();
}

class _AccountsState extends State<Accounts> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          'Account',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 250,
              width: 400,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Temp',
                    style: TextStyle(color: Colors.black, fontSize: 24),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 12),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.account_box_outlined, color: Colors.black),
                        SizedBox(width: 10),
                        Text(
                          '${user?.email}',
                          style: TextStyle(color: Colors.grey, fontSize: 20),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 25),
                    child: MaterialButton(
                      onPressed: () {},
                      child: Text(
                        'Become an Instructor',
                        style: TextStyle(
                          color: Colors.lightBlueAccent,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 15.0),
              child: Text(
                'Video Preference',
                style: TextStyle(color: Colors.grey, fontSize: 14),
              ),
            ),
            ListTile(
              title: Text(
                'Downlaod Options',
                style: TextStyle(color: Colors.black, fontSize: 20),
              ),
              trailing: Icon(
                Icons.arrow_forward_ios_outlined,
                color: Colors.grey,
              ),
            ),
            ListTile(
              title: Text(
                'Video playback Options',
                style: TextStyle(color: Colors.black, fontSize: 20),
              ),
              trailing: Icon(
                Icons.arrow_forward_ios_outlined,
                color: Colors.grey,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 15.0),
              child: Text(
                'Account Settings',
                style: TextStyle(color: Colors.grey, fontSize: 14),
              ),
            ),
            ListTile(
              title: Text(
                'Account Security',
                style: TextStyle(color: Colors.black, fontSize: 20),
              ),
              trailing: Icon(
                Icons.arrow_forward_ios_outlined,
                color: Colors.grey,
              ),
            ),
            ListTile(
              title: Text(
                'Email Notification Preference',
                style: TextStyle(color: Colors.black, fontSize: 20),
              ),
              trailing: Icon(
                Icons.arrow_forward_ios_outlined,
                color: Colors.grey,
              ),
            ),
            ListTile(
              title: Text(
                'Learning Remainders',
                style: TextStyle(color: Colors.black, fontSize: 20),
              ),
              trailing: Icon(
                Icons.arrow_forward_ios_outlined,
                color: Colors.grey,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 15.0),
              child: Text(
                'Support',
                style: TextStyle(color: Colors.grey, fontSize: 14),
              ),
            ),
            ListTile(
              title: Text(
                'About Learnology',
                style: TextStyle(color: Colors.black, fontSize: 20),
              ),
              trailing: Icon(
                Icons.arrow_forward_ios_outlined,
                color: Colors.grey,
              ),
            ),
            ListTile(
              title: Text(
                'About Learnology for Business',
                style: TextStyle(color: Colors.black, fontSize: 20),
              ),
              trailing: Icon(
                Icons.arrow_forward_ios_outlined,
                color: Colors.grey,
              ),
            ),
            ListTile(
              title: Text(
                'FAQs',
                style: TextStyle(color: Colors.black, fontSize: 20),
              ),
              trailing: Icon(
                Icons.arrow_forward_ios_outlined,
                color: Colors.grey,
              ),
            ),
            ListTile(
              title: Text(
                'Share the Learnology app',
                style: TextStyle(color: Colors.black, fontSize: 20),
              ),
              trailing: Icon(
                Icons.arrow_forward_ios_outlined,
                color: Colors.grey,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 15.0),
              child: Text(
                'Diagnostic',
                style: TextStyle(color: Colors.grey, fontSize: 14),
              ),
            ),
            ListTile(
              title: Text(
                'Status',
                style: TextStyle(color: Colors.black, fontSize: 20),
              ),
              trailing: Icon(
                Icons.arrow_forward_ios_outlined,
                color: Colors.grey,
              ),
            ),
            Center(
              child: Padding(
                padding: EdgeInsets.only(top: 15, bottom: 10),
                child: MaterialButton(
                  onPressed: () async {
                    await FirebaseAuth.instance.signOut();
                  },
                  child: Text(
                    'Sign out',
                    style: TextStyle(
                      color: Colors.lightBlueAccent,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
