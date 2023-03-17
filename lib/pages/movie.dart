import 'package:flutter/material.dart';
import 'package:onde_assistir/models/arguments.dart';
import 'package:onde_assistir/models/providers_manager.dart';

class MoviesPage extends StatelessWidget {
  const MoviesPage(
    this.arguments, {
    Key? key,
  }) : super(key: key);
  final String img = 'https://image.tmdb.org/t/p/w500';

  final Arguments arguments;

  @override
  Widget build(BuildContext context) {
    //final arguments = ModalRoute.of(context)!.settings.arguments as Arguments;

    return Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          title: const Text('Filmes'),
        ),
        body: ListView(
          shrinkWrap: true,
          children: [
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  image: DecorationImage(
                    image: NetworkImage('$img${arguments.movie.backdropPath}'),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        overflow: TextOverflow.ellipsis,
                        arguments.movie.title,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.white,
                          shadows: [
                            Shadow(
                              offset: Offset(1, 1),
                              blurRadius: 8,
                              color: Colors.black,
                            )
                          ],
                        ),
                      ),
                      const SizedBox(height: 10),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              image: DecorationImage(
                                image: NetworkImage(
                                    '$img${arguments.movie.posterPath}'),
                                fit: BoxFit.cover,
                              ),
                            ),
                            width: 130,
                            height: 200,
                          ),
                          const SizedBox(width: 5),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  maxLines: 9,
                                  overflow: TextOverflow.ellipsis,
                                  (arguments.movie.overview != "")
                                      ? arguments.movie.overview
                                      : 'Não temos uma sinopse em Português do '
                                      'Brasil. Você pode ajudar a ampliar o '
                                      'nosso banco de dados adicionando uma.',
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    shadows: [
                                      Shadow(
                                        offset: Offset(1, 1),
                                        blurRadius: 8,
                                        color: Colors.black,
                                      )
                                    ],
                                  ),
                                ),
                                const SizedBox(height: 5),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 10, horizontal: 15),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Container(
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(50),
                                            color: Colors.black45),
                                        height: 50,
                                        width: 50,
                                        child: Center(
                                          child: Text(
                                            '${arguments.movie.voteAverage.toString().replaceAll('.', '')}%',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                              shadows: [
                                                Shadow(
                                                  offset: const Offset(2, 3),
                                                  blurRadius: 15,
                                                  color: (arguments.movie
                                                              .voteAverage >=
                                                          5)
                                                      ? Colors.green
                                                      : Colors.red,
                                                ),
                                                Shadow(
                                                  offset: const Offset(1, 1),
                                                  blurRadius: 15,
                                                  color: (arguments.movie
                                                              .voteAverage >=
                                                          5)
                                                      ? Colors.green
                                                      : Colors.red,
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                      const SizedBox(width: 10),
                                      const SizedBox(
                                        width: 80,
                                        child: Text(
                                          maxLines: 3,
                                          'Avaliação dos usuários',
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 14,
                                            color: Colors.white,
                                            shadows: [
                                              Shadow(
                                                offset: Offset(1, 1),
                                                blurRadius: 8,
                                                color: Colors.black,
                                              )
                                            ],
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                const Text(
                                  'Assita Agora:',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                    color: Colors.white,
                                    shadows: [
                                      Shadow(
                                        offset: Offset(1, 1),
                                        blurRadius: 8,
                                        color: Colors.black,
                                      )
                                    ],
                                  ),
                                ),
                                ProvidersManager(arguments.movie.id),
                              ],
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ));
  }
}
