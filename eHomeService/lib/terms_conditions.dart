import 'package:flutter/material.dart';

class Terms_Conditions extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 70,horizontal: 20),
              child: Text(
                "Terms and Conditions",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 35,
                    fontFamily: "GentiumBasic"),
              ),
            ),
            SizedBox(height:30),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal:25),
              child: Text("Post your problem here and our engineer will visit and estimate the cost and provide adequate solution.", style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontFamily: "GentiumBasic"),textAlign: TextAlign.center,),
            ),
            SizedBox(height:30),
            Padding(
              padding:const EdgeInsets.symmetric(vertical:150),
              child: Text("Conditions apply*", style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontFamily: "GentiumBasic"),textAlign: TextAlign.center,),
            ),
          ],
        ),
      ),
    );
  }
}
