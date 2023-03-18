import 'package:flutter/material.dart';
import 'package:onde_assistir/api/moviesdb.dart';
import 'package:onde_assistir/models/arguments.dart';
import 'package:onde_assistir/models/movie/movie.dart';

class MovieTable extends StatelessWidget {
  MovieTable({Key? key, required this.movies}) : super(key: key);

  final List<Movie> movies;
  final String img = 'https://image.tmdb.org/t/p/w500';
  final Moviesdb moviesController = Moviesdb();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          height: 275,
          child: GridView.builder(
              physics: const BouncingScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 1,
                crossAxisSpacing: 0,
                mainAxisSpacing: 0,
              ),
              scrollDirection: Axis.horizontal,
              itemCount: movies.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, '/movie',
                        arguments: Arguments(movie: movies[index]));
                  },
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
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
                        height: 220,
                        width: 190,
                      ),
                      const SizedBox(height: 5),
                      SizedBox(
                          height: 25,
                          child: Text(
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                            movies[index].title,
                            style: const TextStyle(
                              fontSize: 15,
                              color: Colors.white,
                            ),
                          )),
                    ],
                  ),
                );
              }),
        ),
      ],
    );
  }
}
