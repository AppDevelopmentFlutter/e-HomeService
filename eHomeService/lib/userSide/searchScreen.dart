import 'package:flutter/material.dart';
import 'package:gradient_text/gradient_text.dart';
import 'package:eHomeService/userSide/widgets/widgets.dart';

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          title: Row(
            children: <Widget>[
              Padding(padding: EdgeInsets.symmetric(horizontal: 15)),
               GradientText("E-HouseService",
                gradient: LinearGradient(
                  colors: [
                  Colors.deepPurpleAccent[200],
                  Colors.redAccent[200]
                ]),
                style: appbarStyle(),
                textAlign: TextAlign.center)
            ],
          )),
          body: ListView(children: <Widget>[
        Column(
          children: <Widget>[
            Padding(
                padding: EdgeInsets.only(top:20,left:15,right:15),
            child:TextField(
              //controller: editingController,
              // style: mediumStyle(),
              onChanged: (val) {
              //  initiateSearch(val);
              },
              decoration: InputDecoration(
                hintText: "Search",
                // hintStyle: mediumStyle(),
                prefixIcon: Icon(
                  Icons.search,
                  color: Colors.white,
                ),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(25.0)),
                    borderSide: BorderSide(color: Colors.grey)),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(25.0)),
                    borderSide: BorderSide(color: Colors.grey)),
              ),
            ),
            ),
          ]
          ),
        ],
      ),
    );
  }
}