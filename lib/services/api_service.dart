import 'dart:convert';
import 'package:control_escolar/enviroment/enviroment.dart';
import 'package:control_escolar/responses/error_response.dart';
import 'package:control_escolar/services/auth_service.dart';
import 'package:control_escolar/shared/user_preferences.dart';
import 'package:http/http.dart' as http;

enum ACTION { LOGIN, REGISTRATION }

class Api {
  ErrorResponse error;
  final AuthService authService = new AuthService();
  UserPrefrences _userPrefrences = new UserPrefrences();
  String token;

  Api() {
    init();
  }

  void init() async {
    token = await authService.getToken();
  }

  Future<String> post(String url, Map<String, String> data) async {
    final resp = await http.post(formatUrl(url),
        body: jsonEncode(data), headers: await getHeaders());
    if (resp.statusCode == 200) {
      return resp.body;
    } else {
      return "";
    }
  }

  Future<String> put(String url, Map<String, String> data) async {
    final resp = await http.put(formatUrl(url),
        body: jsonEncode(data), headers: await getHeaders());
    if (resp.statusCode == 200) {
      return resp.body;
    } else {
      return "";
    }
  }

  Future<String> get(String url) async {
    final resp = await http.get(formatUrl(url), headers: await getHeaders());
  
    if (resp.statusCode == 200) {
      return resp.body;
    } else {
      return "";
    }
  }

  Future<Map<String, String>> getHeaders() async {
    final token = await authService.getToken();
    return {
      'Content-Type': 'application/json',
      'Authorization': "Bearer $token"
    };
  }

  String formatUrl(String endpoint) {
    return "${Enviroment.apiUrl}/${_userPrefrences.role}$endpoint";
  }
}
