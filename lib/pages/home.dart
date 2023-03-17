import 'package:flutter/material.dart';
import 'package:onde_assistir/api/moviesdb.dart';
import 'package:onde_assistir/models/popular/popular.dart';
import 'package:onde_assistir/models/top_rated/top_rated.dart';

class HomePage extends StatelessWidget {
  HomePage({
    super.key,
  });

  final Moviesdb moviesController = Moviesdb();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text('Filmes'),
      ),
      body: Center(
        child: ListView(
          shrinkWrap: true,
          physics: const BouncingScrollPhysics(),
          children: <Widget>[
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'Melhores Avaliados',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                    fontWeight: FontWeight.bold),
              ),
            ),
            TopRated(),
            const SizedBox(
              height: 15,
            ),
            const Text(
              'Mais Assistidos',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 25,
                  fontWeight: FontWeight.bold),
            ),
            Popular(),
          ],
        ),
      ),
    );
  }
}
