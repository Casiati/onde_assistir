import 'package:flutter/material.dart';
import 'package:onde_assistir/api/seriesdb.dart';
import 'package:onde_assistir/models/results.dart';
import 'package:onde_assistir/models/results_table.dart';

class SeriesTopRatedManager extends StatelessWidget {
  SeriesTopRatedManager({Key? key}) : super(key: key);

  final Seriesdb seriesdbController = Seriesdb();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: seriesdbController.getSeriesTopRated(),
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
              final results = <Results>[];
              for (Map<String, dynamic> map in listResponse) {
                Results m = Results.fromJson(map);
                results.add(m);
              }
              return ResultsTable(
                results: results,
              );
            }
        }
      },
    );
  }
}
