import 'dart:convert' as convert;
import 'package:http/http.dart' as http;
import 'package:toonflix/models/webtoon.dart';

class ApiService {
  static const String baseUrl =
      "https://webtoon-crawler.nomadcoders.workers.dev";
  static const String today = "/today";

  static Future<List<Webtoon>> getTodaysToons() async {
    List<Webtoon> webtoonInstances = [];
    final url = Uri.parse('$baseUrl$today');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final webtoons = convert.jsonDecode(response.body);
      for (var webtoon in webtoons) {
        final toon = Webtoon.fromJson(webtoon);
        webtoonInstances.add(toon);
      }
      return webtoonInstances;
    }
    throw Error();
  }
}
