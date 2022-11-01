import 'package:flutter/material.dart';
import 'package:pick_note1/login_page.dart';
import 'package:pick_note1/sign_Up.dart';
import 'RecognitionScreen.dart';

void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        "/":(context)=>SignUp(),
        "LoginPage":(context)=>LoginPage(),
        "Re":(context)=>RecognitionScreen(),
        // "signUp":(context)=>RecognitionScreen()
      },
    );
  }
}
