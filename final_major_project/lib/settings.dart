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
        SizedBox(height: 15),
        ListTile(
          leading: Image.asset("assets/images/profile.png"),
          title: Text('Profile',
          style: TextStyle(fontSize: 20)),
        ),
        SizedBox(height: 15),
        ListTile(
          leading: Image.asset("assets/images/language.png"),
          title: Text('Language',
            style: TextStyle(fontSize: 20)),
        ),
        SizedBox(height: 15),
        ListTile(
          leading: Image.asset("assets/images/sign_out.png"),
          title: Text('Sign out',
            style: TextStyle(fontSize: 20)),
        ),
        SizedBox(height: 15),
        ListTile(
          leading: Image.asset("assets/images/info.png"),
          title: Text('Legal & About',
            style: TextStyle(fontSize: 20)),
        ),
      ],
    );
    return List;
  }
}

