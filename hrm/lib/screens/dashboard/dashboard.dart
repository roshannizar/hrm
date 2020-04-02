import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hrm/models/user_model.dart';
import 'package:hrm/screens/calender/Calender.dart';
import 'package:hrm/services/auth_service.dart';

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    final UserModel args = ModalRoute.of(context).settings.arguments;
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: Colors.black));
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        title: Text('Timesheet', style: TextStyle(color: Colors.black)),
        centerTitle: true,
        backgroundColor: Colors.white,
        actions: <Widget>[
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.filter_list),
          ),
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, '/create',
                  arguments: UserModel(email: args.email));
            },
            icon: Icon(Icons.add_box, color: Colors.blue),
          )
        ],
      ),
      drawer: Drawer(
        child: DrawerHeader(
          decoration: BoxDecoration(
            color: Colors.blue,
          ),
          child: IconButton(
            onPressed: () async {
              await AuthService().signOutMicrosoft();
              Navigator.pushReplacementNamed(context, '/signin');
            },
            icon: Icon(Icons.exit_to_app),
          ),
        ),
      ),
      body: Container(
        alignment: Alignment.topCenter,
        color: Colors.white,
        child: Calender(uid: args.email),
      ),
    );
  }
}
