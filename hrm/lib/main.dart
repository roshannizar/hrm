import 'package:flutter/material.dart';
import 'package:hrm/screens/dashboard/dashboard.dart';
import 'package:hrm/shared/wrapper.dart';

import 'screens/authentication/sign_in.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(initialRoute: '/', routes: {
      '/': (context) => Wrapper(),
      '/signin': (context) => SignIn(),
      '/dashboard': (context) => Dashboard()
    });
  }
}
