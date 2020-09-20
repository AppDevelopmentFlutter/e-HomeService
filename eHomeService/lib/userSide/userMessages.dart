import 'package:flutter/material.dart';
import 'package:gradient_text/gradient_text.dart';
import 'package:eHomeService/userSide/description_page.dart';
//import 'package:eHomeService/userSide/navbar.dart';
import 'package:eHomeService/userSide/widgets/widgets.dart';

class UserMessages extends StatefulWidget {
  @override
  _UserMessagesState createState() => _UserMessagesState();
}

class _UserMessagesState extends State<UserMessages> {

  Widget UsersList() {
    return SingleChildScrollView(
      physics: ClampingScrollPhysics(),
      child: Container(),
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
       backgroundColor: Colors.black,
       title: Row(
            children: <Widget>[
              Padding(padding: EdgeInsets.symmetric(horizontal: 29)),
              GradientText("Messages",
                gradient: LinearGradient(
                colors: [Colors.deepPurpleAccent[200],
                        Colors.redAccent[200]]
                      ),
                style: appbarStyle(),
                textAlign: TextAlign.center)
                ],
            )
          ),
     // drawer: NavDrawer(),
      body: ListView(
        shrinkWrap: true,
        children: <Widget>[
          Column(children: <Widget>[
            Padding(padding: EdgeInsets.symmetric(vertical: 15)),
            UsersList(),
            Container(
              padding: EdgeInsets.symmetric(vertical: 450,horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  FloatingActionButton(
                      backgroundColor: Colors.deepPurpleAccent[200],
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => DescriptionPage()));
                      },
                      child: Icon(Icons.add)),
                ],
              ),
            ),
            Padding(padding: EdgeInsets.symmetric(vertical: 10)),
          ]),
        ],
      ),
    );
  }
}