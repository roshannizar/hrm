import 'dart:async';

import 'package:aad_oauth/model/config.dart';
import 'package:aad_oauth/aad_oauth.dart';
import 'package:hrm/models/user_model.dart';
import 'package:jwt_decode/jwt_decode.dart';

class AuthService {
  final Config config = new Config(
      "44e3cf94-19c9-4e32-96c3-14f5bf01391a",
      "f3f3ef90-df62-4ac9-892b-c889caa4affb",
      "openid profile",
      "https://login.microsoftonline.com/common/oauth2/nativeclient");
  final streamController = StreamController<UserModel>.broadcast();

  Stream<UserModel> get _userSink => streamController.stream;

  @override
  void dispose(){
    streamController.close();
  }

  UserModel _userModel(Map<String, dynamic> _user) {
    return _user != null ? UserModel(email: _user['upn'].toString()) : null;
  }

  Stream<UserModel> get user {
    _userSink.listen((onData) {
      return onData.email;
    }, onError: ((f) {
      return 'emtpy';
    }));

    return _userSink;
  }

  Future signInWithMicrosoft() async {
    final AadOAuth oauth = new AadOAuth(config);
    try {
      await oauth.login();
      String accessToken = await oauth.getAccessToken();
      Map<String, dynamic> payload = Jwt.parseJwt(accessToken);
      return _userModel(payload);
    } catch (e) {
      print(e);
    }
  }

  Future signOutMicrosoft() async {
    try {
      final AadOAuth oauth = new AadOAuth(config);

      await oauth.logout();
    } catch (e) {
      print(e);
    }
  }
}
