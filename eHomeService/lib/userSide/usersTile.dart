import 'package:cached_network_image/cached_network_image.dart';
import 'package:eHomeService/chat/widget/widget.dart';
import 'package:flutter/material.dart';

class UsersTile extends StatelessWidget {
  String imgUrl, problem, description, mobileno;
  TextEditingController editingController = TextEditingController();

  int startIndex = 0;
  int endIndex = 10;

  UsersTile(
      {@required this.imgUrl,
      @required this.problem,
      @required this.description,
      @required this.mobileno});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(bottom: 16),
        height: 92,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: Colors.grey, width: 2)),
        child: Card(
          elevation: 10,
          color: Colors.black,
          child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Align(
                  alignment: Alignment.centerLeft,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: CachedNetworkImage(
                      imageUrl: imgUrl,
                      height: 120,
                      width: 110,
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                Column(
                  children: <Widget>[
                    SizedBox(height: 4),
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
                    Align(
                      alignment: Alignment.center,
                      child: Text(description,
                          textAlign: TextAlign.center,
                          style: biggerTextStyle()),
                    ),
                    SizedBox(height: 4),
                    Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        mobileno,
                        style: biggerTextStyle(),
                      ),
                    ),
                  ],
                ),
                Align(
                  alignment: Alignment.center,
                  child: Container(
                    width: 50,
                    height: 50,
                    child: RaisedButton(
                      child: Icon(
                        Icons.thumb_up,
                        color: Colors.white,
                        // size: 40,
                      ),
                      color: Colors.green,
                      shape: RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(25),
                      ),
                      onPressed: () {
                        // _launchCaller(mobileno);
                      },
                    ),
                  ),
                ),
              ]),
        ));
  }
}
