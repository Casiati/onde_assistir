import 'package:flutter/material.dart';
import 'package:onde_assistir/api/moviesdb.dart';
import 'package:onde_assistir/custons/movie_table.dart';
import 'package:onde_assistir/models/movie.dart';

class Popular extends StatelessWidget {
  Popular({Key? key}) : super(key: key);

  final Moviesdb moviesController = Moviesdb();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: moviesController.getMoviesPopular(),
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
              return MovieTable(
                movies: movie,
              );
            }
        }
      },
    );
  }
}
