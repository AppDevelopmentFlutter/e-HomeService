import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eHomeService/chat/widget/widget.dart';
import 'package:eHomeService/userSide/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:gradient_widgets/gradient_widgets.dart';
import 'package:transparent_image/transparent_image.dart';
// import 'package:getwidget/getwidget.dart';
import 'package:getwidget/getwidget.dart';


class QueryDetails extends StatelessWidget {
   DocumentSnapshot documentSnapshot;

  int startIndex = 0;
  int endIndex = 10;

  QueryDetails(
      {
      @required this.documentSnapshot
      });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned:true,
            backgroundColor: Colors.black,
            expandedHeight: 250.0,
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
                      child: Column(children: [
                        Stack(
                          children: [
                            // Center(
                           //   child: CircularProgressIndicator(),
                           // ),
                            Center(
                              child:FadeInImage.memoryNetwork(
                                placeholder: kTransparentImage,
                                  image: documentSnapshot['ImageUrl'],
                                  width: 300.0,
                                  height: 350.0,
                               ),
                              ),
                            ],
                          ),

                        Column(
                          children: <Widget>[
                            SizedBox(height: 50),
                           Column(
                          children: <Widget>[
                            SizedBox(height: 8),
                            Align(
                              alignment: Alignment.center,
                              child: Text(
                               documentSnapshot['Problem'],
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 22,
                                    fontFamily: "GentiumBasic",
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            SizedBox(height: 12),
                            Container(
                              padding: EdgeInsets.all(10.0),
                              child:  Align(
                              alignment: Alignment.center,
                              child: Text(documentSnapshot['Description'],
                                textAlign: TextAlign.center,
                                style: inputTextStyleDetail()),
                            ),
                            ),
                            Align(
                              alignment: Alignment.center,
                              child: Text(
                                documentSnapshot['Time'].toDate().toString(),
                                style: inputTextStyleDetail(),
                              ),
                            ),
                            SizedBox(height: 10),
                            Align(
                              alignment: Alignment.center,
                              child: Text(
                                'UserDetail',
                                style: textStyleDetail(),
                              ),
                            ),
                            SizedBox(
                              height: 10.0,
                              width: 120.0,//pixel
                              child: Divider(
                                thickness: 2.0,
                                color: Colors.black,
                              ),
                            ),
                            Align(
                              alignment: Alignment.center,
                              child: Text(
                                documentSnapshot['Email'],
                                style: inputTextStyleDetail(),
                              ),
                            ),
                            Align(
                              alignment: Alignment.center,
                              child: Text(
                                documentSnapshot['Phone Number'],
                                style: inputTextStyleDetail(),
                              ),
                            ),
                            Align(
                              alignment: Alignment.center,
                              child: Text(
                                documentSnapshot['Address'],
                                style: inputTextStyleDetail(),
                              ),
                            ),
                            SizedBox(height: 30),
                            Padding(
                              padding: EdgeInsets.all(20.0),
                              child: TextFormField(
                                maxLines: 5,
                                keyboardType: TextInputType.multiline,
                                maxLength: null,
                                onSaved: (value){
                                    return null;
                                },
                                onChanged: (value){
                                  return  null;
                                },
                                validator: (value){
                                  return  null;
                                },

                                style: TextStyle(color: Colors.black),
                                decoration: InputDecoration(
                                  hintText: "Comment",
                                  hintStyle: inputTextStyleDetail(),
                                  fillColor: Colors.blue,
                                  enabledBorder: borderStyleDetail(),
                                  focusedBorder: borderStyleDetail(),
                                )),

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
                                            color:Colors.blueAccent[200],
                                          ),
                                          SizedBox(width:8.0),
                                        Text(
                                        "Accept",
                                        style: TextStyle(
                                            color:Colors.blueAccent[200],
                                            fontSize: 20),
                                          ),
                                        ],
                                      ),
                                      shape: new RoundedRectangleBorder(
                                          side: BorderSide(
                                              color:Colors.blueAccent[200],
                                              style: BorderStyle.solid),
                                          borderRadius: BorderRadius.circular(8)),
                                      onPressed: null,
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
                                      onPressed: null,
                                    ),
                                  ),

                                ],
                              ),
                            ),
                        SizedBox(height: 100.0,),
                        ],
                      ),

                        ],
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














