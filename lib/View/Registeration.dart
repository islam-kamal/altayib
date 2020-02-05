import 'dart:io';

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import 'Home.dart';

class Registeration extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new _RegisterationState();
  }
}

class _RegisterationState extends State<Registeration> {
  bool isChecked = false;
  bool statusKey=true;
  GlobalKey _registerKey=new GlobalKey();
  GlobalKey _loginKey=new GlobalKey();
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new SafeArea(
        child: new SingleChildScrollView(
          child: new Container(
            padding: EdgeInsets.only(top: 50),
            color: Colors.white,
            alignment: Alignment.center,
            child: new Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  new Row(
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(top: 20, left: 20),
                        child: new SizedBox(
                          width: 150,
                          height: 45,
                          child: new RaisedButton(
                            key: _registerKey,
                            onPressed: (){
                              setState(() {
                                statusKey=false;
                              });
                            },
                            child: new Text(
                              "تسجيل جديد",
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                            //use to make circle border for button
                            shape: new RoundedRectangleBorder(
                              borderRadius: new BorderRadius.circular(12.0),
                              side: BorderSide(
                                color: Colors.lightGreen,
                              ),
                            ),
                            color: Colors.lightGreen,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 20, top: 20),
                        child: new SizedBox(
                          width: 150,
                          height: 45,
                          child: new RaisedButton(
                            key: _loginKey,
                            onPressed: (){
                              setState(() {
                                statusKey=true;
                              });
                            },
                            child: new Text(
                              "تسجيل دخول",
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                            //use to make circle border for button
                            shape: new RoundedRectangleBorder(
                              borderRadius: new BorderRadius.circular(12.0),
                              side: BorderSide(
                                color: Colors.lightGreen,
                              ),
                            ),
                            color: Colors.lightGreen,
                          ),
                        ),
                      ),
                    ],
                  ),
                  //contain of login or register page
                  statusKey==true?goToLogin():  goToRegister(),
                ]),
          ),
        ),
      ),
    );
  }

  // show login page
  Widget goToLogin() {
    TextEditingController _phoneController = new TextEditingController();
    return new Container(
      alignment: Alignment.center,
      child: new Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(
              top: 40,
            ),
            child: new Image(
              image: AssetImage('images/altayib_logo.png'),
              width: 200,
              height: 150,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 20, right: 20, top: 20),
            child: new TextField(
              controller: _phoneController,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.black,
              ),
              decoration: InputDecoration(
                hintText: 'رقم الجوال',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5.0),
                  borderSide: BorderSide(color: Colors.black, width: 1.0),
                ),
                // to add icon from right side
                suffixIcon: Padding(
                  padding: const EdgeInsetsDirectional.only(start: 20, end: 20),
                  child: new Icon(
                    Icons.mobile_screen_share,
                    color: Colors.lightGreen,
                    size: 40,
                  ),
                ),

                hintStyle: TextStyle(
                  color: Colors.black, // make hint text with white color
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
            child: CheckboxListTile(
              value: false,
              title: new Text(
                'ذكرنى',
                textAlign: TextAlign.right,
              ),
              activeColor: Colors.blue,
            ),
          ),
          new SizedBox(
            width: 150.0,
            height: 40,
            child: new RaisedButton(
              onPressed: goToLogin,
              child: new Text(
                "دخول",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              //use to make circle border for button
              shape: new RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(12.0),
                side: BorderSide(
                  color: Colors.purple.shade600,
                ),
              ),
              color: Colors.purple.shade600,
            ),
          ),
          Padding(
              padding: EdgeInsets.only(top: 20),
              child: InkWell(
                child: new Text(
                  'دخول كزائر',
                  style: TextStyle(
                    decoration: TextDecoration.underline,
                    fontSize: 18,
                  ),
                ),
                onTap: (){
                  Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (BuildContext contex) => Home()));
                },
              ),),
        ],
      ),
    );
  }
  // show register page
  Widget goToRegister() {
    TextEditingController _phoneController = new TextEditingController();
    TextEditingController _nameController = new TextEditingController();
    return new Container(
      alignment: Alignment.center,
      child: new Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(
              top: 20,
            ),
            child: new Image(
              image: AssetImage('images/altayib_logo.png'),
              width: 200,
              height: 150,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 20, right: 20, top: 10),
            child: new TextField(
              controller: _nameController,
              keyboardType: TextInputType.text,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.black,
              ),
              decoration: InputDecoration(
                hintText: 'الاسم بالكامل',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5.0),
                  borderSide: BorderSide(color: Colors.black, width: 1.0),
                ),
                // to add icon from right side
                suffixIcon: Padding(
                  padding: const EdgeInsetsDirectional.only(start: 20, end: 20),
                  child: new Icon(
                    Icons.person_outline,
                    color: Colors.lightGreen,
                    size: 40,
                  ),
                ),

                hintStyle: TextStyle(
                  color: Colors.black, // make hint text with white color
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 20, right: 20, top: 10),
            child: new TextField(
              controller: _phoneController,
              keyboardType: TextInputType.phone,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.black,
              ),
              decoration: InputDecoration(
                hintText: 'رقم الجوال',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5.0),
                  borderSide: BorderSide(color: Colors.black, width: 1.0),
                ),
                // to add icon from right side
                suffixIcon: Padding(
                  padding: const EdgeInsetsDirectional.only(start: 20, end: 20),
                  child: new Icon(
                    Icons.mobile_screen_share,
                    color: Colors.lightGreen,
                    size: 40,
                  ),
                ),

                hintStyle: TextStyle(
                  color: Colors.black, // make hint text with white color
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
            child: CheckboxListTile(
              value: false,
              title: new Text(
                'ذكرنى',
                textAlign: TextAlign.right,
              ),
              activeColor: Colors.blue,

            ),
          ),
          new SizedBox(
            width: 150.0,
            height: 40,
            child: new RaisedButton(
              onPressed: goToLogin,
              child: new Text(
                "دخول",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              //use to make circle border for button
              shape: new RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(12.0),
                side: BorderSide(
                  color: Colors.purple.shade600,
                ),
              ),
              color: Colors.purple.shade600,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 10),
            child: InkWell(
              child: new Text(
                'دخول كزائر',
                style: TextStyle(
                  decoration: TextDecoration.underline,
                  fontSize: 18,
                ),
              ),
              onTap: (){
                Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (BuildContext contex) => Home()));
              },
            ),),
        ],
      ),
    );
  }
}
