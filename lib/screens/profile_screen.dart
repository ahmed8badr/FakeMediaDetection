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

  Widget addUsername() =>BackdropFilter(
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
                  setState(() {});
                },
              ),
            ],
          ),
        );

  Widget showProfile(User user) =>
    SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(0,40,0,0),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,

            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 0, vertical: 10),
                child: Text(user.username,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Color(0xff303F9F),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 40.0, left: 25.0, bottom: 20.0),
                child: Text(
                  'Email: ${user.id}',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    color: Color(0xff303F9F),

                    fontSize: 20,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 25.0, bottom: 20.0),
                child: Text(
                  'Number of scanned videos: ${user.n_scan}',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    color: Color(0xff303F9F),

                    fontSize: 20,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 25.0, bottom: 20.0),
                child: Text(
                  'Number of generated videos: ${user.n_gen}',
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
            ]
        ),
      ),
    );


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body:
      SafeArea(

          child: FutureBuilder<User?>(
            future: readUser(),
            builder: (context, snapshot){
              if (!snapshot.hasError && snapshot.hasData){
                final user = snapshot.data;
                return showProfile(user!);
              }
              else
                return addUsername();
            },
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
  int n_scan;
  int n_gen;
  final String username;
  User({
    this.id='',
    this.n_gen= 0,
    this.n_scan= 0,
    required this.username
});

  Map<String, dynamic> toJson()=>{
    'id':id,
    'n_scan':n_scan,
    'n_gen' : n_gen,
    'username': username
  };
  static User fromJson(Map<String, dynamic> json) => User(
    id: json['id'],
    n_gen: json['n_gen'],
    n_scan: json['n_scan'],
    username: json['username']
  );
}

Future createUser(User user)async{
  final docUser=FirebaseFirestore.instance.collection('users').doc(FirebaseAuth.instance.currentUser!.email.toString());
  user.id=docUser.id;
  final json = user.toJson();
  await docUser.set(json);
}

Future<User?> readUser()async{
  final docUser = FirebaseFirestore.instance.collection('users').doc(FirebaseAuth.instance.currentUser!.email.toString());
  final snapshot = await docUser.get();
  if(snapshot.exists)
  return User.fromJson(snapshot.data()!);
}