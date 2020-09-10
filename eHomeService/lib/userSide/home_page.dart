import 'package:eHomeService/chat/helper/authenticate.dart';
import 'package:eHomeService/chat/services/auth.dart';
import 'package:eHomeService/chat/services/crud.dart';
import 'package:eHomeService/chat/views/chat.dart';
import 'package:eHomeService/chat/views/signin.dart';
import 'package:eHomeService/chat/widget/widget.dart';
import 'package:eHomeService/userSide/usersTile.dart';
import 'package:flutter/material.dart';
import 'package:gradient_text/gradient_text.dart';
import 'package:eHomeService/userSide/widgets/widgets.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import 'activity/problemActivity.dart';
import 'description_page.dart';

class HomePage extends StatefulWidget {
  final String email;
  final String uid;

  const HomePage({Key key, this.email, this.uid}) : super(key: key);
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  String emailValue;
  String userId;

  @override
  void initState() {
    // crudMethods.getData().then((result) {
    //   setState(() {
    //     usersStream = result;
    //   });
    // });
    super.initState();
    emailValue = this.widget.email;
    userId = this.widget.uid;
    _tabController = new TabController(length: 2, vsync: this, initialIndex: 0);
  }

  TabController _tabController;

  //  void initState(){
  //   super.initState();
  //   // you can use this.widget.foo here
  //   emailValue = this.widget.email;
  //   userId = this.widget.uid;
  // }

//  CrudMethods crudMethods = new CrudMethods();
//   Stream usersStream;

  TextEditingController editingController = TextEditingController();

  AuthService auth = new AuthService();

// Widget UsersList() {
//     return SingleChildScrollView(
//       physics: ClampingScrollPhysics(),
//       child: Container(
//           child: usersStream != null
//               ? Column(children: <Widget>[
//                   StreamBuilder(
//                       stream: usersStream,
//                       builder: (context, snapshot) {
//                         if (!snapshot.hasData) {
//                           return CircularProgressIndicator();
//                         } else {
//                           return ListView.builder(
//                             physics: ClampingScrollPhysics(),
//                             shrinkWrap: true,
//                             padding: EdgeInsets.symmetric(horizontal: 16),
//                             itemCount: snapshot.data.documents.length,
//                             itemBuilder: (context, index) {
//                               return UsersTile(
//                                 imgUrl: snapshot
//                                     .data.documents[index].data['ImageUrl'],
//                                 problem:
//                                     snapshot.data.documents[index].data['Problem'],
//                                 description: snapshot
//                                     .data.documents[index].data['Description'],
//                                 mobileno: snapshot
//                                     .data.documents[index].data['Phone Number'],
//                               );
//                             },
//                           );
//                         }
//                       })
//                 ])
//               : Container(
//                   alignment: Alignment.center,
//                   child: CircularProgressIndicator(),
//                 )),
//     );
//   }

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
            indicatorColor: Colors.white,
            tabs: <Widget>[
              new Tab(text: "Problem"),
              new Tab(text: "Chat"),
              // new Tab(text:"Bank"),
            ]),
      ),
      body: new TabBarView(
        controller: _tabController,
        children: [
          new ProblemPost(emailId: emailValue),
          new DescriptionPage(
            email: emailValue,
          ),
        ],
      ),
    );
  }
}
