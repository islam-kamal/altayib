import 'dart:async';

import 'package:altayib/View/Home.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new _SplashPageState();
  }
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3), () {
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (BuildContext contex) => Home()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('images/splashpage.png'), fit: BoxFit.cover)),
    );
  }
}
