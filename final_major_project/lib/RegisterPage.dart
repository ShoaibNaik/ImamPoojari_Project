import 'package:final_major_project/AreaDropDown.dart';
import 'package:final_major_project/DatePicker.dart';
import 'package:final_major_project/PostDropDown.dart';
import 'package:flutter_linear_datepicker/flutter_datepicker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  const Register({Key key}) : super(key: key);

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
        _registerYoffset = 210;
        _loginXoffset = 0;

        break;
      case 2:
        _loginYOffset = 240;
        _registerYoffset = 210;
        _loginXoffset = 20;
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
            child: GestureDetector(
              onTap: () {
                setState(() {
                  _pageState = 2;
                });
              },
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
                      SizedBox(height: 40),
                      TextFormField(
                        decoration: InputDecoration(
                          labelText: 'First Name',
                          border: OutlineInputBorder(),
                        ),
                      ),
                      SizedBox(height: 40),
                      TextFormField(
                        keyboardType: TextInputType.,
                        decoration: InputDecoration(
                          labelText: 'Last Name',
                          border: OutlineInputBorder(),
                        ),
                      ),
                      SizedBox(height: 40),
                      // InkWell(
                      //   child: DatePicker(),
                      // ),
                      SizedBox(height: 40),
                      TextFormField(
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          labelText: 'Email Address',
                          border: OutlineInputBorder(),
                        ),
                      ),
                      SizedBox(height: 40),
                      InkWell(
                        child: PostList(),
                      ),
                      SizedBox(height: 40),
                      OutlinedButton(
                        onPressed: () {},
                        child: Text(
                          "Next",
                          style: TextStyle(color: Colors.black,),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),

          Container(
            child: GestureDetector(
              onTap: () {
                setState(() {
                  _pageState = 1;
                });
              },
              child: AnimatedContainer(
                margin: EdgeInsets.only(top: 10),
                padding: EdgeInsets.all(20),
                curve: Curves.fastLinearToSlowEaseIn,
                duration: Duration(milliseconds: 500),
                transform:
                Matrix4.translationValues(0, _loginYOffset, 1),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius:
                    BorderRadius.only(topLeft: Radius.circular(35))
                ),
                child: Center(
                  child: Column(
                    children: [
                      SizedBox(height: 40),
                      TextFormField(
                        decoration: InputDecoration(
                          labelText: 'Holy Place Name',
                          border: OutlineInputBorder(),
                        ),
                      ),
                      SizedBox(height: 40),
                      TextFormField(
                        decoration: InputDecoration(
                          labelText: 'Holy Place Address',
                          border: OutlineInputBorder(),
                        ),
                      ),
                      SizedBox(height: 40),
                      InkWell(
                        child: Area(),
                      ),
                      SizedBox(height: 60),
                      OutlinedButton(
                        onPressed: () {},
                        child: Text(
                          "Register",
                          style: TextStyle(color: Colors.black,),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

