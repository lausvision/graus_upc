import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:graus_upc/models/MyProvider.dart';
import 'package:provider/provider.dart';
import 'package:share/share.dart';
import 'package:url_launcher/url_launcher.dart';

class FichaScreen extends StatefulWidget {
  final String nom, descripcio, localitzacio, link, nota, objectiu, foto;
  FichaScreen(this.nom, this.descripcio, this.localitzacio, this.link,
      this.nota, this.objectiu, this.foto);

  @override
  _FichaScreenState createState() => _FichaScreenState(
      nom, descripcio, localitzacio, link, nota, objectiu, foto);
}

class _FichaScreenState extends State<FichaScreen> {
  bool favourite = false;

  String nom, descripcio, localitzacio, link, nota, objectiu, foto;
  _FichaScreenState(this.nom, this.descripcio, this.localitzacio, this.link,
      this.nota, this.objectiu, this.foto);

  @override
  Widget build(BuildContext context) {
final log = Provider.of<MyProvider>(context);
    _authChechked() {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('Afegir grau a preferits'),
          content: Text('Cal fer Sign in a la app, continuar?'),
          actions: <Widget>[
            FlatButton(
              child: Text('Cancelar'),
              onPressed: () {
                setState(() {
                  favourite = !favourite;
                });
                Navigator.of(context).pop(false);
              },
            ),
            FlatButton(
                child: Text('Continuar'),
                onPressed: () {
                 // signInWithGoogle().whenComplete(() {
                 //   log.dotrue();
                   Navigator.of(context).pop(true);
                //  });
                  
                })
          ],
        ),
      ).then((salida) {
        if (salida) {
          setState(() {});
        }
      });
    }

    

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        leading: BackButton(color: Colors.black),
        title: Text("Sample"),
        centerTitle: true,
        backgroundColor: Colors.white,
        actions: <Widget>[
          IconButton(
            icon: Icon(favourite ? Icons.favorite : Icons.favorite_border),
            tooltip: 'Favorite',
            color: (favourite ? Colors.red : Colors.black),
            onPressed: () {
              log.doit();
              if (!log.check) {
                _authChechked();
              }
              // Usar provider para saber si estamos loggeados
              setState(() {
                favourite = !favourite;
              });
            },
          ),
          IconButton(
            icon: Icon(Icons.share),
            tooltip: 'Share',
            color: Colors.black,
            onPressed: () {
              final RenderBox box = context.findRenderObject();
              Share.share(
                  nom +
                      ' de la universitat ' +
                      localitzacio +
                      ' amb la nota de tall: ' +
                      nota,
                  subject: 'He trobat aquest grau per tu amb la app GrausUPC!',
                  sharePositionOrigin:
                      box.localToGlobal(Offset.zero) & box.size);

              // Share.share('', subject: 'He trobat aquest grau per tu *-*' );
            },
          ),
        ],
      ),
      body: Stack(
        alignment: AlignmentDirectional.topCenter,
        children: <Widget>[
          Foton(foto: foto),
          NotaDeTall(nota: nota),
          Titol(nom: nom, localitzacio: localitzacio),
          TextGeneral(descripcio: descripcio, objectiu: objectiu, link: link),
        ],
      ),
    );
  }
}

class NotaDeTall extends StatelessWidget {
  const NotaDeTall({
    Key key,
    @required this.nota,
  }) : super(key: key);

  final String nota;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Padding(
        padding: const EdgeInsets.only(top: 200, left: 270),
        child: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(5),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.black,
                border: Border.all(
                  color: Colors.white,
                  width: 2,
                ),
              ),
              child: Text(
                nota,
                textAlign: TextAlign.end,
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
            ),
            SizedBox(height: 5),
            Text(
              'Nota del tall',
              style: TextStyle(
                fontSize: 15,
                color: Colors.white,
              ),
            )
          ],
        ),
      ),
    );
  }
}

class Foton extends StatelessWidget {
  const Foton({
    Key key,
    @required this.foto,
  }) : super(key: key);

  final String foto;

  @override
  Widget build(BuildContext context) {
    return Stack(children: <Widget>[
      SizedBox(
        child: Container(
          height: 200,
          decoration: BoxDecoration(
            color: Colors.white,
            image: DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage(foto),
            ),
          ),
        ),
      ),
      SizedBox(
        child: Container(
          height: 200,
          decoration: BoxDecoration(
              color: Colors.white,
              gradient: LinearGradient(
                  begin: FractionalOffset.topCenter,
                  end: FractionalOffset.bottomCenter,
                  colors: [
                    Colors.grey.withOpacity(0.0),
                    Colors.black,
                  ],
                  stops: [
                    0.0,
                    0.99
                  ])),
        ),
      )
    ]);
  }
}

class Titol extends StatelessWidget {
  const Titol({
    Key key,
    @required this.nom,
    @required this.localitzacio,
  }) : super(key: key);

  final String nom;
  final String localitzacio;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Padding(
        padding: const EdgeInsets.only(top: 165, left: 20),
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Text(
                  nom,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
            SizedBox(height: 5),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Icon(Icons.location_city, color: Colors.white),
                SizedBox(width: 5),
                Text(
                  localitzacio,
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class TextGeneral extends StatelessWidget {
  const TextGeneral({
    Key key,
    @required this.descripcio,
    @required this.objectiu,
    @required this.link,
  }) : super(key: key);

  final String descripcio;
  final String objectiu;
  final String link;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Padding(
        padding: const EdgeInsets.only(top: 250.0),
        child: Container(
          margin: EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                'Descripció:',
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.blue[50],
                  fontWeight: FontWeight.w700,
                ),
              ),
              //CollapsibleText(descripcio),

              Text(
                descripcio,
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 10),
              Text(
                'Sortides professionals: ',
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.blue[50],
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(height: 3),
              Text(
                objectiu,
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 10),
              Center(child: Hyperlink(link, 'Web del Grau')),
            ],
          ),
        ),
      ),
    );
  }
}

class Hyperlink extends StatelessWidget {
  final String _url;
  final String _text;

  Hyperlink(this._url, this._text);

  _launchURL() async {
    if (await canLaunch(_url)) {
      await launch(_url);
    } else {
      throw 'Could not launch $_url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      //children: Widget Icon(Icons.web),
      child: Text(
        _text,
        style: TextStyle(
            decoration: TextDecoration.underline,
            color: Colors.blue,
            fontSize: 16),
      ),
      onTap: _launchURL,
    );
  }
}

class CollapsibleText extends StatefulWidget {
  final String descripcio;
  CollapsibleText(this.descripcio);

  @override
  _CollapsibleTextState createState() => _CollapsibleTextState(descripcio);
}

class _CollapsibleTextState extends State<CollapsibleText> {
  String descripcio;
  _CollapsibleTextState(this.descripcio);
  bool _expanded = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      // padding: const EdgeInsets.only(left: 7.0),
      height: (_expanded ? null : 100),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Text(
            descripcio,
            overflow: TextOverflow.fade,
            maxLines: (_expanded ? null : 3),
            textAlign: TextAlign.left,
            style: TextStyle(
              fontSize: 12,
              color: Colors.white,
            ),
          ),
          Container(
            height: 15,
            child: FlatButton(
              color: Colors.black,
              child: Text(
                _expanded ? 'Amaga' : 'Llegir més',
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.white,
                ),
              ),
              onPressed: () {
                setState(() {
                  _expanded = !_expanded;
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}
