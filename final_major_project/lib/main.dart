import 'package:final_major_project/LoginPage.dart';
import 'package:final_major_project/RegisterPage.dart';
import 'package:final_major_project/UserRegister.dart';
import 'package:final_major_project/centers.dart';
import 'package:final_major_project/clinicPage.dart';
import 'package:final_major_project/diagnosticPage.dart';
import 'package:final_major_project/hospitalPage.dart';
import 'package:final_major_project/medicalPage.dart';
import 'package:final_major_project/nav.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
     debugShowCheckedModeBanner: false,
      theme: ThemeData(
          fontFamily: "Roboto"
      ),
      home: Login(),
    );
  }
}
