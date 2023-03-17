
import 'package:flutter/material.dart';
import 'package:onde_assistir/models/provider.dart';

class ProviderTable extends StatelessWidget {
  const ProviderTable({Key? key, required this.provider}) : super(key: key);

  final List<Provider> provider;
  final String logo = 'https://www.themoviedb.org/t/p/original/';

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          height: 60,
          child: GridView.builder(
              physics: const BouncingScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 1,
                crossAxisSpacing: 2,
                mainAxisSpacing: 2,
              ),
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.all(5),
              itemCount: provider.length,
              itemBuilder: (context, index) {
                return Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 50 ,
                      width: 50,
                      child: Image.network('$logo${provider[index].logoPath}',
                          fit: BoxFit.fitWidth, alignment: Alignment.center),
                    ),
                  ],
                );
              }),
        ),
      ],
    );
  }
}
