import 'package:aula01/pages/dog_page.dart';
import 'package:aula01/utils/nav.dart';
import 'package:flutter/material.dart';

class Dog {
  String nome;
  String foto;

  Dog({
    this.nome,
    this.foto,
  });
}

class HelloListView extends StatefulWidget {
  @override
  _HelloListViewState createState() => _HelloListViewState();
}

class _HelloListViewState extends State<HelloListView> {
  bool gridView = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ListView"),
        actions: [
          IconButton(
            icon: Icon(Icons.list),
            onPressed: () => setState(() => gridView = false),
          ),
          IconButton(
            icon: Icon(Icons.grid_on),
            onPressed: () => setState(() => gridView = true),
          )
        ],
      ),
      body: _body(),
    );
  }

  _body() {
    List<Dog> dogs = [
      Dog(nome: "Dog 1", foto: "assets/images/1.png"),
      Dog(nome: "Dog 2", foto: "assets/images/2.png"),
      Dog(nome: "Dog 3", foto: "assets/images/3.png"),
      Dog(nome: "Dog 4", foto: "assets/images/4.png"),
      Dog(nome: "Dog 5", foto: "assets/images/5.png"),
    ];

    if (gridView) {
      return GridView.builder(
        gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemCount: dogs.length,
        itemBuilder: (context, index) {
          return _itemView(dogs, index);
        },
      );
    } else {
      return ListView.builder(
        itemExtent: 350,
        itemCount: dogs.length,
        itemBuilder: (context, index) {
          return _itemView(dogs, index);
        },
      );
    }
  }

  _itemView(List<Dog> dogs, int index) {
    Dog dog = dogs[index];

    return GestureDetector(
      onTap: () => push(
          context,
          DogPage(
            dog: dog,
          )),
      child: Stack(
        fit: StackFit.expand,
        children: [
          _img(dog.foto),
          Align(
            alignment: Alignment.topLeft,
            child: Container(
              margin: EdgeInsets.all(12),
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                  color: Colors.black45,
                  borderRadius: BorderRadius.circular(16)),
              child: Text(
                dog.nome,
                style: TextStyle(
                  fontSize: 26,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  _img(img) {
    return Image.asset(
      img,
      fit: BoxFit.cover,
    );
  }
}
