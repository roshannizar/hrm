import 'dart:async';

import 'package:aad_oauth/model/config.dart';
import 'package:aad_oauth/aad_oauth.dart';
import 'package:hrm/models/user_model.dart';
import 'package:jwt_decode/jwt_decode.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthService {
  final Config config = new Config(
      "44e3cf94-19c9-4e32-96c3-14f5bf01391a",
      "f3f3ef90-df62-4ac9-892b-c889caa4affb",
      "openid profile",
      "https://login.microsoftonline.com/common/oauth2/nativeclient");

  UserModel _userModel(Map<String, dynamic> _user) {
    return _user != null ? UserModel(email: _user['upn'].toString()) : null;
  }

  Future signInWithMicrosoft() async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    final AadOAuth oauth = new AadOAuth(config);

    try {
      await oauth.login();
      String accessToken = await oauth.getAccessToken();
      Map<String, dynamic> payload = Jwt.parseJwt(accessToken);
      _prefs.setString('user', payload['upn'].toString());
      _prefs.setString('displayName', payload['name'].toString());
      return _userModel(payload);
    } catch (e) {
      print(e);
    }
  }

  Future signOutMicrosoft() async {
    try {
      SharedPreferences _prefs = await SharedPreferences.getInstance();
      final AadOAuth oauth = new AadOAuth(config);
      await oauth.logout();
      _prefs.clear();
    } catch (e) {
      print(e);
    }
  }
}
