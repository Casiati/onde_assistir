import 'package:flutter/material.dart';
import 'package:onde_assistir/models/arguments.dart';
import 'package:onde_assistir/models/results.dart';

class SearchTable extends StatelessWidget {
  const SearchTable({Key? key, required this.results}) : super(key: key);

  final List<Results> results;
  final String img = 'https://image.tmdb.org/t/p/w500';

  @override
  Widget build(BuildContext context) {
    return GridView.builder(shrinkWrap: true,
        physics: const ClampingScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 25,
        ),
        scrollDirection: Axis.vertical,
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
                      padding: const EdgeInsets.all(2.0),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(1),
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
                        height: 200,
                        width: 110,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Text(textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                  results[index].title,
                  style: const TextStyle(
                    fontSize: 15,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          );
        });
  }
}
