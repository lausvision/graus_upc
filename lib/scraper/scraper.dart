/*import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart';
import 'package:html/parser.dart';
import 'package:html/dom.dart';


Future initiate() async {
  // Conectem amb la pàgina web de gencat
  var client = Client();
  Response response = await client.get('https://news.ycombinator.com/');

  var document = parse(response.body);
  List<Element> links = document.querySelectorAll('td.title > a.storylink');
  List<Map<String, dynamic>> linkMap = [];

  for (var link in links) {
    linkMap.add({
      'title': link.text,
      'href': link.attributes['href'],
    });
  }
  print (linkMap);
  return json.encode(linkMap);
}*/
