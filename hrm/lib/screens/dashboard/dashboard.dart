import 'package:flutter/material.dart';
import 'package:hrm/services/auth_service.dart';

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Testing'),
      ),
      body: Container(
        child: IconButton(
          onPressed: () async {
            await AuthService().signOutMicrosoft();
            Navigator.pushReplacementNamed(context, '/signin');
          },
          icon: Icon(Icons.exit_to_app),
        ),
      ),
    );
  }
}