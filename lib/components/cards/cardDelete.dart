import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class CardDelete extends StatefulWidget {
  const CardDelete({super.key});

  @override
  State<CardDelete> createState() => _CardDeleteState();
}

class _CardDeleteState extends State<CardDelete> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
        title: const Text(
          'Deseja deletar o contato?',
          textAlign: TextAlign.center,
        ),
        actions: [
          TextButton(
            style: TextButton.styleFrom(
              foregroundColor: Colors.green,
            ),
            child: const Text('Delete'),
            onPressed: () async {},
          ),
          TextButton(
            style: TextButton.styleFrom(
              foregroundColor: Colors.red,
            ),
            child: const Text('cancelar'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ]);
    ;
  }
}
