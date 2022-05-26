import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:untitled/main.dart';
import 'package:untitled/screens/signup_screen.dart';


class LoginScreen extends StatefulWidget {
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

<<<<<<< HEAD
      child:Column(
        children: [
          Column(
=======

      child:Container(
        padding: EdgeInsets.fromLTRB(0, 30, 0, 0),
        child: Column(
          children: [
            Column(
>>>>>>> Gina

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
<<<<<<< HEAD
                   fontSize: 20,
                 ),
               ),
      ),
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: TextField(
            controller: emailController,
            // keyboardType: TextInputType.emailAddress,
            style: TextStyle(color: Colors.white),
            decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                  borderRadius: BorderRadius.all(
                      Radius.circular(12.0))),

              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                  borderRadius: BorderRadius.all(
                      Radius.circular(12.0))),

              hintText: 'Email',
              hintStyle: TextStyle(fontSize: 15.0, color: Colors.white),
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
            style: TextStyle(color: Colors.white),
            decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                  borderRadius: BorderRadius.all(
                      Radius.circular(12.0))),

              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                  borderRadius: BorderRadius.all(
                      Radius.circular(12.0))),

              hintText: 'Password',
              hintStyle: TextStyle(fontSize: 15.0, color: Colors.white),
            ),
          ),
        ),
              Padding(
                  padding: const EdgeInsets.only(top:40.0,bottom: 10.0, left: 100.0, right: 100.0),
                  child: OutlinedButton(

                    child: Text('Sign In'),
                    style: OutlinedButton.styleFrom(
                      primary: Colors.black,
                      backgroundColor: Colors.white,
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(
                              Radius.circular(30))),
                    ),

                    onPressed: () {
                      signIn();
                      // Navigator.push(context,MaterialPageRoute(builder: (context) => const HomeScreen();
                    },
                  )
=======
                   fontSize: 27,
                ),
>>>>>>> Gina
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
                        bottom: 10.0, left: 100.0, right: 100.0),
                    child: OutlinedButton(

                      child: Text('Sign In'),
                      style: OutlinedButton.styleFrom(
                        primary: Colors.white,
                        backgroundColor: Color(0xffFF4081),
                        fixedSize: Size(100,40),
                        shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(
                                Radius.circular(10))),
                      ),

                      onPressed: () {
                        Navigator.push(context,MaterialPageRoute(builder: (context) => const HomeScreen()),
                        );
                      },
                    )
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 1.0, bottom: 20.0),
                  child:  Text(
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
                  IconButton(onPressed: () => _launchURL('https://www.gmail.com'), icon: FaIcon(FontAwesomeIcons.google),color: Color(0xffFF4081),),
                  IconButton(onPressed: () => _launchURL('https://www.facebook.com'), icon: FaIcon(FontAwesomeIcons.facebook),color: Color(0xffFF4081),),
                  IconButton(onPressed: ()=> _launchURL('https://www.twitter.com'), icon: FaIcon(FontAwesomeIcons.twitter),color: Color(0xffFF4081),)
                ]
            ),
            Row(
              children: <Widget>[
                 Text("Don't have an account?",
                  style:TextStyle(color: Colors.grey[600]),),
                TextButton(
                  child: const Text(
                    'Sign up',
                    style: TextStyle(fontSize: 15,color: Color(0xff303F9F)),
                  ),
                  onPressed: (){
                    Navigator.push(context,MaterialPageRoute(builder: (context) => const SignupScreen()),
                    );
                  },
                )
              ],
              mainAxisAlignment: MainAxisAlignment.center,
<<<<<<< HEAD
              children: [
                IconButton(onPressed: () {} , icon: FaIcon(FontAwesomeIcons.google),color: Colors.white,),
                IconButton(onPressed: () {}, icon: FaIcon(FontAwesomeIcons.facebook),color: Colors.white,),
                IconButton(onPressed: () {}, icon: FaIcon(FontAwesomeIcons.twitter),color: Colors.white,)
              ]
          ),
          Row(
            children: <Widget>[
              const Text("Don't have an account?",
                style:TextStyle(color: Colors.white),),
              TextButton(
                child: const Text(
                  'Sign up',
                  style: TextStyle(fontSize: 15,color: Colors.white),
                ),
                onPressed: (){
                  Navigator.push(context,MaterialPageRoute(builder: (context) => const SignupScreen()),
                  );
                },
              )
            ],
            mainAxisAlignment: MainAxisAlignment.center,
          )],
=======
            )],
>>>>>>> Gina
  ),
      ),

  ),
      ),
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
