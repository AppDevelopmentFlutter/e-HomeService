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
  //final String email;

  const ProblemPost({
    Key key,
    this.emailId,
  }) : super(key: key);

  @override
  _ProblemPostState createState() => _ProblemPostState();
}

class _ProblemPostState extends State<ProblemPost> {
  final firebaseInstance = Firestore.instance;
  //String email;

  // display() {
  //   firebaseInstance
  //       .collection('Problems')
  //       .document(email)
  //       .collection('timeValue')
  //       .getDocuments()
  //       .then((querySnapshot) {
  //     querySnapshot.documents.forEach((element) {
  //       print(element.data);
  //     });
  //   });
  // }

  CrudMethods crudMethods = new CrudMethods();
  Stream usersStream;

  // @override
  // void initState() {
  //   crudMethods.getData().then((result) {
  //     setState(() {
  //       usersStream = result;
  //     });
  //   });
  //   super.initState();
  //   email = this.widget.emailId;
  // }

//   void _onPressed() async{
// Firestore.instance.collection('Problems').getDocuments().then((querySnapshot) {
//   querySnapshot.documents.forEach((result) {
//     Firestore.instance
//         .collection('Problems')
//         .document(email)
//         .collection('timeValue')
//         .getDocuments()
//         .then((querySnapshot) {
//       querySnapshot.documents.forEach((result) {
//         print(result.data);
//       });
//     });
//   });
// });
// }

  Widget UsersList() {
    print("Hello this is my email"+widget.emailId);
    return SingleChildScrollView(
      physics: ClampingScrollPhysics(),
      child: Container(
          child: Column(children: <Widget>[
           
        StreamBuilder<QuerySnapshot>(
            stream:Firestore.instance
                .collection('Problems')
                .document(widget.emailId)
                .collection('timeValue')
                .snapshots(),
            
            builder: (context, snapshot) {
           //   print("Helooooo this is my email"+email);
              if (!snapshot.hasData) {
                print("Hello email" +widget.emailId);
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
                      //  while(documentSnapshot.data !=null){
                      return UsersTile(
                        imgUrl: documentSnapshot['ImageUrl'],
                        problem: documentSnapshot['Problem'],
                        description: documentSnapshot['Description'],
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
              context, MaterialPageRoute(builder: (context) => Chat()));
        },
        backgroundColor: Colors.deepPurpleAccent[200],
        child: Icon(
          Icons.message,
          color: Colors.white,
        ),
      ),
      // body: StreamBuilder(
      //       stream: Firestore.instance.collection('Problems').document(email).collection('timeValue').snapshots(),
      //       builder: (context,snapshot){

      //         if(!snapshot.hasData){ Text('Loading');
      //     } else {
      //           return ListView.builder(
      //             shrinkWrap: true,
      //             itemCount: snapshot.data.documents.length,
      //             itemBuilder: (context, index){
      //               DocumentSnapshot documentSnapshot = snapshot.data.documents[index];
      //               while(documentSnapshot.data !=null){
      //                 return GestureDetector(
      //                   onTap:null ,
      //                   child: DisplayProblemCard(documentSnapshot: documentSnapshot),
      //                 );
      //               }

      //             }
      //           );
      //         }
      //       },
      //     ),

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
