import 'dart:convert';

import 'package:control_escolar/enviroment/enviroment.dart';
import 'package:control_escolar/providers/auth_provider.dart';
import 'package:control_escolar/responses/auth_response.dart';
import 'package:control_escolar/responses/error_response.dart';
import 'package:http/http.dart' as http;

enum ACTION { LOGIN, REGISTRATION }

class AuthService {
  ErrorResponse error;
  AuthProvider authProvider;

  Future<AuthResponse> login(String email, String password) async {
    final data = {
      'email': email,
      'password': password,
    };
    AuthResponse loginResponse = await fetchDataAuthorizationAndSaveUser(
        "${Enviroment.apiUrl}/auth/login", data);
    return loginResponse;
  }

  Future<AuthResponse> signup(
      String email, String name, String password) async {
    final data = {
      'name': "name",
      'email': "test100@gmail.com",
      'password': "123qwe",
    };
    AuthResponse signUpResponse = await fetchDataAuthorizationAndSaveUser(
        "${Enviroment.apiUrl}/auth/register", data);
    return signUpResponse;
  }

  Future<AuthResponse> fetchDataAuthorizationAndSaveUser(
      String url, Map<String, String> data) async {
    final resp = await http.post(url,
        body: jsonEncode(data), headers: {'Content-Type': 'application/json'});

    if (resp.statusCode == 200) {
      final responseInJson = jsonDecode(resp.body);
      AuthResponse response = AuthResponse.fromJson(responseInJson);
      return response;
    } else {
      error = ErrorResponse.fromJson(jsonDecode(resp.body));
      return null;
    }
  }
}
