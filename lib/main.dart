import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
//import 'entrances/mobile.dart';
import 'entrances/web.dart';
import 'package:intellij_tourism_designer/Provider/DataModel.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => ShareDataPage(), // 创建 CounterModel 实例
      child: WebApp(),
    ),
  );
}
//void main() => runApp(const MoblieApp());