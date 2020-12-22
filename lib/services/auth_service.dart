import 'dart:convert';

import 'package:control_escolar/enviroment/enviroment.dart';
import 'package:control_escolar/responses/auth_response.dart';
import 'package:control_escolar/responses/error_response.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

enum ACTION { LOGIN, REGISTRATION }

class AuthService with ChangeNotifier {
  User user;
  ErrorResponse error;
  String token;

  Future login(String email, String password) async {
    final data = {
      'email': "jovannyrch@gmail.com",
      'password': "123qwe",
    };
    /* final data = {
      'email': "jovannyrch@gmail.com",
      'password': "123qwe",
    }; */
    return await action("${Enviroment.apiUrl}/auth/login", data);
  }

  Future signup(String email, String name, String password) async {
    final data = {
      'name': "name ",
      'email': "test100@gmail.com",
      'password': "123qwe",
    };
    return await action("${Enviroment.apiUrl}/auth/register", data);
  }

  Future action(String url, Map<String, String> data) async {
    print("request to $url");
    final resp = await http.post(url,
        body: jsonEncode(data), headers: {'Content-Type': 'application/json'});
    print(resp.body);
    if (resp.statusCode == 200) {
      AuthResponse response = AuthResponse.fromJson(jsonDecode(resp.body));
      user = response.user;
      token = response.access_token;
      notifyListeners();
      return true;
    } else {
      error = ErrorResponse.fromJson(jsonDecode(resp.body));
      return false;
    }
  }
}
