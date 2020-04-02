import 'package:flutter/material.dart';
import 'package:hrm/models/user_model.dart';
import 'package:hrm/screens/authentication/sign_in.dart';
import 'package:hrm/screens/dashboard/dashboard.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Wrapper extends StatefulWidget {
  @override
  _WrapperState createState() => _WrapperState();
}

class _WrapperState extends State<Wrapper> {
  String user;

  signInChecker() async{

    SharedPreferences prefs = await SharedPreferences.getInstance();
    
    user = prefs.getString('user');

    if(user == null) {
      Navigator.pushReplacementNamed(context, '/signin');
    } else {
      Navigator.pushReplacementNamed(context, '/dashboard',arguments: UserModel(email: user));
    }

  }

  @override
  void initState() {
    super.initState();
    signInChecker();
  }

  @override
  Widget build(BuildContext context) {
    return user != null ? Dashboard() : SignIn();
  }
}
