import 'package:flutter/material.dart';
import 'package:hrm/models/user_model.dart';
import 'package:hrm/screens/authentication/sign_in.dart';
import 'package:hrm/screens/dashboard/dashboard.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserModel>(context);

    return user != null ? Dashboard():SignIn();
  }
}