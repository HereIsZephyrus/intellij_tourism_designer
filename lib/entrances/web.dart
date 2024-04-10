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
      title: "智能旅游规划助手",
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: const Color(0xff6750a4),
      ),
      home: const HomePage(),
      routes: {
        '/login':(context) => const LoginPage(),
        '/signup':(context) => const SignUpPage(),
        '/user':(context) => const UserPage(),
        '/main':(context) => const EditTracePage(),
        '/generate':(context) => const PickUpPage(),
      },
    );
  }
}