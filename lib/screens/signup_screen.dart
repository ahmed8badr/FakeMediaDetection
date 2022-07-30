// ignore_for_file: prefer_const_constructors


import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:untitled/main.dart';
import 'package:untitled/utils.dart';


class SignUpScreen extends StatefulWidget {
  final Function() onClickedSignIn;

  @override
  const SignUpScreen({
    Key? key,
    required this.onClickedSignIn,
  }) : super(key: key);

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}
class _SignUpScreenState extends State<SignUpScreen>{
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController=TextEditingController();
  final confirmPassController=TextEditingController();
  final usernameController = TextEditingController();
  bool _isHidden = true;
  bool _isHidden1 = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body:
        SafeArea(
          child: Form (
            key: formKey,
            child: SingleChildScrollView(

              child:Container(
                padding: EdgeInsets.fromLTRB(0, 30, 0, 0),
                child: Column(
                  children: [
                    Column(

                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      mainAxisAlignment: MainAxisAlignment.center,

                      children: [
                        const Text(
                          'DEEPECT',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Color(0xf21d2570),
                            fontWeight: FontWeight.bold,
                            fontSize: 27,

                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 40.0, left: 25.0, bottom: 20.0),
                          child: const Text(
                            'Create an account',
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              color: Color(0xf21d2570),
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                        ),

                        Padding(
                          padding:  const EdgeInsets.only(
                              top: 1.0, left: 15.0, bottom: 15.0, right: 15.0),
                          child: TextFormField(
                            controller: emailController,
                            keyboardType: TextInputType.emailAddress,
                            style: TextStyle(color: Color(0xff303F9F)),
                            decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Color(0xf21d2570)),
                                  borderRadius: BorderRadius.all(
                                      Radius.circular(12.0))),

                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Color(0xf21d2570)),
                                  borderRadius: BorderRadius.all(
                                      Radius.circular(12.0))),

                              hintText: 'Email',
                              hintStyle: TextStyle(fontSize: 15.0, color: Colors.grey),
                            ),
                            autovalidateMode: AutovalidateMode.onUserInteraction,
                            validator: (email) => email != null && !EmailValidator.validate(email)
                                ? 'Enter a valid email'
                                : null,
                          ),
                        ),

                        Padding(
                          padding: const EdgeInsets.only(
                              top: 1.0, left: 15.0, bottom: 15.0, right: 15.0),
                          child: TextFormField(
                            controller: passwordController,
                            obscureText: _isHidden,
                            enableSuggestions: false,
                            autocorrect: false,
                            style: TextStyle(color: Color(0xff303F9F)),
                            decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Color(0xf21d2570)),
                                  borderRadius: BorderRadius.all(
                                      Radius.circular(12.0))),

                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Color(0xf21d2570)),
                                  borderRadius: BorderRadius.all(
                                      Radius.circular(12.0))),

                              hintText: 'Password',
                              hintStyle: TextStyle(fontSize: 15.0, color: Colors.grey),
                              suffix: InkWell(
                                  onTap: _togglePasswordView,
                                  child: Icon(_isHidden
                                      ?Icons.visibility
                                      :Icons.visibility_off,color: Color(0xf21d2570),))

                            ),
                            autovalidateMode: AutovalidateMode.onUserInteraction,
                            validator: (value) => value != null && value.length < 6
                            ? 'Enter min. 6 characters'
                            : null,

                          ),
                        ),

                        Padding(
                          padding: const EdgeInsets.only(
                              top: 1.0, left: 15.0, bottom: 20.0, right: 15.0),
                          child: TextFormField(
                          controller: confirmPassController,
                          obscureText: _isHidden1,
                            enableSuggestions: false,
                            autocorrect: false,
                            style: TextStyle(color: Color(0xff303F9F)),
                            decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Color(0xf21d2570)),
                                  borderRadius: BorderRadius.all(
                                      Radius.circular(12.0))),

                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Color(0xf21d2570)),
                                  borderRadius: BorderRadius.all(
                                      Radius.circular(12.0))),

                              hintText: 'Retype Password',
                              hintStyle: TextStyle(fontSize: 15.0, color: Colors.grey),
                              suffix: InkWell(
                                  onTap: _togglePasswordView1,
                                  child: Icon(_isHidden1
                                        ?Icons.visibility
                                        :Icons.visibility_off,color: Color(0xf21d2570),))

                            ),
                          ),
                        ),
                        Padding(
                            padding: const EdgeInsets.only(
                                bottom: 10.0, left: 100.0, right: 100.0),
                            child: OutlinedButton(

                              child: Text('Sign Up'),
                              style: OutlinedButton.styleFrom(
                                  primary: Colors.white,
                                  fixedSize: Size(100, 40),
                                  backgroundColor: Color(0xf21d2570),
                                  shape: const RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(10)))
                              ),

                              onPressed: () {
                                signUp();
                              },
                            )
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 1.0, bottom: 20.0),
                          child:  Text(
                            'Or Sign up with',
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
                          IconButton(onPressed: () => {}, icon: FaIcon(FontAwesomeIcons.google),color: Color(0xf21d2570),),
                          IconButton(onPressed: () => {}, icon: FaIcon(FontAwesomeIcons.facebook),color: Color(0xf21d2570),),
                          IconButton(onPressed: ()=> {}, icon: FaIcon(FontAwesomeIcons.twitter),color: Color(0xf21d2570),)
                        ]
                    ),
                    Row(
                      children: <Widget>[
                        RichText(
                            text: TextSpan(
                                style:TextStyle(color: Colors.grey[600]),
                                text: "Already have an account? ",
                                children: [
                                  TextSpan(
                                    recognizer: TapGestureRecognizer()
                                      ..onTap= widget.onClickedSignIn,
                                    text: 'Sign in',
                                    style: TextStyle(fontSize: 15,color: Color(0xff303F9F)),
                                  )
                                ]
                            ))],

                      mainAxisAlignment: MainAxisAlignment.center,
                    )],
                ),
              ),
            )
        ))
    );
  }
  
  Future signUp() async {
    final isValid = formKey.currentState!.validate();
    if (!isValid) return;

    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context)=>Center(child: CircularProgressIndicator()),
    );

    if (passwordController.text != confirmPassController.text){
        Utils.showSnackBar('Passwords not match',Colors.red)  ;
    }else {
      try {
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
            email: emailController.text.trim(),
            password: passwordController.text.trim()
        );
      } on FirebaseAuthException catch (e) {
        print(e);
        Utils.showSnackBar(e.message,Colors.red);
      }
    }
    // navigatorKey.currentState!.popUntil((route) => route.isFirst);
  }

  void _togglePasswordView() {
    setState(() {
      _isHidden = !_isHidden;
    });
  }
  void _togglePasswordView1() {
    setState(() {
      _isHidden1 = !_isHidden1;
    });
  }
}


