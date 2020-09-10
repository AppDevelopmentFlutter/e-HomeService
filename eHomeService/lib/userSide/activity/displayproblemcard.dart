import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class DisplayProblemCard extends StatelessWidget {
  final DocumentSnapshot documentSnapshot;

  const DisplayProblemCard({Key key, this.documentSnapshot}) : super(key: key);
  @override
  Widget build(BuildContext context) {

    return Container(
      child : Text(documentSnapshot["Problem"])
    );
  }
}