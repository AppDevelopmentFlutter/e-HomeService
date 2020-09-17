import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eHomeService/chat/widget/widget.dart';
import 'package:eHomeService/owner/query/queryDetail.dart';
import 'package:flutter/material.dart';

class UsersTile extends StatelessWidget {
  String imgUrl, problem, description, mobileno;
  Timestamp time;
  DocumentSnapshot documentSnapshot;
  TextEditingController editingController = TextEditingController();

  int startIndex = 0;
  int endIndex = 10;

  UsersTile(
      {@required this.imgUrl,
      @required this.problem,
      // @required this.description,
      // @required this.mobileno,
      @required this.time,
      @required this.documentSnapshot,
      });



  // String timeValue = (time.toDate().day).toString();
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(bottom: 16),
        height: 125,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: Colors.grey, width: 2)),
        child: GestureDetector(
          onTap: (){
            Navigator.push(
              context, 
              MaterialPageRoute(builder: (context)=>
              //  Container()
              QueryDetails(
                documentSnapshot: documentSnapshot,
              )
              )
            );
          },
          // onTap: null,
          child: Card(
          elevation: 10,
          color: Colors.black,
          child: SingleChildScrollView(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Align(
                  alignment: Alignment.centerLeft,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: CachedNetworkImage(
                      imageUrl: imgUrl,
                      height: 100,
                      width: 100,
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                Expanded(
                  child: Column(
                    children: <Widget>[
                      SizedBox(height: 8),
                      Align(
                        alignment: Alignment.center,
                        child: Text(
                          problem,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontFamily: "GentiumBasic",
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      SizedBox(height: 9),
                      // Align(
                      //   alignment: Alignment.center,
                      //   child: Text(time.toDate().toString(),
                      //       textAlign: TextAlign.center,
                      //       style: biggerTextStyle()),
                      // ),
                      SizedBox(height: 10),
                      Align(
                        alignment: Alignment.center,
                        child: FlatButton(
                          color: Colors.white,
                          child: Text(
                            "Pending",
                           // myorder_status != null ? myorder_status : " ",
                            style: TextStyle(
                                color:// myorder_status == 'Completed'
                                   // ? 
                                   // Colors.teal[200],
                                   // : 
                                    Colors.redAccent[200],
                                fontSize: 20),
                          ),
                          shape: new RoundedRectangleBorder(
                              side: BorderSide(
                                  color: 
                                  //myorder_status == 'Completed'
                                     // ? 
                                     // Colors.teal[200],
                                    //  :
                                     Colors.redAccent[200],
                                  style: BorderStyle.solid),
                              borderRadius: BorderRadius.circular(8)),
                          onPressed: null,
                        ),
                         ),
                    ],
                  ),
                ),
                // Align(
                //   alignment: Alignment.center,
                //   child: Container(
                //     width: 50,
                //     height: 50,
                //     child: RaisedButton(
                //       child: Icon(
                //         Icons.thumb_up,
                //         color: Colors.white,
                //         // size: 40,
                //       ),
                //       color: Colors.green,
                //       shape: RoundedRectangleBorder(
                //         borderRadius: new BorderRadius.circular(25),
                //       ),
                //       onPressed: () {
                //         // _launchCaller(mobileno);
                //       },
                //     ),
                //   ),
                // ),
        ]),
      ),
          )
    )
    );
  }
}
