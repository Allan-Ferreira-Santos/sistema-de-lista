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

  updateNotes(String id, name, mail, title, annotation) async {
    log("ID do update " + id);

    return await collection
        .doc(id)
        .update({
          'name': name,
          'mail': mail,
          'title': title,
          'annotation': annotation,
          'dataUpdate': DateTime.now(),
        })
        .then((value) => true)
        .catchError((value) => false);
  }

  deleteNotes(String id) async {
    log("ID do delete " + id);
    return await collection
        .doc(id)
        .delete()
        .then((value) => true)
        .catchError((value) => false);
  }
}
