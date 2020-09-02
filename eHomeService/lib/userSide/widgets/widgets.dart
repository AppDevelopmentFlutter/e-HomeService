import 'package:flutter/material.dart';

TextStyle navbarStyle() {
  return TextStyle(
      color: Colors.white, fontSize: 29, fontFamily: "GentiumBasic");
}

TextStyle simpleStyle() {
  return TextStyle(
      color: Colors.black, fontSize: 17, fontFamily: "GentiumBasic");
}
TextStyle simpleStyleWhite() {
  return TextStyle(
      color: Colors.white, fontSize: 17, fontFamily: "GentiumBasic");
}
TextStyle appbarStyle() {
  return TextStyle(
      color: Colors.white, fontSize: 28, fontFamily: "GentiumBasic");
}

TextStyle pageStyle() {
  return TextStyle(
      color: Colors.white, fontSize: 20, fontFamily: "GentiumBasic");
}

TextStyle inputTextStyle() {
  return TextStyle(
      color: Colors.white70, fontSize: 20, fontFamily: "GentiumBasic");
}

OutlineInputBorder borderStyle() {
  return OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(10.0)),
    borderSide: BorderSide(color: Colors.deepPurpleAccent[200]),
  );
}

UnderlineInputBorder borderStyleAuthentication() {
  return UnderlineInputBorder(
    // borderRadius: BorderRadius.all(Radius.circular(10.0)),
    borderSide: BorderSide(color: Colors.deepPurpleAccent[200]),
  );
}
