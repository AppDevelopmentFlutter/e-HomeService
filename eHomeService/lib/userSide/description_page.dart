import 'dart:io';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gradient_text/gradient_text.dart';
import 'package:image_picker/image_picker.dart';
import 'package:eHomeService/userSide/widgets/widgets.dart';

class DescriptionPage extends StatefulWidget {
  @override
  _DescriptionPageState createState() => _DescriptionPageState();
}

class _DescriptionPageState extends State<DescriptionPage> {
  File _image;
  final picker = ImagePicker();
  Future getImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);

    setState(() {
      _image = File(pickedFile.path);
    });
  }

  void _showDialog() {
    showDialog(
      context: context, barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return new AlertDialog(
          title: new Text('Confirm message?',style:TextStyle(color: Colors.black, fontSize: 24, fontFamily: "GentiumBasic",)),
          content: new SingleChildScrollView(
            child: new ListBody(
              children: [
                new Text('Your household problem will be sent!',
                    style: simpleStyle()),
              ],
            ),
          ),
          actions: [
            Row(
              children: <Widget>[
                Padding(padding: EdgeInsets.symmetric(horizontal: 15)),
                RaisedButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)),
                  color: Colors.red,
                  padding: EdgeInsets.only(top:10,bottom:10,left:15,right:15),
                  child: Text("Cancel", style: simpleStyle()),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
                Padding(padding: EdgeInsets.symmetric(horizontal: 22)),
                RaisedButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)),
                  color: Colors.green,
                  padding: EdgeInsets.only(top:10,bottom:10,left:30,right:30),
                  child: Text("Ok", style: simpleStyle()),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
                Padding(padding: EdgeInsets.symmetric(horizontal: 15))
              ],
            )
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        title: Row(
          children: <Widget>[
            Padding(padding: EdgeInsets.symmetric(horizontal: 8)),
            GradientText("Description  Page",
                gradient: LinearGradient(
                  colors: [
                  Colors.deepPurpleAccent[200],
                  Colors.redAccent[200]
                ]),
                style: appbarStyle(),
                textAlign: TextAlign.center)
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(children: <Widget>[
          Padding(
              padding: EdgeInsets.symmetric(
            vertical: 8,
          )),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Align(
                  alignment: Alignment.center,
                  child: CircleAvatar(
                    radius: 90.0,
                    backgroundColor: Colors.deepPurpleAccent[200],
                    child: _image != null
                        ? ClipOval(
                            child: SizedBox(
                              height: 160,
                              width: 160,
                              child: Image.file(
                                _image,
                                fit: BoxFit.fill,
                              ),
                            ),
                          )
                        : ClipOval(
                            child: SizedBox(
                            width: 160,
                            height: 160,
                            child: Image(
                              image: AssetImage(
                                'assets/backgnd.jpg',
                              ),
                              fit: BoxFit.fill,
                            ),
                          )),
                  )),
              Padding(
                  padding: EdgeInsets.only(top: 60.0),
                  child: IconButton(
                    icon: Icon(
                      FontAwesomeIcons.camera,
                      size: 30.0,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      getImage();
                    },
                  )),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: EdgeInsets.all(9),
            child: TextFormField(
                onChanged: (val) {
                  //  name = val;
                },
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  hintText: "Problem *",
                  hintStyle: inputTextStyle(),
                  fillColor: Colors.blue,
                  enabledBorder: borderStyle(),
                  focusedBorder: borderStyle(),
                )),
          ),
          Padding(
            padding: EdgeInsets.all(9),
            child: TextFormField(
                onChanged: (val) {
                  //  name = val;
                },
                keyboardType: TextInputType.phone,
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  hintText: "Phone Number *",
                  hintStyle: inputTextStyle(),
                  fillColor: Colors.blue,
                  enabledBorder: borderStyle(),
                  focusedBorder: borderStyle(),
                )),
          ),
          Padding(
            padding: EdgeInsets.all(9),
            child: TextFormField(
                onChanged: (val) {
                  //  name = val;
                },
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  hintText: "Description *",
                  hintStyle: inputTextStyle(),
                  fillColor: Colors.blue,
                  enabledBorder: borderStyle(),
                  focusedBorder: borderStyle(),
                )),
          ),
          Padding(
            padding: EdgeInsets.all(9),
            child: TextFormField(
                onChanged: (val) {
                  //  name = val;
                },
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  hintText: "Address *",
                  hintStyle: inputTextStyle(),
                  fillColor: Colors.blue,
                  enabledBorder: borderStyle(),
                  focusedBorder: borderStyle(),
                )),
          ),
          SizedBox(height: 15),
          GestureDetector(
            onTap: () {
              _showDialog();
            },
            child: Container(
              width: 120,
              height: 45,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Colors.deepPurple,
                    Colors.redAccent[200],
                  ],
                ),
                
                borderRadius: BorderRadius.circular(18),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    offset: Offset(5, 5),
                    blurRadius: 10,
                  )
                ],
              ),
              child: Center(
                child: Text(
                  'Send',
                  style: appbarStyle(),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 15,
          ),
        ]),
      ),
    );
  }
}
