

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eHomeService/chat/widget/widget.dart';
import 'package:eHomeService/userSide/widgets/widgets.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gradient_widgets/gradient_widgets.dart';
import 'package:transparent_image/transparent_image.dart';
// import 'package:getwidget/getwidget.dart';
import 'package:getwidget/getwidget.dart';


class QueryDetails extends StatefulWidget {
   DocumentSnapshot documentSnapshot;
   String mobileno;


  QueryDetails(
      {
        @required this.mobileno,
      @required this.documentSnapshot
      });

  @override
  _QueryDetailsState createState() => _QueryDetailsState();
}

class _QueryDetailsState extends State<QueryDetails> {

  final _scaffoldKey = GlobalKey<ScaffoldState>();
  int startIndex = 0;

  int endIndex = 10;

  bool _isPressed = false;
  String comment;

  acceptLogic() async{
    Firestore.instance.collection('Problems').document(widget.documentSnapshot.documentID).updateData({
      "Comment" : comment,
      "Status": "Accepted",
      "valid": 1,
    }).then((value) {
      print("*******************************************");
      print("==== updated ===");
       final snackBar = SnackBar(content: Text('Query is Accepted'));
    _scaffoldKey.currentState.showSnackBar(snackBar);  
      // Scaffold.of(context).showSnackBar(SnackBar(content: Text('Saved in Database')));
      print("*******************************************");
    }).catchError((onError){
      print("*******************************************");
      print(onError);
      print("error =====> :-( ");
    });
  }

  rejectLogic(){
    Firestore.instance.collection('Problems').document(widget.documentSnapshot.documentID).updateData({
      "Comment" : comment,
      "Status": "Rejected",
      "valid": -1,
    }).then((value) {
      print("*******************************************");
      final snackBar = SnackBar(content: Text('Query is Rejected'));
    _scaffoldKey.currentState.showSnackBar(snackBar);  

      // Scaffold.of(context).showSnackBar(SnackBar(content: Text('Query is Rejected')));
      print("==== updated ===");
      print("*******************************************");
   
    }).catchError((onError){
      print("*******************************************");
      print("error =====> :-( ");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
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
                              ]
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(20.0),
                              child: TextFormField(
                                maxLines: 5,
                                keyboardType: TextInputType.multiline,
                                maxLength: null,
                                onSaved: (value){
                                  return comment = value;
                                },
                                onChanged: (value){
                                  return comment = value;
                                },
                                validator: (value){
                                  return comment = value;
                                },
                                style: TextStyle(color: Colors.black),
                                decoration: InputDecoration(
                                  hintText: "Comment",
                                  hintStyle: inputTextStyleDetail(),
                                  fillColor: Colors.blue,
                                  enabledBorder: borderStyleDetail(),
                                  focusedBorder: borderStyleDetail(),
                                )
                              ),
                            ),
                          Container(
                            alignment: Alignment.center,
                            padding: EdgeInsets.all(40.0),
                            child: Row(
                              children:[
                                Align(
                                  alignment: Alignment.center,
                                  child: FlatButton(
                                    padding: EdgeInsets.all(15.0),
                                    color: Colors.white,
                                    child: Row(
                                      children: [
                                        new  Icon(
                                          Icons.thumb_up,
                                          color:Colors.teal,
                                        ),
                                        SizedBox(width:8.0),
                                        Text(
                                          "Accept",
                                          style: TextStyle(
                                          color:Colors.teal,
                                          fontSize: 20),
                                         ),
                                         
                                        ],
                                      ),
                                    shape: new RoundedRectangleBorder(
                                        side: BorderSide(
                                          color:Colors.teal,
                                          style: BorderStyle.solid),
                                          borderRadius: BorderRadius.circular(8)),
                                    onPressed:() async{
                                      await acceptLogic();
                                      // Navigator.pop(context);
                                    } 
                                        ),
                                      ),
                                SizedBox(width:20),
                                Align(
                                        alignment: Alignment.center,
                                        child: FlatButton(
                                          padding: EdgeInsets.all(15.0),
                                          color: Colors.white,
                                          child: Row(
                                            children: [
                                              new  Icon(
                                                Icons.thumb_down,
                                                 color:Colors.redAccent[200],
                                              ),
                                              SizedBox(width:8.0),
                                              Text(
                                                "Reject",
                                                style: TextStyle(
                                                color:Colors.redAccent[200],
                                                fontSize: 20),
                                              ),
                                            ],
                                          ),
                                          shape: new RoundedRectangleBorder(
                                            side: BorderSide(
                                              color:Colors.redAccent[200],
                                              style: BorderStyle.solid),
                                              borderRadius: BorderRadius.circular(8)),
                                              onPressed: rejectLogic,
                                            ),
                                          ),

                              ],
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



    //  Column(
    //                       children: <Widget>[
    //                         SizedBox(height: 50),
    //                        Column(
    //                       children: <Widget>[
    //                         SizedBox(height: 8),
                            // Align(
                            //   alignment: Alignment.center,
                            //   child: Text(
                            //    widget.documentSnapshot['Problem'],
                            //     textAlign: TextAlign.center,
                            //     style: TextStyle(
                            //         color: Colors.black,
                            //         fontSize: 22,
                            //         fontFamily: "GentiumBasic",
                            //         fontWeight: FontWeight.bold),
                            //   ),
                            // ),
    //                         SizedBox(height: 12),
    //                         Container(
    //                           padding: EdgeInsets.all(10.0),
    //                           child:  Align(
    //                           alignment: Alignment.center,
    //                           child: Text(widget.documentSnapshot['Description'],
    //                             textAlign: TextAlign.center,
    //                             style: inputTextStyleDetail()),
    //                         ),
    //                         ),
    //                         Align(
    //                           alignment: Alignment.center,
    //                           child: Text(
    //                             widget.documentSnapshot['Time'].toDate().toString(),
    //                             style: inputTextStyleDetail(),
    //                           ),
    //                         ),
    //                         SizedBox(height: 10),
    //                         Align(
    //                           alignment: Alignment.center,
    //                           child: Text(
    //                             'UserDetail',
    //                             style: textStyleDetail(),
    //                           ),
    //                         ),
    //                         SizedBox(
    //                           height: 10.0,
    //                           width: 120.0,//pixel
    //                           child: Divider(
    //                             thickness: 2.0,
    //                             color: Colors.black,
    //                           ),
    //                         ),
    //                         Align(
    //                           alignment: Alignment.center,
    //                           child: Text(
    //                             widget.documentSnapshot['Email'],
    //                             style: inputTextStyleDetail(),
    //                           ),
    //                         ),
    //                         Align(
    //                           alignment: Alignment.center,
    //                           child: Text(
    //                             widget.documentSnapshot['Phone Number'],
    //                             style: inputTextStyleDetail(),
    //                           ),
    //                         ),
    //                         Align(
    //                           alignment: Alignment.center,
    //                           child: Text(
    //                             widget.documentSnapshot['Address'],
    //                             style: inputTextStyleDetail(),
    //                           ),
    //                         ),
    //                         SizedBox(height: 30),
                          //   Padding(
                          //     padding: EdgeInsets.all(20.0),
                          //     child: TextFormField(
                          //       maxLines: 5,
                          //       keyboardType: TextInputType.multiline,
                          //       maxLength: null,
                          //       onSaved: (value){
                          //           return null;
                          //       },
                          //       onChanged: (value){
                          //         return  null;
                          //       },
                          //       validator: (value){
                          //         return  null;
                          //       },

                          //       style: TextStyle(color: Colors.black),
                          //       decoration: InputDecoration(
                          //         hintText: "Comment",
                          //         hintStyle: inputTextStyleDetail(),
                          //         fillColor: Colors.blue,
                          //         enabledBorder: borderStyleDetail(),
                          //         focusedBorder: borderStyleDetail(),
                          //       )),

                          // ),
                          // Container(
                          // alignment: Alignment.center,
                          //     padding: EdgeInsets.all(40.0),
                          //     child: Row(
                          //       children:[
                          //         Align(
                          //           alignment: Alignment.center,
                          //           child: FlatButton(
                          //             padding: EdgeInsets.all(15.0),
                          //             color: Colors.white,
                          //             child: Row(
                          //               children: [
                          //                 new  Icon(
                          //                   Icons.thumb_up,
                          //                   color:Colors.blueAccent[200],
                          //                 ),
                          //                 SizedBox(width:8.0),
                          //               Text(
                          //               "Accept",
                          //               style: TextStyle(
                          //                   color:Colors.blueAccent[200],
                          //                   fontSize: 20),
                          //                 ),
                          //               ],
                          //             ),
                          //             shape: new RoundedRectangleBorder(
                          //                 side: BorderSide(
                          //                     color:Colors.blueAccent[200],
                          //                     style: BorderStyle.solid),
                          //                 borderRadius: BorderRadius.circular(8)),
                          //             onPressed: _isPressed
                          // ? null
                          // : () {
                              
                          //     Firestore.instance
                          //         .collection("Problems")
                          //         .document()
                          //         .updateData(
                          //       {
                          //         "status": "Completed",
                          //       },
                          //     );
                          //        setState(
                          //       () => _isPressed = !_isPressed,
                          //     );
                          //     if (_isPressed == true) {
                          //       print("True");
                          //     } else {
                          //       print("Disabled");
                          //     }
                          //   }),   
                          //         ),
                                  
                          //         SizedBox(width:20),
                          //         Align(
                          //           alignment: Alignment.center,
                          //           child: FlatButton(
                          //             padding: EdgeInsets.all(15.0),
                          //             color: Colors.white,
                          //             child: Row(
                          //               children: [
                          //                 new  Icon(
                          //                   Icons.thumb_down,
                          //                   color:Colors.redAccent[200],
                          //                 ),
                          //                 SizedBox(width:8.0),
                          //                 Text(
                          //               "Reject",
                          //               style: TextStyle(
                          //                   color:Colors.redAccent[200],
                          //                   fontSize: 20),
                          //                 ),
                          //               ],
                          //             ),
                          //             shape: new RoundedRectangleBorder(
                          //                 side: BorderSide(
                          //                     color:Colors.redAccent[200],
                          //                     style: BorderStyle.solid),
                          //                 borderRadius: BorderRadius.circular(8)),
                          //             onPressed: null,
                          //           ),
                          //         ),

                          //       ],
                          //     ),
                          //   ),
    //                     SizedBox(height: 100.0,),
    //                     ],
    //                   ),

    //                     ],
    //                   ),
                   










