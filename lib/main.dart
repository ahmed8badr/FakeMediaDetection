import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:untitled/screens/home_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:untitled/utils.dart';
import 'firebase_options.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:untitled/AuthPage.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

final navigatorKey=GlobalKey<NavigatorState>();

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // builder: (context, child) => ResponsiveWrapper.builder(
      //     BouncingScrollWrapper.builder(context, child!),
      //     maxWidth: 1200,
      //     minWidth: 900,
      //     defaultScale: true,
      //     breakpoints: [
      //       const ResponsiveBreakpoint.resize(900, name: MOBILE),
      //       const ResponsiveBreakpoint.autoScale(800, name: TABLET),
      //       const ResponsiveBreakpoint.autoScale(1000, name: TABLET),
      //       const ResponsiveBreakpoint.resize(1200, name: DESKTOP),
      //       const ResponsiveBreakpoint.autoScale(2460, name: "4K"),
      //     ],
      //
      //   )

      // scaffoldMessengerKey: Utils.messengerKey,
      navigatorKey: navigatorKey,
      title: 'Fake Media Detection',
      debugShowCheckedModeBanner: false,
      home: MainPage(),
    );
  }
}

class MainPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) => Scaffold(
    body: StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot){
        if(snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else if(snapshot.hasError){
          return Center(child: Text('Something went wrong!'));
        } else if(snapshot.hasData){
          return HomeScreen();
        } else {
        return AuthPage();
        }
      },
    ),
  );
}
