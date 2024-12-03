import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_demo/screens/note/model.dart';

class NoteController extends GetxController {
  final _firestore = FirebaseFirestore.instance;
  final TextEditingController textEditingController = TextEditingController();
  bool _isLoading = false;
  bool get isLoading => _isLoading;
  List<NoteModel> notes = [];
  List<String> searchableList = [];

  @override
  void onReady() {
    // TODO: implement onReady
    getDataOnce();
    super.onReady();
  }

  void addDataToCollection() {
    _firestore
        .collection('note')
        .add({
          'body': textEditingController.text,
          'created_at': FieldValue.serverTimestamp(), // Optional: Adds a server timestamp
        })
        .then((DocumentReference docRef) {})
        .catchError((error) {});
    getDataOnce();
    Get.back();
    textEditingController.clear();
  }

  void editDataToCollection(String id) {
    _firestore.collection('note').doc(id).update({
      'body': textEditingController.text,
      'created_at': FieldValue.serverTimestamp(), // Optional: Adds a server timestamp
    });
 getDataOnce();
    Get.back();
    textEditingController.clear();
  }

  void getDataOnce() async {
    notes = [];
    searchableList = [];
    _isLoading = true;
    update();
    try {
      final querySnapshot = await _firestore.collection('note').get();
      for (var i = 0; i < querySnapshot.docs.length; i++) {
        notes.add(NoteModel.fromMap((querySnapshot.docs[i].data())));
        notes[i].id = querySnapshot.docs[i].id;
        searchableList.add(title(notes[i].body??""));
      }
    } catch (e) {}
    _isLoading = false;
    update();
  }

  String title(String note) {
    String header = "";
    List<String> split = note.split(" ");
    List<String> splitted = [];
    if (split.length > 0) splitted.add(split[0]);
    if (split.length > 1) splitted.add(split[1]);
    for (var i = 0; i < splitted.length; i++) {
      header = "$header${splitted[i]} ";
    }
    return header;
  }

    List<String> search(String value) {
    List<String> searchList = [];
    for (int i = 0; i < searchableList.length; i++) {
      String name = searchableList[i];
      if (name.toLowerCase().contains(value.toLowerCase())) {
        searchList.add(name);
      }
    }
    return searchList;
  }
}
