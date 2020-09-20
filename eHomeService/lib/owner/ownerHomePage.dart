import 'package:eHomeService/chat/helper/authenticate.dart';
import 'package:eHomeService/chat/services/auth.dart';
import 'package:eHomeService/chat/views/OwnerChatRoom.dart';
import 'package:eHomeService/owner/OwnerNavbar.dart';
import 'package:eHomeService/owner/query/queryList.dart';
//import 'package:eHomeService/userSide/navbar.dart';
import 'package:flutter/material.dart';
import 'package:gradient_text/gradient_text.dart';

class OwnerHomePage extends StatefulWidget {
  @override
  _OwnerHomePageState createState() => _OwnerHomePageState();
}

class _OwnerHomePageState extends State<OwnerHomePage> with SingleTickerProviderStateMixin {


  @override

   void initState(){
    super.initState();
    _tabController = new TabController(length: 2, vsync: this, initialIndex: 0);
  }
  TabController _tabController;
  TextEditingController editingController = TextEditingController();
  AuthService auth = new AuthService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
        
          children: <Widget>[
            GradientText("E-HomeServices",
                gradient: LinearGradient(colors: [
                  Colors.deepPurpleAccent[200],
                  Colors.redAccent[200]
                ]),
                style: TextStyle(fontSize: 24, fontFamily: "GentiumBasic"),
                textAlign: TextAlign.center)
          ],
       ),
        actions: [
          GestureDetector(
              onTap: () {
                auth.signOut();
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => Authenticate()));
              },
              child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  child: Icon(Icons.exit_to_app)))
        ],
        bottom: new TabBar(
          controller: _tabController,
          indicatorColor: Colors.white ,
          tabs: <Widget>[
            new Tab( child: Container(
                    child: Text("Query",
                        style: TextStyle(
                            color: Colors.grey[200],
                            fontWeight: FontWeight.w500,
                            fontSize: 19)),
                  ),),
            new Tab(child: Container(
                    child: Text("Contacts",
                        style: TextStyle(
                            color: Colors.grey[200],
                            fontWeight: FontWeight.w500,
                            fontSize: 19)),
                  )),
            // new Tab(text:"Bank"),
          ]
        ),
      ),
       drawer: NavDrawer(), 
      body: new TabBarView(
        controller: _tabController,
        children: [
          Query(),
          ChatRoomOwner(),
        ],
      ),
    );
  }
}