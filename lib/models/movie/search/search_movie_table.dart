import 'package:flutter/material.dart';
import 'package:onde_assistir/api/moviesdb.dart';
import 'package:onde_assistir/models/arguments.dart';
import 'package:onde_assistir/models/movie/movie.dart';

class SearchMovieTable extends StatelessWidget {
  SearchMovieTable({Key? key, required this.movies, required this.height})
      : super(key: key);

  final List<Movie> movies;
  final String img = 'https://image.tmdb.org/t/p/w500';
  final Moviesdb moviesController = Moviesdb();
  final double height;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: GridView.builder(
          physics: const BouncingScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 4,
            mainAxisSpacing: 4,
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
                    height: 160,
                    width: 100,
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
    );
  }
}
