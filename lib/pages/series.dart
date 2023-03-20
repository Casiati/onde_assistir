import 'package:flutter/material.dart';
import 'package:onde_assistir/models/series/popular_manager.dart';
import 'package:onde_assistir/models/series/top_rated_manager.dart';

class SeriesPage extends StatelessWidget {
  const SeriesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ListView(
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
          SeriesTopRatedManager(),
          const SizedBox(
            height: 15,
          ),
          const Padding(
            padding: EdgeInsets.only(left: 8),
            child: Text(
              'Mais Assistidos',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 25,
                  fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          SeriesPopularManager(),
        ],
      ),
    );
  }
}
