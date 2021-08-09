import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Splash extends StatefulWidget {
  const Splash({key}) : super(key: key);

  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {



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
  void startTimer(){
    Timer(Duration(seconds: 3),(){
      Navigator.of(context).pushReplacementNamed('BeforeLogin');
    });
  }
}

