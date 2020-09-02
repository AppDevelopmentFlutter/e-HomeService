import 'package:eHomeService/userSide/home_page.dart';
import 'package:eHomeService/userSide/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:eHomeService/bloc_navigator/navigator_bloc.dart';

class LoginPage extends StatefulWidget with NavigationStates {
  LoginPage({Key key}) : super(key : key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final GlobalKey<FormState> _loginFormKey = GlobalKey<FormState>();
  TextEditingController emailInputController;
  TextEditingController pwdInputController;

  @override
  void initState() {
    // TODO: implement initState
    emailInputController = new TextEditingController();
    pwdInputController = new TextEditingController();
    super.initState();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body:SingleChildScrollView(
        child:Padding(
          padding: EdgeInsets.only(top: 300.0, left: 10.0, right: 10.0) ,
          child: Card(
            color: Colors.white.withOpacity(0.2),
            child: Form(
              key: _loginFormKey,
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(bottom: 9.0, top:40.0,right:9.0, left: 9.0),
                    child: TextFormField(
                      decoration: InputDecoration(
                        icon: Icon(Icons.email,
                        color: Colors.deepPurpleAccent[200]
                        ),
                        hintText: "email *",
                        hintStyle: inputTextStyle(),
                        fillColor: Colors.deepPurpleAccent[200],
                        enabledBorder: borderStyleAuthentication(),
                        focusedBorder: borderStyleAuthentication(),
                      ),
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  
                  Padding(
                    padding: EdgeInsets.all(9),
                    child: TextFormField(
                      decoration: InputDecoration(
                        icon: Icon(Icons.lock,
                          color: Colors.deepPurpleAccent[200]
                        ),
                        hintText: "Password *",
                        hintStyle: inputTextStyle(),
                        fillColor: Colors.deepPurpleAccent[200],
                        enabledBorder: borderStyleAuthentication(),
                        focusedBorder: borderStyleAuthentication(),
                      ),
                      style: TextStyle(color: Colors.white),
                    ),
                  ),

                  SizedBox(
                    height: 15.0,
                  ),

                  GestureDetector(
                    onTap: (){
                     Navigator.pushReplacement(
                       context,
                        MaterialPageRoute(builder: (context) => Container())
                      );
                    },
                    child:Container(
                      width: 200,
                      height: 45,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                            colors: [
                              Colors.deepPurple,
                              Colors.redAccent[200],
                            ],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            ),
                          borderRadius: BorderRadius.circular(18),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black12,
                              offset: Offset(5, 5),
                              blurRadius: 10,
                            ),
                        ],
                      ),
                      child: Center(
                        child: Text(
                         'Login',
                          style: appbarStyle(),
                        ),
                      ),
                    ),
                  ),

                  SizedBox(
                    height: 15.0,
                  ),
                  Text("Don't have an account yet?",
                  style: simpleStyleWhite() ,
                  ),

                  FlatButton(
                    child: Text("Register here!",
                    style: pageStyle(),
                    ),
                    onPressed: () {
                      Navigator.pushNamed(context, "/register");
                    },
                  ),

                  SizedBox(
                    height: 25.0,
                  ),
                ],
              ),
            )
          ),
        )
      )

    );
  }
}