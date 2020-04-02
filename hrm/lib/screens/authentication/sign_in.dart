import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hrm/services/auth_service.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: Colors.deepPurple));
    return SafeArea(
        child: Scaffold(
            body: Container(
      alignment: Alignment.center,
      color: Colors.deepPurple,
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(20)),
        margin: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Container(
              child: Image.asset('assets/time.jpg'),
            ),
            Container(
              child: Text('Timesheet Management',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25)),
            ),
            Container(
              padding: const EdgeInsets.only(bottom: 10),
              child: Column(
                children: <Widget>[
                  Container(
                    margin: const EdgeInsets.only(bottom: 10),
                    child: FlatButton.icon(
                        onPressed: () async {
                          await AuthService().signInWithMicrosoft();
                          Navigator.pushReplacementNamed(context, '/dashboard');
                        },
                        color: Colors.black,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                        icon: Icon(
                          Icons.arrow_forward,
                          color: Colors.white,
                        ),
                        label: Text('Sign In with Microsoft',
                            style: TextStyle(color: Colors.white))),
                  ),
                  Text('Inexis - HRM',
                      style: TextStyle(fontWeight: FontWeight.bold)),
                ],
              ),
            ),
          ],
        ),
      ),
    )));
  }
}
