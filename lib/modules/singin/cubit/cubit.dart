import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:covid_19/modules/home/home_screen.dart';
import 'package:covid_19/modules/singin/cubit/states.dart';
import 'package:covid_19/shared/components/components.dart';
import 'package:covid_19/shared/network/local/cache_helper.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

class SignInCubit extends Cubit<SignInStates>
{
  SignInCubit() : super(SignInInitialState());

  static SignInCubit get(context) =>BlocProvider.of(context);

  var formKey  = GlobalKey<FormState>();
  var emailController  = TextEditingController();
  var passwordController = TextEditingController();

  dynamic userName;

  Future userLogin ({
    @required String email,
    @required String password,
    @required BuildContext context,
     }) async{
    emit(SignInLoadingState());

    await FirebaseAuth.instance
    .signInWithEmailAndPassword(
        email: email,
        password: password
    ).then((value){

      FirebaseFirestore.instance
          .collection("users")
          .doc(value.user.uid)
          .get()
          .then((value)async{
           userName =  CacheHelper.saveData(key: "name", value: value.data()['name']);
           await CacheHelper.saveData(key: "uId", value: value.data()['uId']);
           await CacheHelper.saveData(key: "phone", value: value.data()['phone']);
           await CacheHelper.saveData(key: "email", value: value.data()['email']).then((value) {
             emit(SignInSuccessState());
              navigateAndFinish(context, HomeScreen());
           });

      });


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
      emit(SignInErrorState(onError.toString()));
    });

  }


  IconData suffix = Icons.visibility_outlined;
  bool isPassword = true;
  void changePasswordVisibility(){
    isPassword = !isPassword;
    suffix = isPassword ? Icons.visibility_outlined : Icons.visibility_off_outlined;

    emit(SignInChangePasswordVisibilityState());
  }





}