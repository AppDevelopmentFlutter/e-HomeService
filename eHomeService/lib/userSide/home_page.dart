import 'package:eHomeService/chat/helper/authenticate.dart';
import 'package:eHomeService/chat/services/auth.dart';
import 'package:eHomeService/chat/views/signin.dart';
import 'package:eHomeService/chat/widget/widget.dart';
import 'package:flutter/material.dart';
import 'package:gradient_text/gradient_text.dart';
import 'package:eHomeService/userSide/widgets/widgets.dart';

import 'description_page.dart';

class HomePage extends StatefulWidget {
    final String email;

  final String uid;

  const HomePage({Key key, this.email, this.uid}) : super(key: key);
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {



  String emailValue;
  String userId;
   void initState(){
    super.initState();
    // you can use this.widget.foo here
    emailValue = this.widget.email;
    userId = this.widget.uid;

  }


  AuthService auth = new AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Row(
            children: <Widget>[
              GradientText("E-HomeServices",
                gradient: LinearGradient(
                  colors: [Colors.deepPurpleAccent[200],
                        Colors.redAccent[200]]
                  ),
                  style: TextStyle(
                      fontSize: 22,
                      fontFamily: "GentiumBasic"
                    ),
                  textAlign: TextAlign.center
              )
            ],
          ) ,
          actions: [
            GestureDetector(
              onTap:(){
                auth.signOut();
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Authenticate()));
              },
              child: Container(
              padding: EdgeInsets.symmetric(horizontal:16.0),
             child: Icon(Icons.exit_to_app)
            )
            )
          ],

      ),
      body: new Column(
        children: [
          Container(
            child:  Text('$emailValue',
            style: biggerTextStyle() ,),
          ),
        ],
      ),
      floatingActionButton: new FloatingActionButton(
        onPressed: (){
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context)=>DescriptionPage(email: emailValue,))
          );
        },
        backgroundColor: Colors.deepPurpleAccent[200],
        child: Icon(
          Icons.query_builder,
          color: Colors.white,
        ),
      ),
    );
  }
}