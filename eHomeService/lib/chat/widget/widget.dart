import 'package:flutter/material.dart';
import 'package:gradient_widgets/gradient_widgets.dart';

Widget appBarMain(BuildContext context) {
  return AppBar(
    backgroundColor: Colors.black,
    title: GradientText(
      'eHomeService',
      gradient: gradientColors(),
      style: TextStyle(
        fontSize: 22,
        fontFamily: "GentiumBasic"
      ),
    ),
    elevation: 0.0,
    centerTitle: false,
  );
}

InputDecoration textFieldInputDecoration(String hintText) {
  return InputDecoration(
      hintText: hintText,
      hintStyle: TextStyle(color: Colors.white54),
      focusedBorder:
          UnderlineInputBorder(borderSide: BorderSide(color: Colors.white)),
      enabledBorder:
          UnderlineInputBorder(borderSide: BorderSide(color: Colors.white)));
}

TextStyle simpleTextStyle() {
  return TextStyle(color: Colors.white, fontSize: 16);
}

TextStyle biggerTextStyle() {
  return TextStyle(color: Colors.white, fontSize: 17);
}

LinearGradient gradientColors(){
  return LinearGradient(
                  colors: [Colors.deepPurpleAccent[200],
                        Colors.redAccent[200]]);
}
