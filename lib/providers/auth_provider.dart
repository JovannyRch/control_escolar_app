import 'package:control_escolar/models/User.dart';
import 'package:flutter/material.dart';

class AuthProvider with ChangeNotifier {
  User _user;
  String _token;

  User get user {
    return _user;
  }

  String get token {
    return _token;
  }

  set user(User user) {
    _user = user;
    notifyListeners();
  }

  set token(String token) {
    _token = token;
    notifyListeners();
  }
}
