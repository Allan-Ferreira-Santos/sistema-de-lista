import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';

class AnnotationController {
  //Collection FireBase
  var collection = FirebaseFirestore.instance.collection("annotation");

  /*
  * Register notes
  * @author  Allan F Santos
  * @param name - name register
  * @param mail - mail register
  * @param title - title register
  * @param annotation - annotation register
  * @version 1.0 - 20230218 - initial release
  * @return  collection 
  */
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

  /*
  * Update notes
  * @author  Allan F Santos
  * @param id - id update
  * @param name - name update
  * @param mail - mail update
  * @param title - title update
  * @param annotation - annotation update
  * @version 1.0 - 20230218 - initial release
  * @return  collection 
  */
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

  /*
  * Delete notes
  * @author  Allan F Santos
  * @param id - id update
  * @version 1.0 - 20230218 - initial release
  * @return  collection 
  */
  deleteNotes(String id) async {
    log("ID do delete " + id);
    return await collection
        .doc(id)
        .delete()
        .then((value) => true)
        .catchError((value) => false);
  }
}
