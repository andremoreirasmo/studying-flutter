import 'package:carros/pages/carro/carro_page.dart';
import 'package:carros/pages/carro/carros_bloc.dart';
import 'package:carros/utils/nav.dart';
import 'package:carros/widgets/text_error.dart';
import 'package:flutter/material.dart';

import 'carro.dart';

class CarrosListView extends StatefulWidget {
  final String tipoCarro;

  const CarrosListView(this.tipoCarro);

  @override
  _CarrosListViewState createState() => _CarrosListViewState();
}

class _CarrosListViewState extends State<CarrosListView>
    with AutomaticKeepAliveClientMixin<CarrosListView> {
  final _bloc = CarrosBloc();

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();

    _bloc.fetch(widget.tipoCarro);
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);

    return StreamBuilder(
      stream: _bloc.stream,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return TextError("Não foi possível buscar os carros");
        }

        if (!snapshot.hasData) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }

        return _listView(snapshot.data);
      },
    );
  }

  Container _listView(List<Carro> carros) {
    return Container(
      padding: EdgeInsets.all(16),
      child: ListView.builder(
          itemCount: carros.length,
          itemBuilder: (context, index) {
            Carro c = carros[index];

            return Card(
              color: Colors.grey[100],
              child: Container(
                padding: EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Image.network(
                        c.urlFoto ??
                            "https://i.pinimg.com/originals/23/bf/c6/23bfc60e70a75dce0d340ef16076e717.png",
                        width: 150,
                      ),
                    ),
                    Text(
                      c.nome ?? "Carro",
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(fontSize: 22),
                    ),
                    Text(
                      c.descricao ?? 'Descrição...',
                      maxLines: 1,
                      style: TextStyle(fontSize: 16),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        TextButton(
                          child: const Text('DETALHES'),
                          onPressed: () => onClickCarro(c),
                        ),
                        const SizedBox(width: 8),
                        TextButton(
                          child: const Text('SHARED'),
                          onPressed: () {/* ... */},
                        ),
                        const SizedBox(width: 8),
                      ],
                    ),
                  ],
                ),
              ),
            );
          }),
    );
  }

  onClickCarro(Carro c) {
    push(context, CarroPage(c));
  }

  @override
  void dispose() {
    super.dispose();

    _bloc.dispose();
  }
}
