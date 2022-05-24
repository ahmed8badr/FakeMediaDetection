import 'package:flutter/material.dart';
import 'package:untitled/screens/signup_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';



void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
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
      // home: AuthenticationWrapper(),
    );
  }
}

// class AuthenticationWrapper extends StatelessWidget{
//   @override
//   Widget build(BuildContext context){
//     return Container();
//   }
// }
