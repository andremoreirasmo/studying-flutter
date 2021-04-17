import 'dart:convert';

class Carro {
  final int id;
  final String nome;
  final String tipo;
  final String descricao;
  final String urlFoto;
  final String urlVideo;
  final String latitude;
  final String longitude;
  
  Carro({
    this.id,
    this.nome,
    this.tipo,
    this.descricao,
    this.urlFoto,
    this.urlVideo,
    this.latitude,
    this.longitude,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'nome': nome,
      'tipo': tipo,
      'descricao': descricao,
      'urlFoto': urlFoto,
      'urlVideo': urlVideo,
      'latitude': latitude,
      'longitude': longitude,
    };
  }

  factory Carro.fromMap(Map<String, dynamic> map) {
    return Carro(
      id: map['id']?.toInt(),
      nome: map['nome'],
      tipo: map['tipo'],
      descricao: map['descricao'],
      urlFoto: map['urlFoto'],
      urlVideo: map['urlVideo'],
      latitude: map['latitude'],
      longitude: map['longitude'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Carro.fromJson(String source) => Carro.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Carro(id: $id, nome: $nome, tipo: $tipo, descricao: $descricao, urlFoto: $urlFoto, urlVideo: $urlVideo, latitude: $latitude, longitude: $longitude)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Carro &&
        other.id == id &&
        other.nome == nome &&
        other.tipo == tipo &&
        other.descricao == descricao &&
        other.urlFoto == urlFoto &&
        other.urlVideo == urlVideo &&
        other.latitude == latitude &&
        other.longitude == longitude;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        nome.hashCode ^
        tipo.hashCode ^
        descricao.hashCode ^
        urlFoto.hashCode ^
        urlVideo.hashCode ^
        latitude.hashCode ^
        longitude.hashCode;
  }
}
