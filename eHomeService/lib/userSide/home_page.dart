import 'package:eHomeService/chat/helper/authenticate.dart';
import 'package:eHomeService/chat/services/auth.dart';
import 'package:eHomeService/chat/services/crud.dart';
import 'package:eHomeService/chat/views/chat.dart';
import 'package:eHomeService/chat/views/signin.dart';
import 'package:eHomeService/chat/widget/widget.dart';
import 'package:eHomeService/userSide/activity/problempost.dart';
import 'package:eHomeService/userSide/usersTile.dart';
import 'package:flutter/material.dart';
import 'package:gradient_text/gradient_text.dart';
import 'package:eHomeService/userSide/widgets/widgets.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'description_page.dart';

class HomePage extends StatefulWidget {
  final String email;
  //final String username;

  const HomePage({Key key, this.email}) : super(key: key);
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  String emailValue;
 // String userName;


   void initState(){
    super.initState();
    
    emailValue = this.widget.email;
    //userName= this.widget.username;
    _tabController = new TabController(length: 2, vsync: this, initialIndex: 0);
    print("This is my email:"+emailValue);
    
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
          children: <Widget>[
            GradientText("E-HomeServices",
                gradient: LinearGradient(colors: [
                  Colors.deepPurpleAccent[200],
                  Colors.redAccent[200]
                ]),
                style: TextStyle(fontSize: 22, fontFamily: "GentiumBasic"),
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
            new Tab(child: Container(
                    child: Text("Problem",
                        style: TextStyle(
                            color: Colors.grey[200],
                            fontWeight: FontWeight.w500,
                            fontSize: 19)),
                  ),),
            new Tab(child: Container(
                    child: Text("Description",
                        style: TextStyle(
                            color: Colors.grey[200],
                            fontWeight: FontWeight.w500,
                            fontSize: 19)),
                  ),),
            // new Tab(text:"Bank"),
          ]
        ),
      ),
      body: new TabBarView(
        controller: _tabController,
        children: [
          new ProblemPost(emailId: emailValue),
          new DescriptionPage(email: emailValue,),
        ],
      ),
    );
  }
}
