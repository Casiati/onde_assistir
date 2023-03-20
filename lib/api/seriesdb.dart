import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:onde_assistir/api/api.dart';

class Seriesdb {
  final Api api = Api();

  Future<Map> getSeriesTopRated() async {
    http.Response response;
    var url = Uri.parse('${api.series}top_rated?${api.key}&${api.language}&region=BR');
    response = await http.get(url);
    return json.decode(response.body.replaceAll('name', 'title'));
  }

  Future<Map> getSeriesPopular() async {
    http.Response response;
    var url = Uri.parse('${api.series}popular?${api.key}&${api.language}&region=BR');
    response = await http.get(url);
    return json.decode(response.body.replaceAll('name', 'title'));
  }

  Future<Map> getProvider(serieId) async {
    http.Response response;
    var url = Uri.parse('${api.series}$serieId/watch/providers?${api.key}');
    response = await http.get(url);
    return json.decode(response.body);
  }

  Future<Map> getRecommendations(serieId) async {
    http.Response response;
    var url = Uri.parse('${api.series}$serieId/similar?${api.key}&${api.language}');
    response = await http.get(url);
    return json.decode(response.body.replaceAll('name', 'title'));
  }

}