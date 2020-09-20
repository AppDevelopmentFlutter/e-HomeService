import 'package:flutter/material.dart';

class OwnerProfile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: new AppBar(
        elevation: 0.0,
        backgroundColor: Colors.black,
      ),
      body: Container(
        child: Stack(
          children: <Widget>[
            Column(
              children: <Widget>[
                Container(
                  height: MediaQuery.of(context).size.height / 7.5,
                  width: double.infinity,
                  color: Colors.black,
                ),
                Center(
                  child: Container(
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height / 1.335,
                    decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      //color: Colors.white,
                      gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [Colors.deepPurple[900], Colors.red],
                      ),

                      boxShadow: [
                        BoxShadow(
                          color: Colors.black26,
                          blurRadius: 5.0,
                          spreadRadius: 2.0,
                        ),
                      ],
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(45.0),
                        topRight: Radius.circular(45.0),
                        bottomLeft: Radius.circular(45.0),
                        bottomRight: Radius.circular(45.0),
                      ),
                    ),
                    child: Padding(
                      padding: EdgeInsets.only(top: 18),
                      child: Center(
                        child: Column(
                          children: <Widget>[
                          Padding(
                            padding: EdgeInsets.only(top: 90),
                            child: Text(
                              'Santhosh k shetty',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 24,
                              ),
                            ),
                          ),
                          SizedBox(height: 30),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: Row(
                              children: [
                                Text(
                                  "Email:",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                  ),
                                ),
                                Text(
                                  "Vijayalakshmicandr@gmail.com",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                  ),
                                ), //Vijayalakshmicandr@gmail.com
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width/5.5),
                            child: Row(
                              children: [
                                Text(
                                  "Mobile No:",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                  ),
                                ),
                                SizedBox(width: 20,),
                                Text(
                                  "9731991185",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                  ),
                                ), //Vijayalakshmicandr@gmail.com
                              ],
                            ),
                          ),
                        ]),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Positioned(
              left: 10.0,
              right: 10.0,
              top: 13,
              child: Align(
                alignment: Alignment.topCenter,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(80.0),
                    boxShadow: [
                      new BoxShadow(color: Colors.black38, blurRadius: 15.0),
                    ],
                  ),
                  child: CircleAvatar(
                    radius: 80,
                    backgroundColor: Colors.white10,
                    child: ClipOval(
                      child: SizedBox(
                        height: 148,
                        width: 145,
                        child: Image.asset(
                          "assets/ownerphoto.jpeg",
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
