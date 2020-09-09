import 'package:eHomeService/chat/views/chat.dart';
import 'package:flutter/material.dart';

import 'package:flutter/material.dart';


class ProblemPost  extends StatefulWidget {
  final String emailId;

  const ProblemPost({Key key, this.emailId}) : super(key: key);
  
  @override
  _ProblemPostState createState() => _ProblemPostState();
}

class _ProblemPostState extends State<ProblemPost> {
  String email;

   void initState(){
    super.initState();
    // you can use this.widget.foo here
    email = this.widget.emailId;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: new FloatingActionButton(
        onPressed: (){
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context)=>Chat())
          );
        },
        backgroundColor: Colors.deepPurpleAccent[200],
        child: Icon(
          Icons.query_builder,
          color: Colors.white,
        ),
      ),
      body: Container(
        child: Center(child: Text('$email ...'),),
      ),
    );
  }
}