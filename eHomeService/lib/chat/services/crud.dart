import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

class CrudMethods {
  Future<void> Upload(problemDetails, emailValue, timeValue) async {
    Firestore.instance
        .collection("Problems")
        .document(emailValue)
        .collection('timeValue')
        .document(timeValue)
        .setData(problemDetails)
        .catchError((e) {
      print(e.toString());
    });
  }

  getData() async {
    return await Firestore.instance.collection("Problem").snapshots();
  }
}
