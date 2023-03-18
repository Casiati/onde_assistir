import 'package:flutter/material.dart';
import 'package:onde_assistir/models/arguments.dart';
import 'package:onde_assistir/pages/movie.dart';
import 'package:onde_assistir/pages/search.dart';

import 'pages/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case '/home':
            return MaterialPageRoute(
              builder: (_) => HomePage(),
            );
          case '/movie':
            return MaterialPageRoute(
              builder: (_) => MoviesPage(
                settings.arguments as Arguments
              ),
            );
          case '/search':
            return MaterialPageRoute(
              builder: (_) => const SearchPage(),
            );
        }
        return null;
      },
      home: HomePage(),
    );
  }
}
