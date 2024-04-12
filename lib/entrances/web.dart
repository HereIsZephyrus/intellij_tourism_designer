import 'package:flutter/material.dart';
import 'package:intellij_tourism_designer/pages/home_page.dart';
import 'package:intellij_tourism_designer/pages/login_page.dart';
import 'package:intellij_tourism_designer/pages/signup_page.dart';
import 'package:intellij_tourism_designer/pages/user_page.dart';
import 'package:intellij_tourism_designer/pages/edit_trace_page.dart';
import 'package:intellij_tourism_designer/pages/pickup_page.dart';

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