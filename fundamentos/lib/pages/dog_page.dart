import 'package:flutter/material.dart';

import 'package:aula01/pages/hello_listview.dart';

class DogPage extends StatelessWidget {
  final Dog dog;

  const DogPage({
    this.dog,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(dog.nome),
      ),
      body: Image.asset(dog.foto),
    );
  }
}
