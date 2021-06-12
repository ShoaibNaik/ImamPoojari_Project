import 'package:final_major_project/clinicPage.dart';
import 'package:final_major_project/diagnosticPage.dart';
import 'package:final_major_project/hospitalPage.dart';
import 'package:final_major_project/medicalPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class subList extends StatefulWidget {
  const subList({Key key}) : super(key: key);

  @override
  _subListState createState() => _subListState();
}

class _subListState extends State<subList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            color: Color(0xFFE5E8EC),
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Container(
                      padding: EdgeInsets.symmetric(horizontal: 32),
                      margin: const EdgeInsets.only(top: 100),
                      child: Image.asset("assets/images/logoBlack.png")),

                  Column(
                    children: [
                      InkWell(
                        onTap: (){
                          setState(() {
                            Navigator.of(context).push(MaterialPageRoute(builder: (context) => medicalPage()));
                          });
                        },
                        child: Container(
                          margin: EdgeInsets.all(10),
                          height: 70,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: Color(0xFF35BB9B),
                          ),
                          padding: EdgeInsets.all(10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Medical',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 26,
                                ),
                              ),
                              SizedBox(
                                width: 5,
                              ),
                            ],
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: (){
                          setState(() {
                            Navigator.of(context).push(MaterialPageRoute(builder: (context) => hospitalPage()));
                          });
                        },
                        child: Container(
                          margin: EdgeInsets.all(10),
                          height: 70,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: Color(0xFF35BB9B),
                          ),
                          padding: EdgeInsets.all(10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Hospital',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 26,
                                ),
                              ),
                              SizedBox(
                                width: 5,
                              ),
                            ],
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: (){
                          setState(() {
                            Navigator.of(context).push(MaterialPageRoute(builder: (context) => clinicPage()));
                          });
                        },
                        child: Container(
                          margin: EdgeInsets.all(10),
                          height: 70,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: Color(0xFF35BB9B),
                          ),
                          padding: EdgeInsets.all(10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Clinic',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 26,
                                ),
                              ),
                              SizedBox(
                                width: 5,
                              ),
                            ],
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: (){
                          setState(() {
                            Navigator.of(context).push(MaterialPageRoute(builder: (context) => diagnosticPage()));
                          });
                        },
                        child: Container(
                          margin: EdgeInsets.all(10),
                          height: 70,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: Color(0xFF35BB9B),
                          ),
                          padding: EdgeInsets.all(10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Diagnostic',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 26,
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
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
