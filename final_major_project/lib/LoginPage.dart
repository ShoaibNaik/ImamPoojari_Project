import 'package:final_major_project/LangDropDown.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
                  Container(
                    padding: EdgeInsets.all(10),
                    margin: const EdgeInsets.only(top: 240),
                    child: Text(
                      "Choose Your Language",
                      style: TextStyle(fontSize: 24,color: Colors.black),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(bottom: 150),
                    child: Center(
                      child: InkWell(
                        child: LangList(),
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
            child: GestureDetector(
              onTap: () {
                setState(() {
                  _pageState = 2;
                });
              },
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
                        BorderRadius.only(topLeft: Radius.circular(35))
                ),
                child: Center(
                  child: Column(
                    children: [
                      SizedBox(height: 10),
                      Row(
                        children: [
                          Icon(Icons.chevron_left),
                          SizedBox(width: 110),
                          Text(
                            "LOGIN",
                            style: TextStyle(fontSize: 32, color: Colors.black),
                          ),
                        ],
                      ),
                      SizedBox(height: 40),
                      TextFormField(
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          labelText: 'Enter Registered Mobile No',
                          errorText: 'Number must be 10 digits',
                          border: OutlineInputBorder(),
                          suffixIcon: Icon(
                            Icons.error,
                          ),
                        ),
                      ),
                      SizedBox(height: 60),
                      OutlinedButton(
                        onPressed: () {},
                        child: Text(
                          "Get OTP",
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
                      Text(
                        "OTP sent",
                        style: TextStyle(fontSize: 28, color: Colors.black),
                      ),
                      SizedBox(height: 40),
                      TextFormField(
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          labelText: 'Enter OTP',
                          errorText: 'Enter valid OTP',
                          border: OutlineInputBorder(),
                          suffixIcon: Icon(
                            Icons.error,
                          ),
                        ),
                      ),
                      SizedBox(height: 60),
                      OutlinedButton(
                        onPressed: () {},
                        child: Text(
                          "Verify OTP",
                          style: TextStyle(color: Colors.black,),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
