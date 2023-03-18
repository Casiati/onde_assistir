import 'package:flutter/material.dart';
import 'package:onde_assistir/models/movie/search/search_manager.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {

  String? query;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text('Pesquisar'),
      ),
      body: ListView(shrinkWrap: true,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 8),
            child: TextField(
              decoration: const InputDecoration(
                labelText: 'Procurar',
                labelStyle: TextStyle(
                  color: Colors.white,
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.white,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.white,
                  ),
                ),
              ),
              style: const TextStyle(
                color: Colors.white,
                fontSize: 18,
              ), onSubmitted: (text) {
                setState(() {
                  query = text;
                });
            },
            ),
          ),
          (query != null)
              ? SearchManager(query: query!)
              : Container()
        ],
      ),
    );
  }
}
