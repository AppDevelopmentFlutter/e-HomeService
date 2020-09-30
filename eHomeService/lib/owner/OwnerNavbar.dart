import 'package:eHomeService/chat/helper/authenticate.dart';
import 'package:eHomeService/chat/services/auth.dart';
import 'package:eHomeService/chat/views/signup.dart';
import 'package:eHomeService/owner/ownerHomePage.dart';
import 'package:eHomeService/owner/ownerProf.dart';
import 'package:eHomeService/owner/query/queryList.dart';
import 'package:eHomeService/terms_conditions.dart';
import 'package:eHomeService/userSide/home_page.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
//import 'package:eHomeService/userSide/home_page.dart';
import 'package:eHomeService/userSide/widgets/widgets.dart';
//import 'package:eHomeService/owner/OwnerHomePage.dart';

class NavDrawer extends StatefulWidget {
  @override
  _NavDrawerState createState() => _NavDrawerState();
}

class _NavDrawerState extends State<NavDrawer> {

  AuthService auth = new AuthService();

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero, children: <Widget>[
        DrawerHeader(
          padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
          child: Text(
            "Welcome,",
            style: navbarStyle(),
          ),
          decoration: BoxDecoration(
              color: Colors.deepPurpleAccent[200],
              image: DecorationImage(
                  fit: BoxFit.fill,
                  image: AssetImage('assets/background.jpg')
                  )
                ),
        ),
       
        ListTile(
          leading: Icon(Icons.account_box),
          title: Text(
            'Profile',
            style: simpleStyle(),
          ),
          onTap: () => {
           Navigator.push(
               context, MaterialPageRoute(builder: (context) => OwnerProfile()))
          },
        ),
        
         ListTile(
          leading: Icon(MdiIcons.fileDocumentEdit),
          title: Text(
            'Terms  &  Conditions',
            style: simpleStyle(),
          ),
          onTap:() => {
           Navigator.push(
               context, MaterialPageRoute(builder: (context) => Terms_Conditions()))
          },
        ),
        
        ListTile(
          leading: Icon(MdiIcons.thumbUp),
          title: Text(
            'Accepted query',
            style: simpleStyle(),
          ),
          onTap:() => {
          //  Navigator.push(
           //     context, MaterialPageRoute(builder: (context) => About_Page()))
          },
        ),
        // ListTile(
        //   leading: Icon(MdiIcons.cloudQuestion),
        //   title: Text(
        //     'Query',
        //     style: simpleStyle(),
        //   ),
        //   onTap:() => {
        //    Navigator.push(
        //        context, MaterialPageRoute(builder: (context) => ),)
        //   },
        // ),
         ListTile(
          leading: Icon(MdiIcons.logout),
          title: Text(
            'Logout',
            style: simpleStyle(),
          ),
          onTap:() => {
          auth.signOut(),
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => Authenticate())),
          },
        ),
      ]),
    );
  }
}