import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;

class clinicList extends StatefulWidget {
  @override
  _clinicListState createState() => _clinicListState();
}

class _clinicListState extends State<clinicList> {


  List users = [];
  bool isLoading = false;

  var address;
  var Name;
  var type;
  var area;
  var indx;
  var ar;
  var ad;
  var t;
  var n;

  fetchUser() async {
    setState(() {
      isLoading = true;
    });
    var url = "http://www.imampoojari.educationhost.cloud/clinic.php/";
    var response = await http.get(Uri.parse(url));
    // print(response.body);
    if (response.statusCode == 200) {
      var items = json.decode(response.body);
      setState(() {
        users = items;
        isLoading = false;
      });
    } else {
      users = [];
      isLoading = false;
    }
  }



  void initState() {
    // TODO: implement initState
    super.initState();
    this.fetchUser();
  }

  @override
  Widget build(BuildContext context) {


    return Scaffold(
      backgroundColor: Color(0xFFE5E8EC),
      appBar: AppBar(
        backgroundColor: Color(0xFF35BB9B),
        title: Text("Clinic"),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          Container(
            margin: EdgeInsets.only(top: 5, bottom: 5),
            child: Container(
              child: getBody(),
            ),
          ),
        ],
      ),
    );
  }


  Widget getBody() {
    if (users.contains(null) || users.length < 0 || isLoading) {
      return Center(
          child: CircularProgressIndicator(
            valueColor: new AlwaysStoppedAnimation<Color>(Colors.green),
          ));
    }
    return ListView.builder(
        itemCount: users.length,
        itemBuilder: (context, index) {
          return getCard(users[index]);
        });
  }




  Widget getCard(item) {
    Name = item['name'];
    type = item['type'];
    area = item['area'];
    address = item['address'];

    return Card(
      clipBehavior: Clip.antiAlias,
      child: Column(
        children: [
          ListTile(
            //leading: Icon(Icons.arrow_drop_down_circle),
            title: Text(Name,style: TextStyle(fontSize: 20),),
            subtitle: Text(
              area,
              style: TextStyle(color: Colors.black.withOpacity(0.6), fontSize: 18),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              address,
              style: TextStyle(color: Colors.black.withOpacity(0.6), fontSize: 16),
            ),
          ),
          ButtonBar(
            alignment: MainAxisAlignment.end,
            children: [
              ElevatedButton(
                onPressed: () {
                  // Respond to button press
                },
                child: Text('Submit',style: TextStyle(fontSize: 16),),
              )
            ],
          ),
        ],
      ),
    );


  }
}

// ListView.builder(
// itemCount: CentersList.length,
// itemBuilder: (context, index) {
// Centers centers = CentersList[index];
// return Card(
// shape: RoundedRectangleBorder(
// borderRadius: BorderRadius.circular(10.0)),
// child: InkWell(
// onTap: () {
// setState(() {
// if (_pageState != 0) {
// _pageState = 0;
// } else {
// _pageState = 1;
// }
// });
// },
// child: Column(
// children: [
// SizedBox(height: 40),
// Row(
// mainAxisAlignment: MainAxisAlignment.start,
// children: [
// SizedBox(width: 10),
// Text(centers.image),
// SizedBox(width: 15),
// Text(centers.name)
// ],
// ),
// SizedBox(height: 40),
// ],
// ),
// ),
// );
// })
