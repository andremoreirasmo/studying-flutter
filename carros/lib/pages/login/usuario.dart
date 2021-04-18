import 'dart:convert';

import 'package:carros/utils/prefs.dart';

class Usuario {
  final int id;
  final String login;
  final String nome;
  final String email;
  final String urlFoto;
  final String token;
  final List<String> roles;

  Usuario({
    this.id,
    this.login,
    this.nome,
    this.email,
    this.urlFoto,
    this.token,
    this.roles,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'login': login,
      'nome': nome,
      'email': email,
      'urlFoto': urlFoto,
      'token': token,
      'roles': roles,
    };
  }

  factory Usuario.fromMap(Map<String, dynamic> map) {
    return Usuario(
      id: map['id']?.toInt(),
      login: map['login'],
      nome: map['nome'],
      email: map['email'],
      urlFoto: map['urlFoto'],
      token: map['token'],
      roles: List<String>.from(map['roles']),
    );
  }

  String toJson() => json.encode(toMap());

  factory Usuario.fromJson(String source) =>
      Usuario.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Usuario(id: $id, login: $login, nome: $nome, email: $email, urlFoto: $urlFoto, token: $token, roles: $roles)';
  }

  void save() {
    Prefs.setString("user.prefs", toJson());
  }

  static Future<Usuario> get() async {
    String sJson = await Prefs.getString("user.prefs");
    if(sJson.isEmpty) {
      return null;
    }

    return Usuario.fromJson(sJson);
  }

  static clear() {
    Prefs.setString("user.prefs", "");
  }
}
