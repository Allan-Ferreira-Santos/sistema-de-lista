import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:sistema_de_lista/components/bottomNavigation.dart';
import 'package:sistema_de_lista/components/cards/cardDelete.dart';
import 'package:sistema_de_lista/screens/registerAnnotation.dart';
import 'package:sistema_de_lista/screens/viewAnnotation.dart';

import '../components/header.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    String text = '';

    Size size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: Colors.transparent,
        appBar: const PreferredSize(
            preferredSize: Size.fromHeight(100), child: Header()),
        body: Container(
          padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
          child: Column(children: [
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
            SingleChildScrollView(
                child: Container(
              height: size.height * 0.73,
              padding: const EdgeInsets.only(top: 10),
              child: StreamBuilder<QuerySnapshot>(
                stream: (text != '' && text != null)
                    ? FirebaseFirestore.instance
                        .collection('annotation')
                        .where('title', isGreaterThanOrEqualTo: text)
                        .where('title', isLessThan: text + 'z')
                        .snapshots()
                    : FirebaseFirestore.instance
                        .collection('annotation')
                        .snapshots(),
                builder: (context, snapshot) {
                  return (snapshot.connectionState == ConnectionState.waiting)
                      ? const Center(
                          child: CircularProgressIndicator(),
                        )
                      : ListView.builder(
                          itemCount: snapshot.data!.docs.length,
                          itemBuilder: (context, index) {
                            DocumentSnapshot data = snapshot.data!.docs[index];
                            return InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => ViewAnnotation(
                                              annotation: data['annotation'],
                                              dataCreate: data['annotation'],
                                              mail: data['mail'],
                                              name: data['name'],
                                              title: data['title'],
                                            )));
                              },
                              child: Container(
                                margin:
                                    const EdgeInsets.only(top: 15, bottom: 15),
                                padding: const EdgeInsets.all(10),
                                decoration: const BoxDecoration(
                                    color: Colors.white,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(20))),
                                child: Row(
                                  children: [
                                    Expanded(
                                      flex: 3,
                                      child: Container(
                                        padding: const EdgeInsets.fromLTRB(
                                            0, 0, 5, 0),
                                        height:
                                            MediaQuery.of(context).size.height /
                                                13,
                                        child: CircleAvatar(
                                            radius: 20,
                                            backgroundColor:
                                                const Color.fromARGB(
                                                    255, 34, 32, 32),
                                            child: Text(
                                              data['name'][0],
                                            )),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 11,
                                      child: Container(
                                        padding:
                                            const EdgeInsets.only(left: 10),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                              padding: const EdgeInsets.only(
                                                  bottom: 5),
                                              child: Text(data['title']),
                                            ),
                                            SizedBox(
                                              child: Text(
                                                data['mail'],
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                        flex: 2,
                                        child: InkWell(
                                          onTap: () {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        RegisterAnnotation(
                                                          id: snapshot.data!
                                                              .docs[index].id,
                                                          title: data['title'],
                                                          annotation: data[
                                                              'annotation'],
                                                          mail: data['mail'],
                                                          name: data['name'],
                                                        )));
                                          },
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
                                          child: SizedBox(
                                            child: InkWell(
                                              onTap: () {
                                                showDialog(
                                                  context: context,
                                                  barrierDismissible: false,
                                                  builder:
                                                      (BuildContext context) {
                                                    return CardDelete(
                                                      id: snapshot
                                                          .data!.docs[index].id,
                                                    );
                                                  },
                                                );
                                              },
                                              child: const Icon(
                                                Icons.delete_outline,
                                                size: 25,
                                                color: Colors.black,
                                              ),
                                            ),
                                          ),
                                        )),
                                  ],
                                ),
                              ),
                            );
                          },
                        );
                },
              ),
            ))
          ]),
        ),
        floatingActionButton: const BottomNavigation());
  }
}
