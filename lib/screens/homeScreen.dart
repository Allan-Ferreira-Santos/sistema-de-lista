import 'package:flutter/material.dart';
import 'package:sistema_de_lista/components/bottomNavigation.dart';

import '../components/header.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: Colors.transparent,
        appBar: const PreferredSize(
            preferredSize: Size.fromHeight(100), child: Header()),
        body: Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              SizedBox(
                child: TextFormField(
                  style: const TextStyle(color: Colors.white),
                  decoration: const InputDecoration(
                    contentPadding:
                        EdgeInsets.only(top: 20), // add padding to adjust text
                    isDense: true,
                    enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                      color: Colors.white,
                      width: 2,
                    )),
                    focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                      color: Colors.white,
                      width: 2,
                    )),
                    hintText: ("search"),
                    hintStyle: TextStyle(color: Colors.white),
                    prefixIcon: Padding(
                      padding: EdgeInsets.only(
                          top: 15, bottom: 10), // add padding to adjust icon
                      child: Icon(
                        Icons.search,
                        size: 28,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  keyboardType: TextInputType.name,
                  initialValue: null,
                  onChanged: (value) {},
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 20, bottom: 20),
                padding: const EdgeInsets.all(10),
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(20))),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      flex: 3,
                      child: Container(
                        padding: const EdgeInsets.fromLTRB(0, 0, 5, 0),
                        height: MediaQuery.of(context).size.height / 13,
                        child: const CircleAvatar(
                          radius: 20,
                          backgroundColor: Color.fromARGB(255, 34, 32, 32),
                          child: Text('teste'),
                        ),
                      ),
                    ),
                    Expanded(
                        flex: 9,
                        child: InkWell(
                          onTap: () {
                            Navigator.of(context).pushNamed('/ViewAnnotation');
                          },
                          child: Container(
                            padding: const EdgeInsets.only(left: 15),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  padding: const EdgeInsets.only(bottom: 5),
                                  child: const Text('Titulo'),
                                ),
                                const SizedBox(
                                  child: Text('Descrição'),
                                )
                              ],
                            ),
                          ),
                        )),
                    Expanded(
                        flex: 2,
                        child: InkWell(
                          onTap: () {},
                          child: const SizedBox(
                            child: Icon(
                              Icons.edit,
                              color: Colors.black,
                              size: 25,
                            ),
                          ),
                        )),
                    Expanded(
                        flex: 2,
                        child: InkWell(
                          onTap: () async {},
                          child: const SizedBox(
                            child: Icon(
                              Icons.delete_outline,
                              size: 25,
                              color: Colors.black,
                            ),
                          ),
                        )),
                  ],
                ),
              )
            ],
          ),
        ),
        floatingActionButton: const BottomNavigation());
  }
}
