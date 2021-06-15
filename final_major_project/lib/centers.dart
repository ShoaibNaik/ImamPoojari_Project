import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'package:hive/hive.dart';

import 'BeforeLogin.dart';

class centersList extends StatefulWidget {
  @override
  _centersListState createState() => _centersListState();
}

class _centersListState extends State<centersList> {


  List users = [];
  bool isLoading = false;

  Box userDetails;
  var address;
  var Name;
  var type;
  var area;
  var indx;
  var ar;
  var ad;
  var t;
  var n;
  var fn;
  var ln;
  var m;

  final snackBar = SnackBar(
    content: Text('Team Ummeed will connect you shortly'),
  );

  final snackBar1 = SnackBar(
    content: Text('Yay! A SnackBar!'),
  );

  fetchUser() async {
    setState(() {
      isLoading = true;
    });
    var url = "http://www.imampoojari.educationhost.cloud/hospital.php/";
    var response = await http.post(Uri.parse(url),
    body: {
      "area" : ar,
    });
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

  Future reg() async{
    var url = "http://www.imampoojari.educationhost.cloud/userRequest.php/";
    var response = await http.post(Uri.parse(url),
        body: {
          "firstName" : fn,
          "lastName" : ln,
          "mobileNo" : m,
          "type" : t,
          "center_name" : n,
          "address" : ad,
          "area" : ar,
        });

    if(response.statusCode == 200){
      return ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }else{
      return ScaffoldMessenger.of(context).showSnackBar(snackBar1);
    }
  }



  void initState() {
    // TODO: implement initState
    super.initState();
    userDetails = Hive.box("loginData");
    ar = userDetails.get('area');
    fn = userDetails.get('first_name');
    ln = userDetails.get('last_name');
    m = userDetails.get('mobile');
    this.fetchUser();

  }

  @override
  Widget build(BuildContext context) {


    return Scaffold(
      backgroundColor: Color(0xFFE5E8EC),
      appBar: AppBar(
        backgroundColor: Color(0xFF35BB9B),
        title: Text("Hospital"),
        centerTitle: true,
        actions: [
          InkWell(
              onTap: (){
                userDetails.delete('first_name');
                userDetails.delete('lastName');
                userDetails.delete('email');
                userDetails.delete('mobile');
                userDetails.delete('area');
                setState(() {
                  Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => BeforeLogin()));
                });
              },
              child: Icon(Icons.logout))
        ],
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
                child: Text('Submit'),
                onPressed: () {
                  indx = item['id'];
                  n = item['name'];
                  t = item['type'];
                  ad = item['address'];
                  print(indx);
                  print(n);
                  print(t);
                  print(ad);
                  setState(() {
                    reg();
                  });
                }
              )
            ],
          ),
        ],
      ),
    );


  }


}


//   final snackBar = SnackBar(
//     content: Text('Team Ummeed will connect you shortly'),
//   );
//   ScaffoldMessenger.of(context).showSnackBar(snackBar);
// },
// child: Text('Submit',style: TextStyle(fontSize: 16),),



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
