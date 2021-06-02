import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;

class centersList extends StatefulWidget {
  @override
  _centersListState createState() => _centersListState();
}

class _centersListState extends State<centersList> {
  double windowHeight;
  double windowWidth;

  double xOffset = 0;
  double yOffset = 0;
  double _yOffset = 0;
  int _pageState = 0;

  List users = [];
  bool isLoading = false;
  List centers = [];

  var address;
  var Name;
  var type;
  var area;
  var indx;

  fetchUser() async {
    setState(() {
      isLoading = true;
    });
    var url = "http://www.imampoojari.educationhost.cloud/centers.php/";
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

  fetchdata() async {
    setState(() {
      isLoading = true;
    });
    var url = "http://www.imampoojari.educationhost.cloud/centerData.php/";
    var response = await http.post(Uri.parse(url),body: {
      "id" : indx,
    });
    // print(response.body);
    if (response.statusCode == 200) {
      var items = json.decode(response.body);
      setState(() {
        centers = items;
        isLoading = false;
      });
    } else {
      centers = [];
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
    windowHeight = MediaQuery.of(context).size.height;
    windowWidth = MediaQuery.of(context).size.width;

    switch (_pageState) {
      case 0:
        yOffset = windowHeight;
        _yOffset = windowHeight;
        xOffset = 0;

        break;

      case 1:
        yOffset = 350;
        _yOffset = windowHeight;
        xOffset = 0;
        break;
    }

    return Scaffold(
      backgroundColor: Color(0xFFE5E8EC),
      appBar: AppBar(
        backgroundColor: Color(0xFF35BB9B),
        title: Text("Center's List"),
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
          Container(
            child: AnimatedContainer(
              margin: EdgeInsets.only(top: 10),
              padding: EdgeInsets.all(20),
              curve: Curves.fastLinearToSlowEaseIn,
              duration: Duration(milliseconds: 500),
              transform: Matrix4.translationValues(xOffset, yOffset, 1),
              decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius:
                  BorderRadius.only(topLeft: Radius.circular(35))),
              child: getcon(),
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

  Widget getcon() {

    return ListView.builder(
        itemCount: centers.length,
        itemBuilder: (context, index) {
          return getC(centers[index]);
        });
  }

  Widget getC(item){
    Name = item['name'];
    type = item['type'];
    area = item['area'];
    address = item['address'];
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        children: [
          Row(
            children: [
              InkWell(
                onTap: () {
                  setState(() {
                    _pageState = 0;
                  });
                },
                child: Icon(
                  Icons.arrow_back_ios_rounded,
                  size: 20,
                  color: Colors.white,
                ),
              ),
              SizedBox(
                width: 110,
              ),
              Text(
                type,
                style: TextStyle(color: Colors.white, fontSize: 28),
              )
            ],
          ),
          SizedBox(
            height: 40,
          ),
          Row(
            children: [
              Text(
                'Location:',
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
              SizedBox(
                width: 15,
              ),
              Text(
                area,
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
            ],
          ),
          SizedBox(
            height: 40,
          ),
          Row(
            children: [
              Text(
                'Address:',
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
              SizedBox(
                width: 15,
              ),
              Expanded(
                child: Text(
                  address,
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 30,
          ),
          Container(
            height: 50,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white),
            padding: EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Visiting',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                  ),
                ),
                SizedBox(
                  width: 5,
                ),
                Icon(
                  Icons.arrow_forward_ios_rounded,
                  size: 18,
                  color: Colors.black,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }



  Widget getCard(item) {
    Name = item['name'];
    type = item['type'];
    area = item['area'];
    address = item['address'];


    return InkWell(
      onTap: () {
        setState(() {
          if (_pageState != 0) {
            _pageState = 0;
          } else {
            _pageState = 1;
            indx = item['id'];
            print(indx);
            fetchdata();
          }
        });
      },
      child: Card(
        elevation: 1.5,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: ListTile(
            title: Row(
              children: <Widget>[
                Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15),
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage("assets/images/medical.png"),),),
                ),
                SizedBox(
                  width: 20,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(
                        width: MediaQuery.of(context).size.width - 140,
                        child: Text(
                          Name,
                          style: TextStyle(fontSize: 17),
                        )),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      type,
                      style: TextStyle(color: Colors.grey),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
  Image img(t){
    if(t == 1){
      AssetImage("assets/images/medical.png");
    }else if(t == 2){
      AssetImage("assets/images/hospital.png");
    }else if(t == 3){
      AssetImage("assets/images/pharmacy.png");
    }
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
