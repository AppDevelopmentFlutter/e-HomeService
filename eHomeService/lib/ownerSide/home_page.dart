import 'package:eHomeService/chat/views/chatrooms.dart';
import 'package:eHomeService/chat/widget/widget.dart';
import 'package:eHomeService/ownerSide/activity/problemList.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin {
  TabController _tabController;
  void initState(){
    _tabController = new TabController(length: 2, vsync: this, initialIndex: 0);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarMain(context),
      body:  new TabBarView(
        controller: _tabController,
        children: [
          new ProblemList(),
          new ChatRoom(),
       ],
      ),

    );
  }
}