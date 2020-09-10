import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eHomeService/chat/widget/widget.dart';
import 'package:flutter/material.dart';

class DisplayProblemCard extends StatelessWidget {
  final DocumentSnapshot documentSnapshot;

  const DisplayProblemCard({Key key, this.documentSnapshot}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
print(documentSnapshot["Time"]);
    return Container(
      padding: EdgeInsets.only(top:20.0,left:15.0,right: 15.0,bottom: 10.0),
    child: Card(
      color:Colors.teal[50],

      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(25.0),
      ),
      elevation:15.0,

      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: new Image.network(
              documentSnapshot["ImageUrl"],
              height: 125.0,
              width: 150.0,

              alignment: Alignment.bottomLeft,
              fit: BoxFit.fill,

            ),


          ),
          Expanded(
            child:Column(
              children: [

                SizedBox(
                  height: 5.0,
                ),

                Text(
                  "Problem: ",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontSize: 15.0,
                    fontStyle: FontStyle.normal,
                    fontFamily: 'SourceSansPro',
                    color: Colors.black ,
                    fontWeight:FontWeight.bold,
                  ),
                ),
                Text(
                  documentSnapshot["Problem"],
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 12.0,
                    fontStyle: FontStyle.italic,
                    fontFamily: 'SourceSansPro',
                    color: Colors.grey[600] ,
                    fontWeight:FontWeight.bold,
                  ),
                ),

                Text(
                  "Description: ",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontSize: 15.0,
                    fontStyle: FontStyle.normal,
                    fontFamily: 'SourceSansPro',
                    color: Colors.black ,
                    fontWeight:FontWeight.bold,
                  ),
                ),
                Text(
                  documentSnapshot["Description"],
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 12.0,
                    fontStyle: FontStyle.italic,
                    fontFamily: 'SourceSansPro',
                    color: Colors.grey[600] ,
                    fontWeight:FontWeight.bold,
                  ),
                ),
                Text(
                  
                  documentSnapshot["Time"].toString(),
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 12.0,
                    fontStyle: FontStyle.italic,
                    fontFamily: 'SourceSansPro',
                    color: Colors.grey[600] ,
                    fontWeight:FontWeight.bold,
                  ),
                ),


              ],
            ),
          ),
        
       ],
      ),
    ),
    );

   
  }
}