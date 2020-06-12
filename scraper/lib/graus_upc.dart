import 'dart:convert';
import 'package:http/http.dart';
import 'package:html/parser.dart';
import 'package:html/dom.dart';

List<Map<String, dynamic>> treuLinksGraus(document) {
  List<Map<String, dynamic>> linkList = [];
  List<Element> links = document.querySelectorAll('div.destacat_text_cont > a');
  for (var link in links) {
    linkList.add({
      'nom': link.text.trim(),
      'href': "http://universitats.gencat.cat" + link.attributes['href'],
    });
  }
  return linkList;
}

Future initiate(BaseClient client) async {
  final String baseURL = 'http://universitats.gencat.cat/ca/cercador/?tipusOferta=grau&addForm_univ_2=UPC&accion=cercar&univ=%28%22UPC%22%29';

  Document document;
  List<Map<String, dynamic>> links = [];

  // Carrega pàgina i parse
  Response response = await client.get(baseURL);
  if (response.statusCode != 200) {
    return response.body;
  }
  document = parse(response.body);

  links.addAll(treuLinksGraus(document));

  var linkSeguent = document.querySelector('div.paginacio > ul.pagination > li > a.seguent');
  var urlSeguent = linkSeguent.attributes['href'];
  var paginaSeguent = "http://universitats.gencat.cat" + urlSeguent;
  
  // Carrega pàgina i parse
  response = await client.get(paginaSeguent);
  if (response.statusCode != 200) {
    return response.body;
  }
  document = parse(response.body);
  links.addAll(treuLinksGraus(document));
  
  print(json.encode(links));
}
