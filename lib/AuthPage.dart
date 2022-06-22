import 'package:flutter/material.dart';
import 'package:untitled/screens/login_screen.dart';
import 'package:untitled/screens/signup_screen.dart';

class AuthPage extends StatefulWidget{
  @override
  _AuthPageState createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage>{
  bool isLogin = true;
  @override
  Widget build(BuildContext context) =>
      isLogin ? LoginScreen(onClickedSignUp: toggle,): SignUpScreen(onClickedSignIn:toggle);
  void toggle() => setState(() => isLogin =! isLogin);
}