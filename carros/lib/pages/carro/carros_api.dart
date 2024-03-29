import 'dart:convert';

import 'package:carros/pages/carro/carro.dart';
import 'package:carros/pages/login/usuario.dart';
import 'package:http/http.dart' as http;

class TipoCarro {
  static final String classicos = "classicos";
  static final String esportivos = "esportivos";
  static final String luxo = "luxo";
}

class CarrosApi {
  static Future<List<Carro>> getCarros(String tipo) async {
    Usuario user = await Usuario.get();

    Map<String, String> headers = {
      "Content-Type": "application/json",
      "Authorization": "Bearer ${user.token}",
    };

    var url = Uri.parse(
        'http://carros-springboot.herokuapp.com/api/v2/carros/tipo/$tipo');

    var response = await http.get(url, headers: headers);
    List list = json.decode(response.body);

    final List<Carro> carros =
        list.map<Carro>((map) => Carro.fromMap(map)).toList();
    return carros;
  }
}
