

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eHomeService/chat/widget/widget.dart';
import 'package:eHomeService/userSide/widgets/widgets.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gradient_widgets/gradient_widgets.dart';
import 'package:transparent_image/transparent_image.dart';
// import 'package:getwidget/getwidget.dart';
import 'package:getwidget/getwidget.dart';


class ProblemDetail extends StatefulWidget {
   DocumentSnapshot documentSnapshot;
   String mobileno;


  ProblemDetail(
      {
        @required this.mobileno,
      @required this.documentSnapshot
      });

  @override
  _ProblemDetailState createState() => _ProblemDetailState();
}

class _ProblemDetailState extends State<ProblemDetail> {
  int startIndex = 0;

  int endIndex = 10;

  bool _isPressed = false;
  String comment;



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned:true,
            backgroundColor: Colors.black,
            expandedHeight: 150.0,
            flexibleSpace: FlexibleSpaceBar(
              title:Row(
                children: <Widget>[
                  GradientText("E-HomeServices",
                    gradient: LinearGradient(colors:[
                    Colors.deepPurpleAccent[200],
                    Colors.redAccent[200]
                  ]
                ),
                style: TextStyle(fontSize: 22, fontFamily: "GentiumBasic"),
                textAlign: TextAlign.center)
                ],
              ),
              // background: new Ima
            ),
          ),
          SliverFillRemaining(
            child: Container(
              color: Colors.black,
              height: MediaQuery.of(context).size.height,
              padding: EdgeInsets.only(top:100),
              child: SingleChildScrollView(
                child: Container(
                  child:  Card(
                    elevation: 10.0,
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius:BorderRadius.circular(20.0)
                      ),
                      child: Column(
                        children: [
                          Align(
                            alignment: Alignment.center,
                            child: Text(
                              widget.documentSnapshot['Problem'].toUpperCase(),
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 24,
                                fontFamily: "GentiumBasic",
                                fontWeight: FontWeight.bold
                                ),
                              ),
                            ),

                          Stack(
                            children: [
                              Center(
                                child: SizedBox(
                                  width: 300,
                                  height: 350,
                                  child:FadeInImage.memoryNetwork(
                                    placeholder: kTransparentImage,
                                    image: widget.documentSnapshot['ImageUrl'],
                                      width: 300.0,
                                      height: 350.0,
                                  ),
                                ),
                              ),
                                // Center(
                                //   child: CircularProgressIndicator(),
                                // ),
                            ],
                          ),

                          Container(
                            padding: EdgeInsets.all(12.0),
                            child: Column(
                              children: [
                                GFAccordion(
                                  collapsedTitlebackgroundColor: Color(0xFFE0E0E0),
                                  expandedTitlebackgroundColor: Colors.grey,
                                  title: 'Description',
                                  textStyle: textStyleDetail(),
                                  contentChild: Text(
                                      widget.documentSnapshot['Description'],
                                      style:accordionSub()
                                  ),
                                ),
                                GFAccordion(
                                  collapsedTitlebackgroundColor: Color(0xFFE0E0E0),
                                  expandedTitlebackgroundColor: Colors.grey,
                                  textStyle: textStyleDetail(),
                                  title: 'User Detail',
                                  // content: widget.documentSnapshot['Description'],
                                  contentChild: Column(
                                    children: [
                                      Row(
                                        children: [
                                          Padding(
                                            padding:  EdgeInsets.only(right:8.0),
                                            child: Text(
                                            'Email : ',
                                            style: accordionMain(),
                                            ),
                                          ),
                                          Text(
                                            widget.documentSnapshot['Email'],
                                            style:accordionSub()
                                          )
                                        ],
                                      ),
                                      SizedBox(height: 8.0),
                                      Row(
                                        children: [
                                          Padding(
                                            padding:  EdgeInsets.only(right:8.0),
                                            child: Text(
                                            'Phone Number :',
                                            style: accordionMain(),
                                            ),
                                          ),
                                          Text(
                                            widget.documentSnapshot['Phone Number'],
                                            style:accordionSub()
                                          )
                                        ],

                                      ),
                                      SizedBox(height: 8.0),
                                      Row(
                                        children: [
                                          Padding(
                                            padding:  EdgeInsets.only(right:8.0),
                                            child: Text(
                                            'Address : ',
                                            style: accordionMain(),
                                            ),
                                          ),
                                          Text(
                                            widget.documentSnapshot['Address'],
                                            style:accordionSub()
                                          )
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                 GFAccordion(
                                  collapsedTitlebackgroundColor: Color(0xFFE0E0E0),
                                  expandedTitlebackgroundColor: Colors.grey,
                                  title: 'Comment',
                                  textStyle: textStyleDetail(),
                                  contentChild: Text(
                                      widget.documentSnapshot['Comment'],
                                      style:accordionSub()
                                  ),
                                ),
                             
                              ]

                            ),
                          ),
                    ],
                  ),
                ),
              ),),
            ),
          ),
        ],
      ),
    );
  }
}


