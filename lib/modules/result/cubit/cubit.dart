import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:covid_19/modules/result/cubit/states.dart';
import 'package:covid_19/modules/upload/cubit/states.dart';
import 'package:covid_19/modules/upload/upload_screen.dart';
import 'package:covid_19/shared/components/components.dart';
import 'package:covid_19/shared/network/local/cache_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';

class ResultCubit extends Cubit<ResultStates>{
  ResultCubit() : super(ResultInitialState());

  static ResultCubit get(context) => BlocProvider.of(context);


  static final DateTime now = DateTime.now();
  static final DateFormat formatter = DateFormat('yyyy-MM-dd');
  final String currentDate = formatter.format(now);


  String patientName = CacheHelper.getData(key: "patient");
  String email = CacheHelper.getData(key: "email");
  String myResult = CacheHelper.getData(key: "result");
  String uId = CacheHelper.getData(key: "uId");


  void addUserResult({
    @required BuildContext context,}){

    FirebaseFirestore.instance
        .collection("users_results")
        .doc(email)
        .collection("results")
        .add({
      'name': patientName,
      'email': email,
      'result': myResult,
      'date' : currentDate
    })
        .then((value) {

    })
        .catchError((onError){
      Fluttertoast.showToast(
        msg: onError.toString(),
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.red[500],
        textColor: Colors.white,
        fontSize: 16.0,
      );

    });
  }

  void addAdminResult({
    @required BuildContext context,}){

    FirebaseFirestore.instance
        .collection("admin_results")
        .doc(myResult)
        .collection(email)
        .add({
      'name': patientName,
      'email': email,
      'result': myResult,
      'date' : currentDate
    })
        .then((value) {

    })
        .catchError((onError){
      Fluttertoast.showToast(
        msg: onError.toString(),
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.red[500],
        textColor: Colors.white,
        fontSize: 16.0,
      );

    });
  }





}