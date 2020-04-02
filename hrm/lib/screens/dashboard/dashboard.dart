import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hrm/screens/calender/Calender.dart';

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: Colors.black));
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {},
          icon: Icon(Icons.menu, color: Colors.black),
        ),
        title: Text('Timesheet', style: TextStyle(color: Colors.black)),
        centerTitle: true,
        backgroundColor: Colors.white,
        actions: <Widget>[
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.add_box, color: Colors.blue),
          )
        ],
      ),
      body: Container(
          alignment: Alignment.topCenter, color: Colors.white, child: Calender()),
    );
  }
}
