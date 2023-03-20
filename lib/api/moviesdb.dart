import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:onde_assistir/api/api.dart';

class Moviesdb {
  final Api api = Api();

  Future<Map> getMoviesTopRated() async {
    http.Response response;
    var url = Uri.parse('${api.movies}top_rated?${api.key}&${api.language}&page=1');
    response = await http.get(url);
    return json.decode(response.body);
  }

  Future<Map> getMoviesPopular() async {
    http.Response response;
    var url = Uri.parse('${api.movies}popular?${api.key}&${api.language}&region=BR');
    response = await http.get(url);
    return json.decode(response.body);
  }

  Future<Map> getProvider(movieId) async {
    http.Response response;
    var url = Uri.parse('${api.movies}$movieId/watch/providers?${api.key}');
    response = await http.get(url);
    return json.decode(response.body);
  }

  Future<Map> getSimilar(movieId) async {
    http.Response response;
    var url = Uri.parse('${api.movies}$movieId/similar?${api.key}&${api.language}');
    response = await http.get(url);
    return json.decode(response.body);
  }

  Future<Map> getSearchMovie(String query) async {
    http.Response response;
    var url = Uri.parse(
        '${api.search}${api.key}&${api.language}&query=$query&include_adult=false&region=BR');
    response = await http.get(url);
    return json.decode(response.body);
  }
}
