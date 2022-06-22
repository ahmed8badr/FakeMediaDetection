import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:untitled/main.dart';


class LoginScreen extends StatefulWidget {
  final VoidCallback onClickedSignUp;
  const LoginScreen({
    Key? key,
    required this.onClickedSignUp,
}) : super(key: key);

  @override
_LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen>{
  final emailController = TextEditingController();
  final passwordController=TextEditingController();

  @override
  void dispose(){
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
  return Scaffold(
      backgroundColor: Colors.white,

      body:
      SafeArea(
      child: SingleChildScrollView(
      child:Container(
      padding: EdgeInsets.fromLTRB(0,30, 0, 0),
    child:Column(
        children: [
          Column(

            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,

            //ignore: prefer_const_literals_to_create_immutables
            children: [
              const Text(
                'Fake Media Detection',
               textAlign: TextAlign.center,
               style: TextStyle(
                 color: Color(0xff303F9F),
                  fontWeight: FontWeight.bold,
                  fontSize: 27,
              ),
            ),
             Padding(
               padding: const EdgeInsets.only(top: 40.0, left: 25.0, bottom: 20.0),
               child: const Text(
                 'Login',
                 textAlign: TextAlign.left,
                 style: TextStyle(
                  color: Color(0xff303F9F),
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                 ),
               ),
      ),
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: TextField(
            controller: emailController,
            keyboardType: TextInputType.emailAddress,
            style: TextStyle(color: Color(0xff303F9F)),
            decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Color(0xffFF4081)),
                  borderRadius: BorderRadius.all(
                      Radius.circular(12.0))),

              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Color(0xffFF4081)),
                  borderRadius: BorderRadius.all(
                      Radius.circular(12.0))),

              hintText: 'Email',
              hintStyle: TextStyle(fontSize: 15.0, color: Colors.grey),
            ),



          ),
        ),
        Padding(
          padding: const EdgeInsets.only(
              top: 1.0, left: 15.0, bottom: 15.0, right: 15.0),
          child: TextField(
            controller: passwordController,
            obscureText: true,
            enableSuggestions: false,
            autocorrect: false,
            style: TextStyle(color: Color(0xff303F9F)),
            decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Color(0xffFF4081)),
                  borderRadius: BorderRadius.all(
                      Radius.circular(12.0))),

              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Color(0xffFF4081)),
                  borderRadius: BorderRadius.all(
                      Radius.circular(12.0))),

              hintText: 'Password',
              hintStyle: TextStyle(fontSize: 15.0, color: Colors.grey),
            ),
          ),
        ),
              Padding(
                  padding: const EdgeInsets.only(bottom: 10.0, left: 100.0, right: 100.0),
                  child: OutlinedButton(

                    child: Text('Sign In'),
                    style: OutlinedButton.styleFrom(
                      primary: Colors.white,
                      backgroundColor: Color(0xffFF4081),
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(
                              Radius.circular(10))),
                    ),

                    onPressed: () {
                      signIn();
                    },
                  )
              ),
              Padding(
                padding: const EdgeInsets.only(top: 1.0, bottom: 20.0),
                child: Text(
                  'Or Sign in with',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.grey[600],
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                  ),
                ),
              ),
            ],
          ),
          Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(onPressed: () {} , icon: FaIcon(FontAwesomeIcons.google),color: Color(0xffFF4081),),
                IconButton(onPressed: () {}, icon: FaIcon(FontAwesomeIcons.facebook),color: Color(0xffFF4081),),
                IconButton(onPressed: () {}, icon: FaIcon(FontAwesomeIcons.twitter),color: Color(0xffFF4081),)
              ]
          ),
          Row(
            children: <Widget>[
              RichText(
                  text: TextSpan(
                    style:TextStyle(color: Colors.grey[600]),
                    text: "Don't have an account? ",
                    children: [
                      TextSpan(
                        recognizer: TapGestureRecognizer()
                            ..onTap=widget.onClickedSignUp,
                        text: 'Sign up',
                        style: TextStyle(fontSize: 15,color: Color(0xff303F9F)),
                      )
                    ]
                  ))],

            mainAxisAlignment: MainAxisAlignment.center,
          )],
  ),

  ),
      ),
  )
  );
}
  Future signIn() async {
    showDialog(
        context: context,
        barrierDismissible: false,
      builder: (context)=>Center(child: CircularProgressIndicator()),
    );

    try{
    await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text.trim()
    );
  } on FirebaseAuthException catch (e){
      print(e);
    }

    navigatorKey.currentState!.popUntil((route) => route.isFirst);

  }}
