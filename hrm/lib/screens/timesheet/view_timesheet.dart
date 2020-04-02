import 'package:flutter/material.dart';

class ViewTimesheet extends StatefulWidget {
  @override
  _ViewTimesheetState createState() => _ViewTimesheetState();
}

class _ViewTimesheetState extends State<ViewTimesheet> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
        title: Text('Timesheet view panel', style: TextStyle(color: Colors.black)),
      ),
      body: Container(
        padding: const EdgeInsets.all(10),
        child: Text('vola'),
      ),
    );
  }
}