import 'package:flutter/material.dart';
import 'package:ifeira_app_1/pages/login/login_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ifeira',
      debugShowCheckedModeBanner: false,
      home: LoginPage(),
    );
  }
}
