import 'package:flutter/material.dart';
import 'package:wangyiyun/transit_page.dart';

import 'config/app_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '读琴',
      debugShowCheckedModeBanner: false,
      theme: themeData,
      home: const TransitPage(),
    );
  }
}
