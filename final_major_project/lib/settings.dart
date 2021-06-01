import 'package:flutter/material.dart';


class SettingList extends StatefulWidget {
  @override
  _SettingListState createState() => _SettingListState();
}

class _SettingListState extends State<SettingList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Color(0xFF35BB9B),
        title: Text('Settings'),
        actions: [
          Icon(Icons.notifications_active_outlined),
        ],
        centerTitle: true,
      ),
      body: getListView(),
    );
  }

  Widget getListView(){
    var List = ListView(
      children: [
        ListTile(
          leading: Icon(Icons.account_circle_sharp),
          title: Text('Profile'),
        ),
        ListTile(
          leading: Icon(Icons.language),
          title: Text('Language'),
        ),
        ListTile(
          leading: Icon(Icons.notifications_active_outlined),
          title: Text('Notifications'),
        ),
      ],
    );
    return List;
  }
}

