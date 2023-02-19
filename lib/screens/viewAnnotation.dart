import 'package:flutter/material.dart';

class ViewAnnotation extends StatefulWidget {
  final String? dataCreate;
  final String? name;
  final String? mail;
  final String? title;
  final String? annotation;

  const ViewAnnotation(
      {this.dataCreate,
      this.name,
      this.annotation,
      this.mail,
      this.title,
      super.key});

  @override
  State<ViewAnnotation> createState() => _ViewAnnotationState();
}

class _ViewAnnotationState extends State<ViewAnnotation> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
          toolbarHeight: 99,
          backgroundColor: Colors.transparent,
          title: Container(
            padding: const EdgeInsets.only(right: 25),
            width: size.width,
            child: const Text(
              'Anotações',
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.w700),
            ),
          )),
      body: Container(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
                padding: const EdgeInsets.fromLTRB(0, 15, 0, 15),
                child: Row(
                  children: [
                    const Text(
                      'Data:',
                      style: TextStyle(color: Colors.white),
                    ),
                    Container(
                      padding: const EdgeInsets.only(left: 5),
                      child: Text(
                        widget.dataCreate!,
                        style: const TextStyle(color: Colors.white),
                      ),
                    )
                  ],
                )),
            Container(
                padding: const EdgeInsets.fromLTRB(0, 15, 0, 15),
                child: Row(
                  children: [
                    const Text(
                      'Nome:',
                      style: TextStyle(color: Colors.white),
                    ),
                    Container(
                      padding: const EdgeInsets.only(left: 5),
                      child: Text(
                        widget.name!,
                        style: const TextStyle(color: Colors.white),
                      ),
                    )
                  ],
                )),
            Container(
                padding: const EdgeInsets.fromLTRB(0, 15, 0, 15),
                child: Row(
                  children: [
                    const Text(
                      'Email:',
                      style: TextStyle(color: Colors.white),
                    ),
                    Container(
                      padding: const EdgeInsets.only(left: 5),
                      child: Text(
                        widget.mail!,
                        style: const TextStyle(color: Colors.white),
                      ),
                    )
                  ],
                )),
            Container(
                padding: const EdgeInsets.fromLTRB(0, 15, 0, 15),
                child: Row(
                  children: [
                    const Text(
                      'Titulo:',
                      style: TextStyle(color: Colors.white),
                    ),
                    Container(
                      padding: const EdgeInsets.only(left: 5),
                      child: Text(
                        widget.title!,
                        style: const TextStyle(color: Colors.white),
                      ),
                    )
                  ],
                )),
            Container(
                padding: const EdgeInsets.fromLTRB(0, 15, 0, 15),
                child: Row(
                  children: [
                    const Text(
                      'Anotação:',
                      style: TextStyle(color: Colors.white),
                    ),
                    Container(
                      padding: const EdgeInsets.only(left: 5),
                      child: Text(
                        widget.annotation!,
                        style: const TextStyle(color: Colors.white),
                      ),
                    )
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
