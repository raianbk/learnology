// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:learnology/pages/auth_page.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:learnology/pages/cart_page.dart';
import 'package:learnology/pages/course_detail.dart';
import 'package:learnology/pages/signup.dart';
import 'package:learnology/provider/cart_provider.dart';
import 'package:provider/provider.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return ChangeNotifierProvider(
      create: (context) => CartProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: AuthPage(),
        routes: {
          '/signup': (context) => SignUp(),
          '/course_detail': (context) => CourseDetail(),
          '/cart': (context) => CartPage(),
        },
        theme: ThemeData(
          textTheme: GoogleFonts.poppinsTextTheme(),
        ),
      ),
    );
  }
}
