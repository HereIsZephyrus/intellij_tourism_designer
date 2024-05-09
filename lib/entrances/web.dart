import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:intellij_tourism_designer/pages/home_page.dart';
import 'package:intellij_tourism_designer/pages/user_page.dart';
import 'package:intellij_tourism_designer/pages/login_page.dart';
import 'package:intellij_tourism_designer/pages/signup_page.dart';
import 'package:intellij_tourism_designer/pages/pickup_page.dart';
import 'package:intellij_tourism_designer/models/data_model.dart';
import 'package:intellij_tourism_designer/pages/edit_trace_page.dart';
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
      home: ChangeNotifierProvider(
        create: (_) => ShareDataPage(),
        child: const EditTracePage(),
        //child:const LoginPage()
      ), // 网站起始界面
      routes: {
        '/login':(context) => const LoginPage(), // 登录界面
        '/signup':(context) => const SignUpPage(), // 注册界面
        '/user':(context) => const UserPage(), // 个人中心
        //'/main':(context) => const EditTracePage(), // 主编辑界面
        '/generate':(context) => const PickUpPage(), // 行程导出界面
      },
    );
  }
}