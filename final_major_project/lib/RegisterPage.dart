import 'package:final_major_project/nav.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:dropdown_below/dropdown_below.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';


class Register extends StatefulWidget {
  final user;
  const Register({Key key, this.user}) : super(key: key);

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  int _pageState = 0;
  double _registerYoffset = 0;
  double _loginYOffset = 0;
  double _loginXoffset = 0;

  double windowWidth = 0;
  double windowHeight = 0;

  TextEditingController name = TextEditingController();
  TextEditingController place = TextEditingController();
  TextEditingController fName = TextEditingController();
  TextEditingController lName = TextEditingController();
  TextEditingController dob = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController userId = TextEditingController();

  Future reg() async{
    var url ="http://imampoojari.educationhost.cloud/userReg.php";
    var response = await http.post(Uri.parse(url),body:{
      "userId" : userId.text,
      "firstName" : fName.text,
      "lastName" : lName.text,
      "email" : email.text,
      "dob" : dob.text,
      "profession" : _selectedPost,
      "place" : name.text,
      "address" : place.text,
      "area" : _selectedArea
    });
    var data = jsonDecode(response.body);
    if(data == 200){
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => navBar()));
    }else{
      print("error");
    }

  }

  List area = ["Kaif", "Bhalu"];

  List _area = [
    {'no': 1, 'keyword': 'Amrut Nagar'},
    {'no': 2, 'keyword': 'Kausa'},
    {'no': 3, 'keyword': 'Tanwar Nagar'},
    {'no': 4, 'keyword': 'Shimla Park'},
    {'no': 5, 'keyword': 'Devripada'}
  ];

  List _postList = [
    {'no': 1, 'keyword': 'Imam'},
    {'no': 2, 'keyword': 'Maulana'},
    {'no': 3, 'keyword': 'Poojari'},
    {'no': 4, 'keyword': 'Pandit'},
  ];

  List<DropdownMenuItem> _dropdownLangItems;
  var _selectedArea;

  List<DropdownMenuItem> _dropdownPostItems;
  var _selectedPost;

  @override
  void initState() {
    _dropdownLangItems = buildDropdownLangItems(_area);
    _dropdownPostItems = buildDropdownPostItems(_postList);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    windowHeight = MediaQuery.of(context).size.height;
    windowWidth = MediaQuery.of(context).size.width;

    switch (_pageState) {
      case 0:
        _loginYOffset = windowHeight;
        _registerYoffset = 210;
        _loginXoffset = 0;

        break;
      case 1:
        _loginYOffset = 270;
        _registerYoffset = 220;
        _loginXoffset = 0;

        break;
      case 2:
        _loginYOffset = 240;
        _registerYoffset = 210;
        _loginXoffset = 0;
    }

    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Stack(
        children: <Widget>[
          Container(
            color: Color(0xFFE5E8EC),
            child: Container(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 32),
                    margin: const EdgeInsets.only(top: 100),
                    child: Center(
                      child: Text(
                        "Register",
                        style: TextStyle(
                          fontSize: 40,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          if (_pageState != 0) {
                            _pageState = 0;
                          } else {
                            _pageState = 1;
                          }
                        });
                      },
                      child: Center(
                        child: Container(
                          margin: EdgeInsets.all(32),
                          padding: EdgeInsets.all(20),
                          width: double.infinity,
                          decoration: BoxDecoration(
                              color: Color(0xFF35bb9b),
                              borderRadius: BorderRadius.circular(50)),
                          child: Center(
                              child: Text(
                            "Register",
                            style: TextStyle(color: Colors.black, fontSize: 23),
                          )),
                        ),
                      ),
                    ),
                  ),
                ])),
          ),
          Container(
            child: AnimatedContainer(
              padding: EdgeInsets.all(32),
              curve: Curves.fastLinearToSlowEaseIn,
              duration: Duration(milliseconds: 1000),
              transform: Matrix4.translationValues(0, _registerYoffset, 1),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius:
                      BorderRadius.only(topLeft: Radius.circular(35))),
              child: Container(
                margin: EdgeInsets.only(top: 15),
                child: ListView(
                  shrinkWrap: true,
                  reverse: true,
                  children: [
                    TextFormField(
                      controller: fName,
                      initialValue: widget.user.text,
                      decoration: InputDecoration(
                        labelText: 'First Name',
                        border: OutlineInputBorder(),
                      ),
                    ),
                    SizedBox(height: 40),
                    TextFormField(
                      controller: lName,
                      keyboardType: TextInputType.name,
                      decoration: InputDecoration(
                        labelText: 'Last Name',
                        border: OutlineInputBorder(),
                      ),
                    ),
                    SizedBox(height: 40),
                    TextFormField(
                      controller: dob,
                      keyboardType: TextInputType.name,
                      decoration: InputDecoration(
                        labelText: 'Date of Birth',
                        border: OutlineInputBorder(),
                      ),
                    ),
                    // InkWell(
                    //   child: DatePicker(),
                    // ),
                    SizedBox(height: 40),
                    TextFormField(
                      controller: email,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        labelText: 'Email Address',
                        border: OutlineInputBorder(),
                      ),
                    ),
                    SizedBox(height: 40),
                    InkWell(
                      child: Post(),
                    ),
                    SizedBox(height: 40),
                    InkWell(
                      onTap: (){
                        setState(() {
                          _pageState = 2;
                        });
                      },
                      child: Container(
                        height: 50,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Color(0xFF35BB9B),
                        ),
                        padding: EdgeInsets.all(10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Next',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                              ),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ].reversed.toList(),
                ),
              ),
            ),
          ),
          Container(
            child: AnimatedContainer(
              margin: EdgeInsets.only(top: 0),
              padding: EdgeInsets.only(left: 20,right: 20,top: 10,bottom: 10),
              curve: Curves.fastLinearToSlowEaseIn,
              duration: Duration(milliseconds: 500),
              transform: Matrix4.translationValues(0, _loginYOffset, 1),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius:
                      BorderRadius.only(topLeft: Radius.circular(35))),
              child: Center(
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        InkWell(
                            onTap: (){
                              setState(() {
                                _pageState = 1;
                              });
                            },
                            child: Icon(Icons.arrow_back_ios_rounded, size: 22,))
                      ],
                    ),
                    TextFormField(
                      controller: userId,
                      decoration: InputDecoration(
                        labelText: 'userId',
                        border: OutlineInputBorder(),
                      ),
                    ),
                    SizedBox(height: 40,),
                    TextFormField(
                      controller: name,
                      decoration: InputDecoration(
                        labelText: 'Holy Place Name',
                        border: OutlineInputBorder(),
                      ),
                    ),
                    SizedBox(height: 40),
                    TextFormField(
                      controller: place,
                      decoration: InputDecoration(
                        labelText: 'Holy Place Address',
                        border: OutlineInputBorder(),
                      ),
                    ),
                    SizedBox(height: 40),
                    InkWell(
                      child: AreaList(),
                    ),
                    SizedBox(height: 60),
                    InkWell(
                      onTap: (){
                        setState(() {
                          reg();
                        });
                      },
                      child: Container(
                        height: 50,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Color(0xFF35BB9B),
                        ),
                        padding: EdgeInsets.all(10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Register',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                              ),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  List<DropdownMenuItem> buildDropdownLangItems(List _area) {
    List<DropdownMenuItem> items = List();
    for (var i in _area) {
      items.add(
        DropdownMenuItem(
          value: i,
          child: Text(i['keyword']),
        ),
      );
    }
    return items;
  }

  List<DropdownMenuItem> buildDropdownPostItems(List _postList) {
    List<DropdownMenuItem> items = List();
    for (var i in _postList) {
      items.add(
        DropdownMenuItem(
          value: i,
          child: Text(i['keyword']),
        ),
      );
    }
    return items;
  }

  onChangeDropdownLang(selectedLang) {
    print(selectedLang);
    setState(() {
      _selectedArea = selectedLang;
    });
  }

  Widget AreaList() {
    return Container(
      child: DropdownBelow(
        itemWidth: 350,
        itemTextstyle: TextStyle(
            fontSize: 14, fontWeight: FontWeight.w400, color: Colors.black),
        boxTextstyle: TextStyle(
            fontSize: 14, fontWeight: FontWeight.w400, color: Colors.black),
        boxPadding: EdgeInsets.fromLTRB(13, 12, 0, 12),
        boxWidth: 400,
        boxHeight: 60,
        //  hint: Text('choose item'),
        value: _selectedArea,
        items: _dropdownLangItems,
        onChanged: onChangeDropdownLang,
      ),
    );
  }

  onChangeDropdownPosts(selectedPost) {
    print(selectedPost);
    setState(() {
      _selectedPost = selectedPost;
    });
  }

  Widget Post() {
    return Container(
      child: DropdownBelow(
        itemWidth: 350,
        itemTextstyle: TextStyle(
            fontSize: 14, fontWeight: FontWeight.w400, color: Colors.black),
        boxTextstyle: TextStyle(
            fontSize: 14, fontWeight: FontWeight.w400, color: Colors.black),
        boxPadding: EdgeInsets.fromLTRB(13, 12, 0, 12),
        boxWidth: 400,
        boxHeight: 60,
        //  hint: Text('choose item'),
        value: _selectedPost,
        items: _dropdownPostItems,
        onChanged: onChangeDropdownPosts,
      ),
    );
  }
}
