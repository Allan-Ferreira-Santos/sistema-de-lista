import 'package:flutter/material.dart';
import '../components/inputs/Input.dart';
import '../components/inputs/InputCpf.dart';
import '../helpers/Validator.dart';

class RegisterContacts extends StatefulWidget {
  const RegisterContacts({super.key});

  @override
  State<RegisterContacts> createState() => _RegisterContactsState();
}

class _RegisterContactsState extends State<RegisterContacts> {
  final _formKey = GlobalKey<FormState>();
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
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
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
                        onChanged: (value) {},
                        fillColor: Colors.white,
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
                        keyboardType: TextInputType.text,
                        validator: (value) {
                          if (Validator().emailValidator(value) != null) {
                            String response = Validator().emailValidator(value);

                            return response;
                          }
                          return null;
                        },
                        onChanged: (value) {},
                        fillColor: Colors.white,
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
                        onChanged: (value) {},
                        fillColor: Colors.white,
                        filled: true,
                        obscureText: false,
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
                        onChanged: (value) {},
                        fillColor: Colors.white,
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
                  ])),
        ),
      ),
      bottomNavigationBar: InkWell(
        onTap: () async {},
        child: Container(
          margin: const EdgeInsets.all(20),
          padding: const EdgeInsets.all(10),
          width: size.width,
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(20)),
          child: const Text(
            'Cadastrar',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 15,
            ),
          ),
        ),
      ),
    );
  }
}
