import 'package:eHomeService/chat/services/crud.dart';
import 'package:eHomeService/chat/views/chat.dart';
import 'package:eHomeService/userSide/usersTile.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eHomeService/chat/views/chat.dart';
import 'package:eHomeService/chat/views/chatrooms.dart';
import 'package:eHomeService/chat/widget/widget.dart';
import 'package:eHomeService/userSide/activity/displayproblemcard.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';

class ProblemPost extends StatefulWidget {
  final String emailId;
  final String email;

  const ProblemPost({Key key, this.emailId, this.email}) : super(key: key);

  @override
  _ProblemPostState createState() => _ProblemPostState();
}

class _ProblemPostState extends State<ProblemPost> {
  final firebaseInstance = Firestore.instance;
  String email;


  display(){
    firebaseInstance.collection('Problems').document(email).collection('timeValue').getDocuments().then((querySnapshot) {
      querySnapshot.documents.forEach((element) {
        print(element.data);
      });
    });
  }
   void initState(){
    super.initState();
    // you can use this.widget.foo here
    email = this.widget.emailId;
  }

  CrudMethods crudMethods = new CrudMethods();
  Stream usersStream;

  Widget UsersList() {
    return SingleChildScrollView(
      physics: ClampingScrollPhysics(),
      child: Container(
          child: usersStream != null
              ? Column(children: <Widget>[
                  StreamBuilder(
                      stream: usersStream,
                      builder: (context, snapshot) {
                        if (!snapshot.hasData) {
                          return CircularProgressIndicator();
                        } else {
                          return ListView.builder(
                            physics: ClampingScrollPhysics(),
                            shrinkWrap: true,
                            padding: EdgeInsets.symmetric(horizontal: 16),
                            itemCount: snapshot.data.documents.length,
                            itemBuilder: (context, index) {
                              return UsersTile(
                                imgUrl: snapshot
                                    .data.documents[index].data['ImageUrl'],
                                problem: snapshot
                                    .data.documents[index].data['Problem'],
                                description: snapshot
                                    .data.documents[index].data['Description'],
                                mobileno: snapshot
                                    .data.documents[index].data['Phone Number'],
                              );
                            },
                          );
                        }
                      })
                ])
              : Container(
                  alignment: Alignment.center,
                  child: CircularProgressIndicator(),
                )),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: new FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => Chat()));
        },
        backgroundColor: Colors.deepPurpleAccent[200],
        child: Icon(
          Icons.message,
          color: Colors.white,
        ),
      ),
      body: StreamBuilder(
            stream: Firestore.instance.collection('Problems').document(email).collection('timeValue').snapshots(),
            builder: (context,snapshot){
              
              if(snapshot.hasData){
                return ListView.builder(
                  shrinkWrap: true,
                  itemCount: snapshot.data.documents.length,
                  itemBuilder: (context, index){
                    DocumentSnapshot documentSnapshot = snapshot.data.documents[index];
                    while(documentSnapshot.data !=null){
                      return GestureDetector(
                        onTap:null ,
                        child: DisplayProblemCard(documentSnapshot: documentSnapshot),
                      );
                    }

                  }
                );
              }
            },
          ),
        
    );
  }
}
