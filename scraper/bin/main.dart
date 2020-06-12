import 'package:http/http.dart';
//import 'package:hacker_news_scraper/hacker_news_scraper.dart' as hacker_news_scraper;

import 'package:hacker_news_scraper/graus_upc.dart' as graus;

Future main(List<String> arguments) async {
  graus.initiate(Client());
}
