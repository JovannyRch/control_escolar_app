import 'package:control_escolar/models/AppUser.dart';
import 'package:flutter/material.dart';

class AuthProvider with ChangeNotifier {
  AppUser _user;

  AppUser get user {
    return _user;
  }

  set user(AppUser user) {
    _user = user;
    notifyListeners();
  }
}
