import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:syncfusion_flutter_charts/sparkcharts.dart';

import 'login_screen.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.cyan[700],
<<<<<<< HEAD
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: Text('Profile'),),
=======
>>>>>>> parent of b25f4e5 (final gui)
      body: SafeArea(

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
              child: Text(
                "Username",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
              Padding(
                padding: const EdgeInsets.only(top: 40.0, left: 25.0, bottom: 20.0),
                child: const Text(
                  'Email:',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    color: Colors.white,

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
                    color: Colors.white,

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
                    color: Colors.white,

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

       ] ),



        ),






    );
  }
}
class SalesData {
  SalesData(this.year, this.sales);
  final String year;
  final double sales;
}