import 'package:carros/pages/carro/carro.dart';
import 'package:flutter/material.dart';

class CarroPage extends StatelessWidget {
  final Carro carro;

  const CarroPage(this.carro);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(carro.nome),
      ),
      body: _body(),
    );
  }

  _body() {
    return Container(
      padding: EdgeInsets.all(16),
      child: Image.network(carro.urlFoto ??
          "https://i.pinimg.com/originals/23/bf/c6/23bfc60e70a75dce0d340ef16076e717.png"),
    );
  }
}
