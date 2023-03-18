import 'package:flutter/material.dart';
import 'package:onde_assistir/api/moviesdb.dart';
import 'package:onde_assistir/models/movie/movie.dart';
import 'package:onde_assistir/models/movie/search/search_movie_table.dart';

class SearchManager extends StatelessWidget {
  SearchManager({Key? key, required this.query}) : super(key: key);

  final Moviesdb moviesController = Moviesdb();
  final String query;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: moviesController.getSearchMovie(query),
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
              if (snapshot.data != null) {
                List listResponse = snapshot.data!['results'];
                final movie = <Movie>[];
                for (Map<String, dynamic> map in listResponse) {
                  Movie m = Movie.fromJson(map);
                  movie.add(m);
                }
                double height = 65;
                height = height + movie.length * 100;
                return SearchMovieTable(
                  movies: movie,
                  height: height,
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
