import 'package:flutter/material.dart';
import 'package:hrm/models/timesheet_model.dart';
import 'package:hrm/services/timesheet_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ViewTimesheet extends StatefulWidget {
  @override
  _ViewTimesheetState createState() => _ViewTimesheetState();
}

class _ViewTimesheetState extends State<ViewTimesheet> {
  String user;

  signInChecker() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    user = prefs.getString('user');
  }

  @override
  void initState() {
    super.initState();
    signInChecker();
  }

  @override
  Widget build(BuildContext context) {
    final TimesheetModel args = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
        title: Text('View Panel', style: TextStyle(color: Colors.black)),
        actions: <Widget>[
          IconButton(
            onPressed: () async {
              try {
                await TimesheetService(uid: user).deleteTimesheet(args.docid);
                Navigator.pop(context);
              } catch (e) {
                print(e);
              }
            },
            icon: Icon(Icons.delete),
          )
        ],
      ),
      body: Container(
        padding: const EdgeInsets.all(10),
        child: Text('vola'),
      ),
    );
  }
}
