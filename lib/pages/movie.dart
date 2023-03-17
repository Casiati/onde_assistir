import 'package:flutter/material.dart';
import 'package:onde_assistir/models/movie.dart';

class MoviesPage extends StatelessWidget {
  const MoviesPage({Key? key, required this.movie}) : super(key: key);

  final Movie movie;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(movie.title),
      ),
      body: ,
    );
  }
}
