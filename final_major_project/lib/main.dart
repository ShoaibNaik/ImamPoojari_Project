import 'dart:io';
import 'dart:async';
import 'package:final_major_project/BeforeLogin.dart';
import 'package:final_major_project/LoginPage.dart';
import 'package:final_major_project/RegisterPage.dart';
import 'package:final_major_project/UserRegister.dart';
import 'package:final_major_project/centers.dart';
import 'package:final_major_project/splashScreen.dart';
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
      home: Splashscreen(),
    );
  }
}

class Splashscreen extends StatefulWidget {
  const Splashscreen({key}) : super(key: key);

  @override
  _SplashscreenState createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {


  void startTimer(){
    Timer(Duration(seconds: 5),(){
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => BeforeLogin()));
    });
  }

  @override

  void initState() {
    // TODO: implement initState
    super.initState();
    startTimer();
  }

  @override


  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [Colors.blue,Colors.red]
                )
            ),
            child: Center(
              child: Image.asset('assets/images/logoWhite.png'),
            ),
          )
      ),
    );
  }

}
