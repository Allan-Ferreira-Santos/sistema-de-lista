import 'package:flutter/material.dart';
import 'package:sistema_de_lista/controllers/annotationController.dart';

class CardDelete extends StatefulWidget {
  final String id;

  const CardDelete({required this.id, super.key});

  @override
  State<CardDelete> createState() => _CardDeleteState();
}

class _CardDeleteState extends State<CardDelete> {
  bool loading = false;
  @override
  Widget build(BuildContext context) {
    return loading
        ? const Center(
            child: CircularProgressIndicator(),
          )
        : AlertDialog(
            title: const Text(
              'Deseja deletar sua Anotação?',
              textAlign: TextAlign.center,
            ),
            actions: [
                TextButton(
                  style: TextButton.styleFrom(
                    foregroundColor: Colors.green,
                  ),
                  child: const Text('Delete'),
                  onPressed: () async {
                    setState(() {
                      loading = !loading;
                    });

                    // controller delete passing id
                    var response =
                        await AnnotationController().deleteNotes(widget.id);

                    if (response == true) {
                      setState(() {
                        loading = !loading;
                      });
                      Navigator.of(context).pushNamedAndRemoveUntil(
                        '/HomeScreen',
                        (route) => false,
                      );
                    } else {
                      setState(() {
                        loading = !loading;
                      });
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          content: SizedBox(
                        height: 30,
                        child: Text(
                            "Infelizmente ocorreu algum erro por favor tente novamente"),
                      )));
                    }
                  },
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
  }
}
