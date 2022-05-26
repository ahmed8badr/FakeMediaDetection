// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:untitled/screens/login_screen.dart';
//import 'package:untitled/screens/login_screen.dart';
import 'package:url_launcher/url_launcher.dart';


class SignupScreen extends StatelessWidget {
  const SignupScreen({Key? key}) : super(key: key);

  void _launchURL(String _url) async =>
      await launch(_url);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,

        body:
        SafeArea(
            child: SingleChildScrollView(


              child:Container(
                padding: EdgeInsets.fromLTRB(0, 30, 0, 0),
                child: Column(
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
                            'Create an account',
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
                          padding: const EdgeInsets.only(
                              top: 1.0, left: 15.0, bottom: 20.0, right: 15.0),
                          child: TextField(
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

                              hintText: 'Retype Password',
                              hintStyle: TextStyle(fontSize: 15.0, color: Colors.grey),
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
                                backgroundColor: Color(0xffFF4081),
                                shape: const RoundedRectangleBorder(
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(10)))
                              ),

                              onPressed: () {
                                Navigator.push(context,MaterialPageRoute(builder: (context) => const LoginScreen()),
                                );
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
                          IconButton(onPressed: () => _launchURL('https://www.gmail.com'), icon: FaIcon(FontAwesomeIcons.google),color: Color(0xffFF4081),),
                          IconButton(onPressed: () => _launchURL('https://www.facebook.com'), icon: FaIcon(FontAwesomeIcons.facebook),color: Color(0xffFF4081),),
                          IconButton(onPressed: ()=> _launchURL('https://www.twitter.com'), icon: FaIcon(FontAwesomeIcons.twitter),color: Color(0xffFF4081),)
                        ]
                    ),
                    Row(
                      children: <Widget>[
                         Text('Already have an account?',
                          style:TextStyle(color: Colors.grey[600]),),
                        TextButton(
                          child: const Text(
                            'Sign in',
                            style: TextStyle(fontSize: 15,color: Color(0xff303F9F)),
                          ),
                          onPressed: (){
                            Navigator.push(context,MaterialPageRoute(builder: (context) => const LoginScreen()),
                            );
                          },
                        )
                      ],
                      mainAxisAlignment: MainAxisAlignment.center,
                    )],
                ),
              ),
            )
        )
    );
  }}







