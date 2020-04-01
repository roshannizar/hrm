import 'package:flutter/material.dart';
import 'package:hrm/services/auth_service.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            FlatButton.icon(
              onPressed: () async {
                await AuthService().signInWithMicrosoft();
                Navigator.pushReplacementNamed(context, '/dashboard');
              },
              icon: Icon(Icons.arrow_forward),
              label: Text('Login with Microsoft'),
            ),
             FlatButton.icon(
              onPressed: () async{
                await AuthService().signOutMicrosoft();

                Navigator.pushNamed(context, '/');
              },
              icon: Icon(Icons.exit_to_app),
              label: Text('Logout with Microsoft'),
            ),
          ],
        ),
      ),
    );
  }
}
