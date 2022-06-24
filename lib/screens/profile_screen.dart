import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';


class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final userController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body:
      SafeArea(

        child: SingleChildScrollView(
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,

              children: [


                CircleAvatar(
                  radius: 50,
                  backgroundColor: Colors.white,
                  backgroundImage: AssetImage("assets/images/pic.jpg"),

                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 0, vertical: 10),
                  //padding: const EdgeInsets.only(top: 10.0, right: 20),
                  child: Text('username',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Color(0xff303F9F),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 40.0, left: 25.0, bottom: 20.0),
                  child: const Text(
                    'Email:',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      color: Color(0xff303F9F),

                      fontSize: 20,
                    ),
                  ),
                ),
                // TextButton(
                //   child: const Text(
                //     'Change password',
                //     textAlign: TextAlign.left,
                //     style: TextStyle(fontSize: 20,
                //         color: Colors.white),
                //
                //   ),
                //   onPressed: (){
                //     Navigator.push(context,MaterialPageRoute(builder: (context) => const LoginScreen()),
                //     );
                //   },
                // ),
                Padding(
                  padding: const EdgeInsets.only(left: 25.0, bottom: 20.0),
                  child: const Text(
                    'Number of scanned videos:',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      color: Color(0xff303F9F),

                      fontSize: 20,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 25.0, bottom: 20.0),
                  child: const Text(
                    'Number of generated videos:',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      color: Color(0xff303F9F),

                      fontSize: 20,
                    ),
                  ),
                ),
                SfCartesianChart(primaryXAxis: CategoryAxis(),

                    series: <LineSeries<SalesData, String>>[
                      LineSeries<SalesData, String>(
                        // Bind data source
                          dataSource:  <SalesData>[
                            SalesData('Jan', 35),
                            SalesData('Feb', 28),
                            SalesData('Mar', 34),
                            SalesData('Apr', 32),
                            SalesData('May', 40)
                          ],
                          xValueMapper: (SalesData sales, _) => sales.year,
                          yValueMapper: (SalesData sales, _) => sales.sales
                      )
                    ]
                ),
                ElevatedButton(
                  child: Text(" Enter Username "),
                  onPressed:(){
                    showDialog(
                      barrierDismissible: false,
                      context: context,
                      builder: (BuildContext context) {
                        return BackdropFilter(
                          filter: ImageFilter.blur(sigmaX: 10,sigmaY: 10),
                          child: AlertDialog(
                            title: Text('Welcome',
                                style: TextStyle(
                                    color: Color(0xff303F9F)
                                )
                            ),
                            content: Text('Please enter username',
                              style: TextStyle(
                                  color: Color(0xff303F9F)
                              ),),
                            actions: [
                              TextFormField(
                                controller: userController,
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

                                  hintText: 'Username',
                                  hintStyle: TextStyle(fontSize: 15.0, color: Colors.grey),
                                ),
                              ),
                              ElevatedButton (
                                child: Text("Continue"),
                                style: ElevatedButton.styleFrom(
                                  fixedSize: Size(100,40),
                                  primary: Color(0xf21d2570),
                                  onPrimary: Colors.white,
                                ),

                                onPressed: () {
                                  final user = User(
                                    username: userController.text,
                                  );
                                  createUser(user);
                                  Navigator.pop(context);
                                },
                              ),

                            ],
                          ),
                        );
                      },
                    );
                  },
                )
              ]
          ),
        ),
      ),
    );


  }
}
class SalesData {
  SalesData(this.year, this.sales);
  final String year;
  final double sales;
}

class User{
  String id;
  final String username;
  User({
    this.id='',
    required this.username
});

  Map<String, dynamic> toJson()=>{
    'id':id,
    'username': username
  };
  static User fromJson(Map< String ,dynamic> json) => User(
    id: json['id'],
    username: json['username']
  );
}

Future createUser(User user)async{
  final docUser=FirebaseFirestore.instance.collection('users').doc(FirebaseAuth.instance.currentUser?.email);
  user.id=docUser.id;
  final json = user.toJson();
  await docUser.set(json);

}

Future readUser()async{
  final docUser = FirebaseFirestore.instance.collection('users').doc(FirebaseAuth.instance.currentUser?.email);
  final snapshot = await docUser.get();
  User.fromJson(snapshot.data()!);
}

// Stream<List<User>> readUsers() => FirebaseFirestore.instance.collection('users').snapshots().map((snapshot) =>
//     snapshot.docs.map((doc) => User.fromJson(doc.data())).toList());
