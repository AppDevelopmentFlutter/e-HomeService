import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

class CrudMethods {
  Future<void> addData(problemDetails) async {
    Firestore.instance.collection("ProblemPost").add(problemDetails).catchError((e) {
      print(e.toString());
    });
  }

  // getData() async {
  //   return await Firestore.instance.collection("users").snapshots();
  // }
}
