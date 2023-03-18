import 'package:flutter/material.dart';
import 'package:onde_assistir/api/moviesdb.dart';
import 'package:onde_assistir/models/provider/provider_table.dart';
import 'package:onde_assistir/models/provider/provider.dart';

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
              final providerA = <ProviderA>[];
              final providerB = <ProviderB>[];
              final providerC = <ProviderC>[];
              var jProvider = snapshot.data;
              if (jProvider!['results']['BR'] != null) {
                if (jProvider['results']['BR']['flatrate'] != null) {
                  List listReponseA = jProvider['results']['BR']['flatrate'];
                  for (Map<String, dynamic> map in listReponseA) {
                    ProviderA p = ProviderA.fromJson(map);
                    providerA.add(p);
                  }
                  if (jProvider['results']['BR']['buy'] != null) {
                    List listReponseB = jProvider['results']['BR']['buy'];
                    for (Map<String, dynamic> map in listReponseB) {
                      ProviderB p = ProviderB.fromJson(map);
                      providerB.add(p);
                    }
                  }
                  if (jProvider['results']['BR']['rent'] != null) {
                    List listReponseC = jProvider['results']['BR']['rent'];
                    for (Map<String, dynamic> map in listReponseC) {
                      ProviderC p = ProviderC.fromJson(map);
                      providerC.add(p);
                    }
                  }
                }
                return ProviderTable(
                  providerA: providerA,
                  providerB: providerB,
                  providerC: providerC,
                );
              } else {
                return const SizedBox(
                  height: 60,
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
