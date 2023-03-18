import 'package:flutter/material.dart';

class CustomGrindView extends StatelessWidget {
  const CustomGrindView({Key? key, required this.list,})
      : super(key: key);

  final String logo = 'https://www.themoviedb.org/t/p/original/';
  final List list;


  @override
  Widget build(BuildContext context) {
    return
      SizedBox(
        height: 60,
        child: GridView.builder(
            physics: const BouncingScrollPhysics(),
            gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 1,
              crossAxisSpacing: 5,
              mainAxisSpacing: 5,
            ),
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.all(5),
            itemCount: list.length,
            itemBuilder: (context, index) {
              return Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        image: DecorationImage(
                            image: NetworkImage(
                                '$logo${list[index].logoPath}'))),
                    height: 50,
                    width: 50,
                  ),
                ],
              );
            }),
      );
  }
}
