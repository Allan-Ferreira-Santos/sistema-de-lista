import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:sistema_de_lista/controllers/annotationController.dart';
import '../components/inputs/Input.dart';
import '../helpers/Validator.dart';

class RegisterAnnotation extends StatefulWidget {
  final String? id;
  final String? name;
  final String? mail;
  final String? title;
  final String? annotation;

  const RegisterAnnotation(
      {this.id, this.title, this.annotation, this.mail, this.name, super.key});

  @override
  State<RegisterAnnotation> createState() => _RegisterAnnotation();
}

class _RegisterAnnotation extends State<RegisterAnnotation> {
  final _formKey = GlobalKey<FormState>();
  bool loading = false;

  final name = TextEditingController();
  final mail = TextEditingController();
  final title = TextEditingController();
  final annotation = TextEditingController();

  @override
  void initState() {
    if (widget.id != null && widget.id != '') {
      name.text = widget.name!;
      mail.text = widget.mail!;
      title.text = widget.title!;
      annotation.text = widget.annotation!;
    }
    super.initState();
  }

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
              'Cadastre uma nova anotação',
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.w700),
            ),
          )),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: Form(
            key: _formKey,
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Container(
                padding: const EdgeInsets.only(bottom: 10, top: 10),
                child: const Text(
                  'Nome',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              SizedBox(
                child: Input(
                  textStyle: const TextStyle(color: Colors.black),
                  keyboardType: TextInputType.text,
                  validator: (value) {
                    if (Validator().nomeValidator(value) != null) {
                      String response = Validator().nomeValidator(value);

                      return response;
                    }
                    return null;
                  },
                  onChanged: (value) {
                    setState(() {
                      name.text = value;
                    });
                  },
                  fillColor: Colors.white,
                  initialValue: widget.name,
                  filled: true,
                  obscureText: false,
                  placeholder: "Digite seu Nome",
                  hintStyle: const TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.w400),
                  contentPadding: const EdgeInsets.fromLTRB(15, 0, 0, 0),
                ),
              ),
              Container(
                padding: const EdgeInsets.only(bottom: 10, top: 10),
                child: const Text(
                  'Email',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              SizedBox(
                child: Input(
                  textStyle: const TextStyle(color: Colors.black),
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) {
                    if (Validator().emailValidator(value) != null) {
                      String response = Validator().emailValidator(value);

                      return response;
                    }
                    return null;
                  },
                  onChanged: (value) {
                    setState(() {
                      mail.text = value;
                    });
                  },
                  fillColor: Colors.white,
                  initialValue: widget.mail,
                  filled: true,
                  obscureText: false,
                  placeholder: "Digite o Email",
                  hintStyle: const TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.w400),
                  contentPadding: const EdgeInsets.fromLTRB(15, 0, 0, 0),
                ),
              ),
              Container(
                padding: const EdgeInsets.only(bottom: 10, top: 10),
                child: const Text(
                  'Titulo',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              SizedBox(
                child: Input(
                  textStyle: const TextStyle(color: Colors.black),
                  keyboardType: TextInputType.text,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'preencha corretamente o campo';
                    }
                    return null;
                  },
                  onChanged: (value) {
                    setState(() {
                      title.text = value;
                    });
                  },
                  fillColor: Colors.white,
                  filled: true,
                  obscureText: false,
                  initialValue: widget.title,
                  placeholder: "Digite o titulo",
                  hintStyle: const TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.w400),
                  contentPadding: const EdgeInsets.fromLTRB(15, 0, 0, 0),
                ),
              ),
              Container(
                padding: const EdgeInsets.only(bottom: 10, top: 10),
                child: const Text(
                  'Anotação',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              SizedBox(
                child: Input(
                  textStyle: const TextStyle(color: Colors.black),
                  keyboardType: TextInputType.text,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'preencha corretamente o campo';
                    }
                    return null;
                  },
                  onChanged: (value) {
                    setState(() {
                      annotation.text = value;
                    });
                  },
                  fillColor: Colors.white,
                  initialValue: widget.annotation,
                  filled: true,
                  obscureText: false,
                  placeholder: "Digite sua anotação",
                  hintStyle: const TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.w400),
                  contentPadding: const EdgeInsets.fromLTRB(15, 0, 0, 0),
                ),
              ),
            ]),
          ),
        ),
      ),
      bottomNavigationBar: InkWell(
        onTap: () async {
          if (_formKey.currentState!.validate()) {
            setState(() {
              loading = !loading;
            });

            if (widget.id != null && widget.id != '') {
              log("passo para Update");
              var update = AnnotationController().updateNotes(widget.id!,
                  name.text, mail.text, title.text, annotation.text);

              log("reponse update" + update.toString());

              if (update == true) {
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
            } else {
              var response = AnnotationController().storeAnnotation(
                  name.text, mail.text, title.text, annotation.text);

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
            }
          }
        },
        child: Container(
            margin: const EdgeInsets.all(20),
            padding: const EdgeInsets.all(10),
            width: size.width,
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(20)),
            child: loading
                ? Container(
                    height: 30,
                    padding: const EdgeInsets.symmetric(horizontal: 160),
                    child: const CircularProgressIndicator(
                      color: Colors.black,
                    ),
                  )
                : const Text(
                    'Cadastrar',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 15,
                    ),
                  )),
      ),
    );
  }
}
