import 'package:eHomeService/chat/helper/authenticate.dart';
import 'package:eHomeService/chat/helper/helperfunctions.dart';
import 'package:eHomeService/chat/views/chatrooms.dart';
import 'package:eHomeService/chat/views/storage.dart';
import 'package:eHomeService/userSide/home_page.dart';
import 'package:eHomeService/userSide/splashscreen.dart';
import 'package:flutter/material.dart';
import 'chat/models/user.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  bool userIsLoggedIn;

  @override
  void initState() {
    print("babbxwxnmnfjvnds   "+Storage.email);
    getLoggedInState();
    super.initState();
    
  }

  getLoggedInState() async {
    await HelperFunctions.getUserLoggedInSharedPreference().then((value){
      setState(() {
        userIsLoggedIn  = value;
      });
    });
  }

String email;

  getEmailValue() async {
    await HelperFunctions.getUserLoggedInSharedPreference().then((value){
      setState(() {
      //  email = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FlutterChat',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Color(0xff145C9E),
        scaffoldBackgroundColor: Color(0xff1F1F1F),
        accentColor: Color(0xff007EF4),
        fontFamily: "OverpassRegular",
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: userIsLoggedIn != null ?  userIsLoggedIn ?Storage.email != null?  HomePage(
        
        email: Storage.email ,uid:'144'):Container(child:Text('$Storage.email')) : Authenticate()
          : Container(
        child: Center(
          child: Authenticate(),
        ),
      ),
    );
  }
}









