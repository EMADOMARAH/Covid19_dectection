import 'dart:async';

import 'package:covid_19/modules/home/home_screen.dart';
import 'package:covid_19/modules/signup/signup_screen.dart';
import 'package:covid_19/shared/components/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState()  {
    // TODO: implement initState
    super.initState();

    Timer(Duration(seconds: 3),
            () => Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (BuildContext context) => userExist ? HomeScreen() : SignUpScreen())));
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xff074BA0),
              Color(0xff042650),
            ],
          ),
          image: DecorationImage(
            image : AssetImage("assets/images/splash.png"),
            fit: BoxFit.cover
          )
        ),
        child: Stack(
          children: [
            Container(
              margin: EdgeInsets.all(50.0),
              child: Center(
                child: Image.asset("assets/images/logo.png"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
