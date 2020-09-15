import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

class CrudMethods {
  Future<void> Upload(problemDetails) async {
    Firestore.instance
        .collection("Problems")
        
        .add(problemDetails)
        .catchError((e) {
      print(e.toString());
    });
  }

getData() async {
    return  Firestore.instance.collection('Problems').document('email').snapshots();
  }
}
