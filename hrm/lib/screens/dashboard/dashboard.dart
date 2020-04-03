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
            onPressed: () {
              Navigator.pushNamed(context, '/create',
                  arguments: UserModel(email: args.email));
            },
            icon: Icon(Icons.add_box, color: Colors.blue),
          )
        ],
      ),
      drawer: Drawer(
          child: ListView(
        children: <Widget>[
          DrawerHeader(
            child: Text('Welcome'),
            decoration: BoxDecoration(
                color: Colors.blueAccent,
                image: DecorationImage(
                    image: AssetImage('assets/timesheet.webp'))),
          ),
          ListTile(
            onTap: () {
              Navigator.pushNamed(context, '/create',
                  arguments: UserModel(email: args.email));
            },
            title: Text('Create Timesheet'),
            leading: Icon(Icons.add_box),
          ),
          ListTile(
            title: Text('Settings'),
            leading: Icon(Icons.settings),
          ),
          ListTile(
            onTap: () async {
              await AuthService().signOutMicrosoft();
              Navigator.pushReplacementNamed(context, '/signin');
            },
            title: Text('Sign Out'),
            leading: Icon(Icons.exit_to_app),
          ),
        ],
      )),
      body: Container(
        alignment: Alignment.topCenter,
        color: Colors.white,
        child: Calender(uid: args.email),
      ),
    );
  }
}
