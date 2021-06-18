import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:covid_19/modules/result/result_screen.dart';
import 'package:covid_19/modules/signup/signup_screen.dart';
import 'package:covid_19/modules/splash/splash_screen.dart';
import 'package:covid_19/shared/bloc_obserber.dart';
import 'package:covid_19/shared/components/constants.dart';
import 'package:covid_19/shared/network/local/cache_helper.dart';
import 'package:covid_19/shared/network/remote/dio_helper.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

import 'modules/home/home_screen.dart';
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  DioHelper.init();


  await Firebase.initializeApp();
  Bloc.observer = MyBlocObserver();
  await CacheHelper.init();
  if ( CacheHelper.getData(key: "uId") != null) {
    userExist = true;
  }else{
    userExist = false;
  }
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Covid19',
      theme: ThemeData(
        fontFamily:'Cairo',
        primaryColor: Color(0xff074BA0),
        primarySwatch: Colors.red,

      ),
      home: SafeArea(
        child: Directionality(
            textDirection: TextDirection.rtl,
            child: SplashScreen()
            //child: ResultScreen(),
        ),
      ),
    );
  }
}
