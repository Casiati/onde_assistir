import 'package:flutter/material.dart';
import 'package:onde_assistir/models/movie.dart';

class MovieTable extends StatelessWidget {
  const MovieTable({Key? key, required this.movies}) : super(key: key);

  final List<Movie> movies;
  final String img = 'https://image.tmdb.org/t/p/w500';

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          height: 275,
          child: GridView.builder(physics: const BouncingScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 1,
                crossAxisSpacing: 0,
                mainAxisSpacing: 0,
              ),
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.all(5),
              itemCount: movies.length,
              itemBuilder: (context, index) {
                return InkWell(onTap: () {},
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 220,
                        width: 190,
                        child: Image.network('$img${movies[index].posterPath}',
                            fit: BoxFit.fitWidth,
                            alignment: Alignment.center),
                      ),
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
