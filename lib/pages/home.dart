import 'package:flutter/material.dart';
import 'package:onde_assistir/api/moviesdb.dart';
import '../models/movie/popular_manager.dart';
import '../models/movie/top_rated_manager.dart';

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
        actions: [
          IconButton(
              onPressed: () {
                Navigator.pushNamed(context, '/search');
              },
              icon: const Icon(Icons.search))
        ],
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
            TopRatedManager(),
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
            const SizedBox(
              height: 15,
            ),
            PopularManager(),
          ],
        ),
      ),
    );
  }
}
