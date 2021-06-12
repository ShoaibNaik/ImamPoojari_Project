import 'dart:convert';

import 'package:final_major_project/LangDropDown.dart';
import 'package:final_major_project/RegisterPage.dart';
import 'package:final_major_project/UserRegister.dart';
import 'package:final_major_project/nav.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;



class Login extends StatefulWidget {
  const Login({Key key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  int _pageState = 0;
  double _registerYoffset = 0;
  double _loginYOffset = 0;
  double _loginXoffset = 0;

  double windowWidth = 0;
  double windowHeight = 0;

  TextEditingController user = TextEditingController();
  TextEditingController otp = TextEditingController();

  var data;
  var need;

  Future login() async{
    var url = "http://imampoojari.educationhost.cloud/login.php";
    var response = await http.post(Uri.parse(url),
        body:{
        "userId" : user.text,
        });

    data = jsonDecode(response.body);

    if(data == "done"){
      print("Logged In");
    }else if(data == "error"){
      print("error");
    }
  }

  Future OTP() async{
    var url = "http://imampoojari.educationhost.cloud/otp.php";
    var response = await http.post(Uri.parse(url),
        body:{
          "userId" : user.text,
          "otp" : otp.text,
        });

    data = jsonDecode(response.body);

    if(data == "user done"){
      Navigator.of(context).push(MaterialPageRoute(builder: (context) => navBar()));
    }else if(data == "user error"){
      Navigator.of(context).push(MaterialPageRoute(builder: (context) => UserRegister()));
    }
  }

  @override
  Widget build(BuildContext context) {
    windowHeight = MediaQuery.of(context).size.height;
    windowWidth = MediaQuery.of(context).size.width;

    switch (_pageState) {
      case 0:
        _loginYOffset = windowHeight;
        _registerYoffset = windowHeight;
        _loginXoffset = 0;

        break;
      case 1:
        _loginYOffset = 270;
        _registerYoffset = windowHeight;
        _loginXoffset = 0;

        break;
      case 2:
        _loginYOffset = 240;
        _registerYoffset = 270;
        _loginXoffset = 20;
    }

    return Scaffold(
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
                      child: Image.asset("assets/images/logoBlack.png")),
                  // Container(
                  //   padding: EdgeInsets.all(10),
                  //   margin: const EdgeInsets.only(top: 240),
                  //   child: Text(
                  //     "Choose Your Language",
                  //     style: TextStyle(fontSize: 24, color: Colors.black),
                  //   ),
                  // ),
                  // Container(
                  //   margin: const EdgeInsets.only(bottom: 150),
                  //   child: Center(
                  //     child: InkWell(
                  //       child: LangList(),
                  //     ),
                  //   ),
                  // ),
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
                            "Login",
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
              margin: EdgeInsets.only(top: 10),
              padding: EdgeInsets.all(20),
              curve: Curves.fastLinearToSlowEaseIn,
              duration: Duration(milliseconds: 500),
              transform:
                  Matrix4.translationValues(_loginXoffset, _loginYOffset, 1),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius:
                      BorderRadius.only(topLeft: Radius.circular(35))),
              child: Center(
                child: Column(
                  children: [
                    SizedBox(height: 10),
                    Row(
                      children: [
                        InkWell(
                          onTap: (){
                            setState(() {
                              _pageState = 0;
                            });
                          },
                            child: Icon(Icons.arrow_back_ios_outlined, size: 22,)),
                        SizedBox(width: 110),
                        Text(
                          "LOGIN",
                          style: TextStyle(fontSize: 32, color: Colors.black),
                        ),
                      ],
                    ),
                    SizedBox(height: 40),
                    TextFormField(
                      controller: user,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        labelText: 'Enter User ID',
                        border: OutlineInputBorder(),
                      ),
                    ),
                    SizedBox(height: 40),
                    InkWell(
                      onTap: (){
                        setState(() {
                          login();
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
                              'Send OTP',
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
              child: Center(
                child: Column(
                  children: [
                    SizedBox(height: 10),
                    Row(
                      children: [
                        InkWell(
                          onTap: (){
                            setState(() {
                              _pageState =1;
                            });
                          },
                            child: Icon(Icons.arrow_back_ios_rounded, size: 22,)),
                        SizedBox(width: 90,),
                        Text(
                          "OTP sent",
                          style: TextStyle(fontSize: 28, color: Colors.black),
                        ),
                      ],
                    ),
                    SizedBox(height: 60),
                    TextFormField(
                      maxLength: 6,
                      controller: otp,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        labelText: 'Enter OTP',
                        border: OutlineInputBorder(),
                      ),
                    ),
                    SizedBox(height: 40),
                    InkWell(
                      onTap: (){
                        setState(() {
                          OTP();
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
                              'Verify OTP',
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
          )
        ],
      ),
    );
  }
}
