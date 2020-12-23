import 'package:shared_preferences/shared_preferences.dart';

class UserPrefrences {
  static final UserPrefrences _instance = new UserPrefrences._internal();

  UserPrefrences._internal();
  SharedPreferences _prefs;

  initPrefs() async {
    _prefs = await SharedPreferences.getInstance();
  }

  get email {
    return _prefs.getString("email") ?? '';
  }

  set email(String name) {
    _prefs.setString('email', name);
  }

  get token {
    return _prefs.getInt('token') ?? "";
  }

  set token(String token) {
    _prefs.setString('token', token);
  }

  get isLogged {
    return !this.email.isEmpty;
  }

  factory UserPrefrences() {
    return _instance;
  }

  get userId {
    return _prefs.getString("userId") ?? '';
  }

  set userId(String name) {
    _prefs.setString('userId', name);
  }

  get fullName {
    return _prefs.getString("fullName") ?? '';
  }

  set fullName(String name) {
    _prefs.setString('fullName', name);
  }

  
  get role {
    return _prefs.getString("role") ?? '';
  }

  set role(String name) {
    _prefs.setString('role', name);
  }
  
  
  
}