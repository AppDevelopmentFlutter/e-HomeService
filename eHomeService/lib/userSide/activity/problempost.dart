import 'package:eHomeService/chat/services/crud.dart';
import 'package:eHomeService/chat/views/chat.dart';
import 'package:eHomeService/chat/views/OwnerChatRoom.dart';
import 'package:eHomeService/userSide/usersTile.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eHomeService/chat/views/chat.dart';
import 'package:eHomeService/chat/views/chatrooms.dart';
import 'package:eHomeService/chat/widget/widget.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

class ProblemPost extends StatefulWidget {
  final String emailId;

  const ProblemPost({
    Key key,
    this.emailId,
  }) : super(key: key);

  @override
  _ProblemPostState createState() => _ProblemPostState();
}

class _ProblemPostState extends State<ProblemPost> {
  final firebaseInstance = Firestore.instance;
 
  CrudMethods crudMethods = new CrudMethods();
  Stream usersStream;

  Widget UsersList() {
    print("Hello this is my email: " + widget.emailId);
    return SingleChildScrollView(
      physics: ClampingScrollPhysics(),
      child: Container(
          child: Column(children: <Widget>[
        StreamBuilder<QuerySnapshot>(
            stream: Firestore.instance
        .collection("Problems")
        .where("Email", isEqualTo: widget.emailId)
        .snapshots(),
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                print("Hello email: " + widget.emailId);
                return CircularProgressIndicator();
              } else {
                return ListView.builder(
                    physics: ClampingScrollPhysics(),
                    shrinkWrap: true,
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    itemCount: snapshot.data.documents.length,
                    itemBuilder: (context, index) {
                      DocumentSnapshot documentSnapshot =
                          snapshot.data.documents[index];
                      return UsersTile(
                        imgUrl: documentSnapshot['ImageUrl'],
                        problem: documentSnapshot['Problem'],
                        time: documentSnapshot['Time'],
                        documentSnapshot:  documentSnapshot,
                        status:documentSnapshot['Status'], 
                        // description: documentSnapshot['Description'],
                         mobileno: documentSnapshot['Phone Number'],
                      );
                    });
              }
            })
      ])),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: new FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => ChatRoom()));
        },
        backgroundColor: Colors.deepPurpleAccent[200],
        child: Icon(
          Icons.message,
          color: Colors.white,
        ),
      ),
      body: ListView(
        shrinkWrap: true,
        children: <Widget>[
          Column(
            children: <Widget>[
              Padding(padding: EdgeInsets.symmetric(vertical: 15)),
              UsersList(),
            ],
          ),
        ],
      ),
    );
  }
}
