import 'package:eHomeService/chat/helper/authenticate.dart';
import 'package:eHomeService/chat/helper/constants.dart';
import 'package:eHomeService/chat/helper/helperfunctions.dart';
import 'package:eHomeService/chat/helper/theme.dart';
import 'package:eHomeService/chat/services/auth.dart';
import 'package:eHomeService/chat/services/database.dart';
import 'package:eHomeService/chat/views/chat.dart';
import 'package:eHomeService/chat/views/search.dart';
import 'package:flutter/material.dart';
import 'package:gradient_widgets/gradient_widgets.dart';

class ChatRoomOwner extends StatefulWidget {
  @override
  _ChatRoomOwnerState createState() => _ChatRoomOwnerState();
}

class _ChatRoomOwnerState extends State<ChatRoomOwner> {
  Stream chatRooms;

  Widget chatRoomsList() {
    return StreamBuilder(
      stream: chatRooms,
      builder: (context, snapshot) {
        return snapshot.hasData
            ? ListView.builder(
                itemCount: snapshot.data.documents.length,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return ChatRoomsTile(
                    userName: snapshot.data.documents[index].data['chatRoomId']
                        .toString()
                        .replaceAll("_", "")
                        .replaceAll(Constants.myName, ""),
                    chatRoomId: snapshot.data.documents[index].data["chatRoomId"],
                  );
                })
            : Container();
      },
    );
  }

  @override
  void initState() {
    getUserInfogetChats();
    super.initState();
  }

  getUserInfogetChats() async {
    Constants.myName = await HelperFunctions.getUserNameSharedPreference();
    DatabaseMethods().getUserChats(Constants.myName).then((snapshots) {
      setState(() {
        chatRooms = snapshots;
        print(
            "we got the data + ${chatRooms.toString()} this is name  ${Constants.myName}");
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor:  Colors.black,
      //   title:  Row(
      //     children: <Widget>[
      //       GradientText("E-HomeServices",
      //           gradient: LinearGradient(colors: [
      //             Colors.deepPurpleAccent[200],
      //             Colors.redAccent[200]
      //           ]),
      //           style: TextStyle(fontSize: 22, fontFamily: "GentiumBasic"),
      //           textAlign: TextAlign.center)
      //     ],
      //  ),
      //   elevation: 0.0,
      //   centerTitle: false,
      //  ),
      body: Container(
        child: chatRoomsList(),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.deepPurpleAccent[200],
        child: Icon(Icons.search),
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => Search()));
        },
      ),
    );
  }
}

class ChatRoomsTile extends StatelessWidget {
  final String userName;
  final String chatRoomId;

  ChatRoomsTile({this.userName,@required this.chatRoomId});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(
          builder: (context) => Chat(
            chatRoomId: chatRoomId,
          )
        ));
      },
      child: Container(
        color: Colors.black26,
        padding: EdgeInsets.symmetric(horizontal: 24, vertical: 20),
        child: Row(
          children: [
             CircleAvatar(
                radius: 25,
                backgroundImage: AssetImage('assets/profilelogo.jpg'),
            ),
            SizedBox(
              width: 12,
            ),
            Text(userName,
                textAlign: TextAlign.start,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    letterSpacing: 0.5,
                    fontFamily: 'OverpassRegular',
                    fontWeight: FontWeight.w300))
          ],
        ),
      ),
    );
  }
}
