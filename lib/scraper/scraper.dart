/*import 'package:flutter/material.dart';
import 'dart:convert';
import 'dart:async';
import 'package:http/http.dart';
import 'package:html/parser.dart';
import 'package:html/dom.dart';

class Scraper extends StatefulWidget {
  @override
  _ScraperState createState() => _ScraperState();
}

class _ScraperState extends State<Scraper> {
  String txt = '';

  Future getData() async {
    final response = await http.get("");
    debugPrint(response.body);
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Proba'),
      ),
    );
  }
}

Future initiate() async {
  // Conectem amb la pàgina web de gencat
  var client = Client();
  Response response = await client.get('https://news.ycombinator.com/');

  var document = parse(response.body);
  List<dynamic> links = document.querySelectorAll('td.title > a.storylink');
  List<Map<String, dynamic>> linkMap = [];

  for (var link in links) {
    linkMap.add({
      'title': link.text,
      'href': link.attributes['href'],
    });
  }
  print(linkMap);
  return json.encode(linkMap);
}*/
