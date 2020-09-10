import 'package:eHomeService/chat/services/crud.dart';
import 'package:eHomeService/chat/views/chat.dart';
import 'package:eHomeService/userSide/usersTile.dart';
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
  String email;

  @override
  void initState() {
    crudMethods.getData().then((result) {
      setState(() {
        usersStream = result;
      });
    });
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
          Icons.query_builder,
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
