import 'package:flutter/material.dart';

class CustomAlert extends StatelessWidget {
  const CustomAlert({Key? key, required this.sinopse}) : super(key: key);

  final String sinopse;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.black54,
      title: const Text(
        'Sinopse',
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
      content: Text(sinopse,
        style: const TextStyle(
          color: Colors.white,
        ),),
      actions: [
        TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Voltar'))
      ],
    );
  }
}
