import 'package:flutter/material.dart';
import 'package:onde_assistir/api/moviesdb.dart';
import 'package:onde_assistir/models/arguments.dart';
import 'package:onde_assistir/models/movie/movie.dart';

class SearchMovieTable extends StatelessWidget {
  SearchMovieTable({Key? key, required this.movies}) : super(key: key);

  final List<Movie> movies;
  final String img = 'https://image.tmdb.org/t/p/w500';
  final Moviesdb moviesController = Moviesdb();

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
        itemCount: movies.length,
        padding: const EdgeInsets.all(4),
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              Navigator.pushNamed(context, '/movie',
                  arguments: Arguments(movie: movies[index]));
            },
            child: Column(
              children: [
                Expanded(
                  child: Card(
                    child: Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          image: DecorationImage(
                              image: (movies[index].posterPath != null)
                                  ? NetworkImage(
                                      '$img${movies[index].posterPath}',
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
                  movies[index].title,
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
