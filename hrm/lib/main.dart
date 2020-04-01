import 'package:flutter/material.dart';
import 'package:hrm/services/auth_service.dart';
import 'package:hrm/shared/wrapper.dart';
import 'package:provider/provider.dart';

import 'models/user_model.dart';
import 'screens/authentication/sign_in.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StreamProvider<UserModel>.value(
      value: AuthService().user,
      child:
          MaterialApp(initialRoute: '/', routes: {'/': (context) => Wrapper(),'/signin':(context) => SignIn()}),
    );
  }
}
