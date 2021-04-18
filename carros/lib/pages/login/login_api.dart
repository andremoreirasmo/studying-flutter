import 'dart:convert';

import 'package:carros/pages/api_response.dart';
import 'package:carros/pages/login/usuario.dart';
import 'package:http/http.dart' as http;

class LoginApi {
  static Future<ApiResponse<Usuario>> login(String login, String senha) async {
    try {
      var url =
          Uri.parse('http://carros-springboot.herokuapp.com/api/v2/login');

      final headers = {
        "Content-Type": "application/json",
      };

      final params = {
        'username': login,
        'password': senha,
      };

      var response = await http.post(
        url,
        body: json.encode(params),
        headers: headers,
      );

      Map mapResponse = json.decode(response.body);
      if (response.statusCode == 200) {
        Usuario user = Usuario.fromMap(mapResponse);
        user.save();

        return ApiResponse.ok(user);
      }

      return ApiResponse.error(mapResponse["error"]);
    } on Exception catch (error, exception) {
      print("Erro no login $error > $exception");

      return ApiResponse.error("Não foi possível fazer o login.");
    }
  }
}
