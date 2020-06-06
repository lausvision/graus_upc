import 'dart:convert';
import 'package:http/http.dart';
import 'package:html/parser.dart';
import 'package:html/dom.dart';

Future initiate(BaseClient client) async {
  // Make API call to Hackernews homepage
  Response response = await client.get(
      'http://universitats.gencat.cat/ca/cercador/?tipusOferta=grau&addForm_univ_2=UPC&accion=cercar&univ=%28%22UPC%22%29');

  if (response.statusCode != 200) return response.body;

  // Use html parser
  var document = parse(response.body);
  List<Element> links =
      document.querySelectorAll('div.destacat_text_cont > div.link_resultats');
  List<Map<String, dynamic>> linkMap = [];

  for (var link in links) {
    linkMap.add({
      'nom': link.text.substring(53, 86),
      'loc': link.text.substring(140),
      'href': link.attributes['href'],
    });
  }
  /*document.getElementsByTagName('a').forEach((Element element){
    print(element.text);
  });*/
  return json.encode(linkMap[0]);
}
