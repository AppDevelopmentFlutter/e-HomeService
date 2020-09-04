import 'package:flutter/material.dart';
import 'package:gradient_text/gradient_text.dart';
import 'package:eHomeService/userSide/widgets/widgets.dart';

import 'description_page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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

      ),
      body: new Column(
        children: [
          Container(),
        ],
      ),
      floatingActionButton: new FloatingActionButton(
        onPressed: (){
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context)=>DescriptionPage())
          );
        },
        backgroundColor: Colors.deepPurpleAccent[200],
        child: Icon(
          Icons.query_builder,
          color: Colors.white,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}