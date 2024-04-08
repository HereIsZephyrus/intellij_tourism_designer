import 'package:flutter/material.dart';
import 'package:intellij_tourism_designer/pages/HomePage.dart';
import 'package:intellij_tourism_designer/pages/LoginPage.dart';
import 'package:intellij_tourism_designer/pages/SignUpPage.dart';
import 'package:intellij_tourism_designer/pages/UserPage.dart';
import 'package:intellij_tourism_designer/pages/EditTracePage.dart';
import 'package:intellij_tourism_designer/pages/PickUpPage.dart';

class WebApp extends StatelessWidget {
  const WebApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/': (context) => const HomePage(),
        '/login':(context) => const LoginPage(),
        '/signup':(context) => const SignUpPage(),
        '/user':(context) => const UserPage(),
        '/main':(context) => const EditTracePage(),
        '/generate':(context) => const PickUpPage(),
      },
    );
  }
}