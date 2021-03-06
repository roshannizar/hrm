import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hrm/screens/dashboard/dashboard.dart';
import 'package:hrm/screens/timesheet/new_timesheet.dart';
import 'package:hrm/screens/timesheet/view_timesheet.dart';
import 'package:hrm/shared/wrapper.dart';

import 'screens/authentication/sign_in.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
        SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: Colors.black));
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/', routes: {
      '/': (context) => Wrapper(),
      '/signin': (context) => SignIn(),
      '/dashboard': (context) => Dashboard(),
      '/create':(context) => NewTimesheet(),
      '/view':(context) => ViewTimesheet()
    });
  }
}
