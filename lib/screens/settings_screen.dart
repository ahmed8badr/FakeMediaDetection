import 'package:flutter/material.dart';
//import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: BackButton(color: Color(0xf21d2570),onPressed: ()=> Navigator.pop(context, false)),
        title: Text('Settings',style: TextStyle(color: Color(0xf21d2570)),),
      ),
      body:

      ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: const Text(
              'Network',
              textAlign: TextAlign.left,
              style: TextStyle(
                color: Color(0xf21d2570),
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: const Text(
              'Mobile Data',
              textAlign: TextAlign.left,
              style: TextStyle(
                color:Color(0xf21d2570),
                fontSize: 18,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: const Text(
              'When scanning online, upload will be performed under any network connection',
              textAlign: TextAlign.left,
              style: TextStyle(
                color: Color(0xf21d2570),
                fontSize: 16,
              ),
            ),
          ),
        ],

      ),


    );

  }}