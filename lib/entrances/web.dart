import 'package:flutter/material.dart';
import 'package:intellij_tourism_designer/pages/HomePage.dart';
import 'package:intellij_tourism_designer/pages/LoginPage.dart';
import 'package:intellij_tourism_designer/pages/UserPage.dart';
import 'package:intellij_tourism_designer/constants/Themes.dart';

class WebApp extends StatelessWidget {
  const WebApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "智能旅游规划助手",
      //theme:ThemeData(backgroundColor: Colors.white),
      routes: {
        '/':(context) => const LoginPage(),
        '/home': (context) => const HomePage(),
        '/user':(context) => const UserPage(),
      },
    );
  }
}