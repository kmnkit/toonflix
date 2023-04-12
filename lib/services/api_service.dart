import 'dart:convert' as convert;
import 'package:http/http.dart' as http;
import 'package:toonflix/models/detail.dart';
import 'package:toonflix/models/episode.dart';
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

  static Future<WebtoonDetail> getToonById(String id) async {
    final url = Uri.parse('$baseUrl/$id');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final webtoon = convert.jsonDecode(response.body);
      return WebtoonDetail.fromJson(webtoon);
    }
    throw Error();
  }

  static Future<List<Episode>> getLatestEpisodesById(String id) async {
    List<Episode> episodeList = [];

    final url = Uri.parse('$baseUrl/$id/episodes');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final episodes = convert.jsonDecode(response.body);
      for (var episode in episodes) {
        final latestEpisode = Episode.fromJson(episode);
        episodeList.add(latestEpisode);
      }
      return episodeList;
    }
    throw Error();
  }
}
