import 'package:eHomeService/chat/helper/authenticate.dart';
import 'package:eHomeService/chat/services/auth.dart';
import 'package:eHomeService/owner/ownerProf.dart';
import 'package:eHomeService/terms_conditions.dart';
import 'package:eHomeService/userSide/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class SideBar extends StatefulWidget {
  @override
  _SideBarState createState() => _SideBarState();
}

class _SideBarState extends State<SideBar> {
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
          leading: Icon(Icons.phone),
          title: Text(
            'Contact Us',
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