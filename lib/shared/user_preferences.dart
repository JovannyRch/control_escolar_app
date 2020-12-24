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

  set token(String val) {
    _prefs.setString('token', val);
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

  set userId(String val) {
    _prefs.setString('userId', val);
  }

  get fullName {
    return _prefs.getString("fullName") ?? '';
  }

  set fullName(String val) {
    _prefs.setString('fullName', val);
  }

  get role {
    return _prefs.getString("role") ?? '';
  }

  set role(String val) {
    _prefs.setString('role', val);
  }

  get cuenta {
    return _prefs.getString("cuenta") ?? '';
  }

  set cuenta(String val) {
    _prefs.setString('cuenta', val);
  }
}
