import 'package:flutter/material.dart';
import 'package:onde_assistir/api/moviesdb.dart';
import 'package:onde_assistir/custons/provider_table.dart';
import 'package:onde_assistir/models/provider.dart';

class ProvidersManager extends StatelessWidget {
  ProvidersManager(this.movieId, {Key? key}) : super(key: key);

  final int movieId;
  final Moviesdb moviesController = Moviesdb();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: moviesController.getProvider(movieId),
      builder: (context, snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.waiting:
          case ConnectionState.none:
            return Center(
              child: Container(
                width: 60,
                height: 60,
                alignment: Alignment.center,
                child: const CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                  strokeWidth: 5,
                ),
              ),
            );
          default:
            if (snapshot.hasError) {
              return Container();
            } else {
              var jProvider = snapshot.data;
              if (jProvider!['results']['BR'] != null) {
                List listReponse = jProvider['results']['BR']['flatrate'];
                final provider = <Provider>[];
                for (Map<String, dynamic> map in listReponse) {
                  Provider p = Provider.fromJson(map);
                  provider.add(p);
                }
                return ProviderTable(provider: provider);
              } else {
                return const SizedBox(height: 60,
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      'Indisponivel',
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
                  ),
                );
              }
            }
        }
      },
    );
  }
}
