import 'package:flutter/material.dart';
import 'package:onde_assistir/custons/custom_gridview.dart';
import 'package:onde_assistir/models/provider/provider.dart';

class ProviderTable extends StatelessWidget {
  const ProviderTable(
      {Key? key,
      required this.providerA,
      required this.providerB,
      required this.providerC})
      : super(key: key);

  final List<ProviderA> providerA;
  final List<ProviderB> providerB;
  final List<ProviderC> providerC;
  final String logo = 'https://www.themoviedb.org/t/p/original/';

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        (providerA.isNotEmpty)
            ? Padding(
                padding: const EdgeInsets.fromLTRB(10, 5, 0, 0),
                child: Column(
                  children: [
                    const Align(
                      alignment: AlignmentDirectional.centerStart,
                      child: Text(
                        'Assinatura:',
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
                    SizedBox(
                      height: 60,
                      child: CustomGrindView(
                        list: providerA,
                      ),
                    ),
                  ],
                ),
              )
            : Container(),
        (providerB.isNotEmpty)
            ? Padding(
                padding: const EdgeInsets.fromLTRB(10, 5, 0, 0),
                child: Column(
                  children: [
                    const Align(
                      alignment: AlignmentDirectional.centerStart,
                      child: Text(
                        'Comprar:',
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
                    SizedBox(
                      height: 60,
                      child: CustomGrindView(list: providerB),
                    ),
                  ],
                ),
              )
            : Container(),
        (providerC.isNotEmpty)
            ? Padding(
                padding: const EdgeInsets.fromLTRB(10, 5, 0, 0),
                child: Column(
                  children: [
                    const Align(
                      alignment: AlignmentDirectional.centerStart,
                      child: Text(
                        'Alugar:',
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
                    SizedBox(
                      height: 60,
                      child: CustomGrindView(
                        list: providerC,
                      ),
                    ),
                  ],
                ),
              )
            : Container(),
      ],
    );
  }
}
