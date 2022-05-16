import 'package:flutter/material.dart';
import 'package:untitled/screens/signup_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fake Media Detection',

      routes: {
        '/': (_) => const SignupScreen(),

      },
      debugShowCheckedModeBanner: false,
    );
  }
}
