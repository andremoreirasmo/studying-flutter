import 'dart:convert';

import 'package:carros/pages/carro/carro.dart';
import 'package:http/http.dart' as http;

class CarrosApi {
  static Future<List<Carro>> getCarros() async {
    var url = Uri.parse('http://carros-springboot.herokuapp.com/api/v1/carros');

    var response = await http.get(url);
    List list = json.decode(response.body);

    final List<Carro> carros = list.map<Carro>((map) => Carro.fromMap(map)).toList();
    return carros;
  }
}
