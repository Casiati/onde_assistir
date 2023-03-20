import 'package:flutter/material.dart';
import 'package:onde_assistir/api/moviesdb.dart';
import 'package:onde_assistir/pages/movies.dart';
import 'package:onde_assistir/pages/series.dart';

class HomePage extends StatelessWidget {
  HomePage({
    super.key,
  });

  final Moviesdb moviesController = Moviesdb();

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          title: const Text('Onde Assistir'),
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/search');
                },
                icon: const Icon(Icons.search))
          ],
          bottom: const TabBar(
            physics: BouncingScrollPhysics(),
            isScrollable: true,
            labelStyle: TextStyle(fontSize: 18),
            indicatorSize: TabBarIndicatorSize.label,
            tabs: [
              Tab(
                text: 'Filmes',
              ),
              Tab(
                text: 'Series',
              ),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            MoviesPage(),
            SeriesPage(),
          ],
        ),
      ),
    );
  }
}
