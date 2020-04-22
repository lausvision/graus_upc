import 'package:flutter/material.dart';
//import 'package:graus_upc/data/llista.dart';

class Filtre extends StatefulWidget {
  @override
  _FiltreState createState() => _FiltreState();
}

class _FiltreState extends State<Filtre> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  _filter(context, 'tecnologic'),
                  _filter(context, '<10.0'),
                ],
              ),
              _camp(context, 'Branca de coneixement'),
              _camp(context, 'Modalitat'),
              _camp(context, 'Localització'),
              _camp(context, 'Nota de tall'),
              RaisedButton(
                child: Text('FILTRAR'),
                color: Colors.blue[100],
                shape: StadiumBorder(),
                onPressed: () {},
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _camp(BuildContext context, String valor) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: InkWell(
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color: Colors.black,
              width: 2,
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                valor,
                textAlign: TextAlign.end,
                style: TextStyle(fontSize: 16),
              ),
              IconButton(
                icon: Icon(Icons.play_arrow),
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _filter(BuildContext context, String filtre) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: InkWell(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                filtre,
                textAlign: TextAlign.end,
                style: TextStyle(fontSize: 16),
              ),
              IconButton(
                icon: Icon(Icons.clear),
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
