import 'package:flutter/material.dart';
import 'package:onde_assistir/models/arguments.dart';
import 'package:onde_assistir/models/results.dart';

class ResultsTable extends StatelessWidget {
  const ResultsTable({Key? key, required this.results}) : super(key: key);

  final List<Results> results;
  final String img = 'https://image.tmdb.org/t/p/w500';

  @override
  Widget build(BuildContext context) {
    return SizedBox(height: 220,
      child: GridView.builder(shrinkWrap: true,
          physics: const BouncingScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 1,
            crossAxisSpacing: 0,
            mainAxisSpacing: 5,
          ),
          scrollDirection: Axis.horizontal,
          itemCount: results.length,
          padding: const EdgeInsets.all(4),
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {
                Navigator.pushNamed(context, '/details',
                    arguments: Arguments(results: results[index]));
              },
              child: Column(
                children: [
                  Expanded(
                    child: Card(
                      child: Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(2),
                            image: DecorationImage(
                                image: (results[index].posterPath != null)
                                    ? NetworkImage(
                                        '$img${results[index].posterPath}',
                                      )
                                    : const NetworkImage(
                                        'https://www2.camara.leg.br/atividade-'
                                            'legislativa/comissoes/comissoes-'
                                            'permanentes/cindra/imagens/'
                                            'sem.jpg.gif'),
                                fit: BoxFit.fill),
                          ),
                          width: 150,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  // Text(textAlign: TextAlign.center,
                  //   overflow: TextOverflow.ellipsis,
                  //   maxLines: 2,
                  //   movies[index].title,
                  //   style: const TextStyle(
                  //     fontSize: 15,
                  //     color: Colors.white,
                  //   ),
                  // ),
                ],
              ),
            );
          }),
    );
  }
}
