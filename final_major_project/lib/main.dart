import 'dart:io';

import 'package:final_major_project/BeforeLogin.dart';
import 'package:final_major_project/LoginPage.dart';
import 'package:final_major_project/RegisterPage.dart';
import 'package:final_major_project/UserRegister.dart';
import 'package:final_major_project/centers.dart';
import 'package:final_major_project/subListPage.dart';
import 'package:final_major_project/nav.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  Directory doc = await getApplicationDocumentsDirectory();
  Hive.init(doc.path);
  await Hive.openBox("loginData");
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
     debugShowCheckedModeBanner: false,
      theme: ThemeData(
          fontFamily: "Roboto",
      ),
      home: BeforeLogin(),
    );
  }
}
