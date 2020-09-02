import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:eHomeService/userSide/home_page.dart';
import 'package:eHomeService/userSide/widgets/widgets.dart';

class NavDrawer extends StatelessWidget {
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
            'Contacts',
            style: simpleStyle(),
          ),
          onTap: () => {
           // Navigator.push(
           //     context, MaterialPageRoute(builder: (context) => Contacts()))
          },
        ),

        ListTile(
          leading: Icon(MdiIcons.logout),
          title: Text(
            'Logout',
            style: simpleStyle(),
          ),
          onTap:() => {
          //  Navigator.push(
           //     context, MaterialPageRoute(builder: (context) => About_Page()))
          },
        ),
        ListTile(
          leading: Icon(MdiIcons.logout),
          title: Text(
            'Admin Page',
            style: simpleStyle(),
          ),
          onTap:() => {
           Navigator.push(
               context, MaterialPageRoute(builder: (context) => HomePage()))
          },
        ),
      ]),
    );
  }
}
