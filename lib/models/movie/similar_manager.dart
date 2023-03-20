import 'package:flutter/material.dart';
import 'package:onde_assistir/api/moviesdb.dart';
import 'package:onde_assistir/models/movie/movie.dart';

import 'search/search_movie_table.dart';

class SimilarManager extends StatelessWidget {
  SimilarManager(this.movieId, {Key? key}) : super(key: key);

  final Moviesdb moviesController = Moviesdb();
  final int movieId;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: moviesController.getSimilar(movieId),
      builder: (context, snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.waiting:
          case ConnectionState.none:
            return Container(
              width: 200,
              height: 200,
              alignment: Alignment.center,
              child: const CircularProgressIndicator(
                valueColor:
                AlwaysStoppedAnimation<Color>(Colors.white),
                strokeWidth: 5,
              ),
            );
          default:
            if (snapshot.hasError) {
              return Container();
            } else {
              List listResponse = snapshot.data!['results'];
              final movie = <Movie>[];
              for (Map<String, dynamic> map in listResponse) {
                Movie m = Movie.fromJson(map);
                movie.add(m);
              }
              return SearchMovieTable(
                movies: movie,
              );
            }
        }
      },
    );
  }
}
