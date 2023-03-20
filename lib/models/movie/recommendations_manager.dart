import 'package:flutter/material.dart';
import 'package:onde_assistir/api/moviesdb.dart';
import 'package:onde_assistir/api/seriesdb.dart';
import 'package:onde_assistir/models/arguments.dart';
import 'package:onde_assistir/models/results.dart';
import 'package:onde_assistir/models/search/search_table.dart';

class RecommendationsManager extends StatelessWidget {
  RecommendationsManager(this.arguments, {Key? key}) : super(key: key);

  final Moviesdb moviesController = Moviesdb();
  final Seriesdb seriesController = Seriesdb();
  final Arguments arguments;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: (arguments.results.video == null)
          ? seriesController.getRecommendations(arguments.results.id)
          : moviesController.getRecommendations(arguments.results.id),
      builder: (context, snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.waiting:
          case ConnectionState.none:
            return Container(
              width: 200,
              height: 200,
              alignment: Alignment.center,
              child: const CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                strokeWidth: 5,
              ),
            );
          default:
            if (snapshot.hasError) {
              return Container();
            } else {
              final movie = <Results>[];
              var jResults = snapshot.data!['results'];

              if (jResults != null) {
                List listResponse = List.from(jResults);
                for (Map<String, dynamic> map in listResponse) {
                  Results m = Results.fromJson(map);
                  movie.add(m);
                }
                return SearchTable(
                  results: movie,
                );
              } else {
                return Container();
              }
            }
        }
      },
    );
  }
}
