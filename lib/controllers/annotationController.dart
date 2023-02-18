import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';

class AnnotationController {
  var collection = FirebaseFirestore.instance.collection("annotation");
  storeAnnotation(name, mail, title, annotation) {
    return collection
        .add({
          'name': name,
          'mail': mail,
          'title': title,
          'annotation': annotation,
          'dataCreate': DateTime.now(),
          'dataUpdate': DateTime.now(),
        })
        .then((value) => true)
        .catchError((value) => false);
  }

  listNotes() async {
    var result = await collection.get();
    var data;

    collection.snapshots().listen((event) {
      result = event;
    });

    for (var notes in result.docs) {
      data = notes;
    }

    print(data.toString());

    return data;
  }
}
