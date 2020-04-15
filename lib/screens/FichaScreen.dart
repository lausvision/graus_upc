import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:url_launcher/url_launcher.dart';

class FichaScreen extends StatefulWidget {
  String nom, descripcio, localitzacio, link, nota,objectiu;
  FichaScreen(
      this.nom, this.descripcio, this.localitzacio, this.link, this.nota,this.objectiu);

  @override
  _FichaScreenState createState() =>
      _FichaScreenState(nom, descripcio, localitzacio, link, nota,objectiu);
}

class _FichaScreenState extends State<FichaScreen> {
  String nom, descripcio, localitzacio, link, nota,objectiu;
  _FichaScreenState(
      this.nom, this.descripcio, this.localitzacio, this.link, this.nota,this.objectiu);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        leading: BackButton(color: Colors.black),
        title: Text("Sample"),
        centerTitle: true,
        backgroundColor: Colors.white,
        actions: <Widget>[
          IconButton(
              padding: const EdgeInsets.only(right: 35.0),
              icon: Icon(Icons.favorite_border),
              tooltip: 'Favorite',
              color: Colors.black,
              onPressed: () {}),
          IconButton(
              padding: const EdgeInsets.only(right: 20.0),
              icon: Icon(Icons.share),
              tooltip: 'Share',
              color: Colors.black,
              onPressed: () {}),
        ],
      ),
      body: StreamBuilder(
          stream:
              Firestore.instance.collection('Graus').orderBy('nom').snapshots(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) return const Text('Loading...');
            return Stack(
              alignment: AlignmentDirectional.topCenter,
              children: <Widget>[
                Text(
                  nom,
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.blue[50],
                    fontWeight: FontWeight.w700,
                  ),
                ),
            
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(Icons.location_city),
                    Text(localitzacio),
                    SizedBox(width: 10)
                  ],
                ),
                SizedBox(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 80.0),
                    child: Container(
                      margin: EdgeInsets.all(15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            'Descripció:',
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.blue[50],
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          Text(
                            descripcio,
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                            ),
                          ),
                          Text(
                            'Sortides professionals: ',
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.blue[50],
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          Text(
                            objectiu,
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                            ),
                          ),
                          Hyperlink(link,
                              'Web del Grau'),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            );
          }),
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
        style:
            TextStyle(decoration: TextDecoration.underline, color: Colors.blue),
      ),
      onTap: _launchURL,
    );
  }
}
