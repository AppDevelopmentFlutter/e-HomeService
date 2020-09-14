import 'dart:core';
import 'dart:io';
import 'package:eHomeService/chat/services/crud.dart';
import 'package:eHomeService/userSide/home_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gradient_text/gradient_text.dart';
import 'package:image_picker/image_picker.dart';
import 'package:eHomeService/userSide/widgets/widgets.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';
import 'package:random_string/random_string.dart';

class DescriptionPage extends StatefulWidget {
final String email;


  const DescriptionPage({Key key, this.email}) : super(key: key);
  
  @override
  _DescriptionPageState createState() => _DescriptionPageState();
}

class _DescriptionPageState extends State<DescriptionPage> {
  String emailValue;
  void initState(){
    super.initState();
    // you can use this.widget.foo here
    emailValue = this.widget.email;

  }
  TextEditingController _textFieldController =TextEditingController();
  CrudMethods crudMethods = new CrudMethods();


  var timekey = new DateTime.now();
  File _image;
  String _url;
  String _problem;
  String _description;
  var _phoneNumber;
  String _address;
  bool _isLoading = false;

  final formKey = new GlobalKey<FormState>();
  final picker = ImagePicker();
  Future getImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);

    setState(() {
      _image = File(pickedFile.path);
    });
  }

  uploadStatus() async {
    print("Its uploaded");
    if (_image != null  && _image.existsSync()){
      setState(() {
        _isLoading = true;
      });
      StorageReference postImageRef = FirebaseStorage.instance
          .ref()
          .child("Post Image")
          .child("${randomAlphaNumeric(9)}.jpg");
    final StorageUploadTask task = postImageRef.putFile(_image);
      var downloadurl = await (await task.onComplete).ref.getDownloadURL();
      print("************************");
      print("This is url $downloadurl");
      print("this is the url of image");
      print("-------------------------------");
      Map<String, dynamic> problemDetails = {
        "Time": timekey,
        "Problem": _problem,
        "Description":_description,
        "ImageUrl":  downloadurl,
        "Address": _address,
        "Phone Number": _phoneNumber,
        "Email":emailValue,
      };
      print("crude operation");
      crudMethods.Upload(problemDetails,emailValue, timekey.toString() ).then((result) {
        print("********operation is done*****");
        Scaffold.of(context).showSnackBar(SnackBar(content: Text('Saved in Database')));
        print("after the snackbar");
      });
    } else {}
  }



  String formatTimeOfDay(TimeOfDay tod) {
    final now = new DateTime.now();
    final dt = DateTime(now.year, now.month, now.day, tod.hour, tod.minute);
    final format = DateFormat.jm();
    return format.format(dt);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: formKey,
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
            SizedBox(
            height: 20,
          ),
            Padding(
              padding: EdgeInsets.all(9),
              child: TextFormField(
                    onSaved: (value){
                      return _problem=value;
                    },
                    validator:(val){
                    return  _problem = val;
                    },
                    onChanged: (value){
                    return  _problem=value;

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
                 maxLength: 10,
                onSaved: (value){
                      return _phoneNumber=value;
                    },
                    onChanged: (value){
                    return  _phoneNumber=value;
                    },
                    validator: (value){
                    return  _phoneNumber=value;
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
              //maxLength: 20,
                onSaved: (value){
                      return _description=value;
                    },
                    onChanged: (value){
                      return _description=value;

                    },
                    validator: (value){
                      return _description=value;
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
                onSaved: (value){
                      return _address=value;
                    },
                    onChanged: (value){
                      return _address=value;

                    },
                    validator: (value){
                      return _address=value;

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
             // _showDialog();
             uploadStatus();
              //  Navigator.push(context,
              //           MaterialPageRoute(builder: (context) => ProblemPost(email: emailValue)));
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
      ),
    );
  }
}