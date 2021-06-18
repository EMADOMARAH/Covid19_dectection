import 'package:covid_19/modules/home/home_screen.dart';
import 'package:covid_19/modules/signup/cubit/states.dart';
import 'package:covid_19/shared/components/components.dart';
import 'package:covid_19/shared/network/local/cache_helper.dart';
import 'package:covid_19/shared/network/remote/models/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class SignUpCubit extends Cubit<SignUpStates>
{
  SignUpCubit() : super(SignUpInitialState());

  static SignUpCubit get(context) =>BlocProvider.of(context);

  var formKey = GlobalKey<FormState>();

  var signUpNameController = TextEditingController();
  var signUpEmailController = TextEditingController();
  var signUpPhoneController = TextEditingController();
  var signUpPasswordController = TextEditingController();


  void userRegister({
    @required String name,
    @required String email,
    @required String password,
    @required String phone,
    @required bool isUser,
    @required BuildContext context,
  }){
    emit(SignUpLoadingState());

    FirebaseAuth.instance
        .createUserWithEmailAndPassword(
        email: email, 
        password: password
    ).then((value)
    {
      print(value.user.uid);
      createUser(name: name, email: email, phone: phone, uId: value.user.uid,isUser: isUser, context: context);

    })
    .catchError((onError)
    {
      Fluttertoast.showToast(
          msg: onError.toString(),
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.BOTTOM,
          backgroundColor: Colors.red[500],
          textColor: Colors.white,
          fontSize: 16.0,
      );
      emit(SignUpErrorState(onError.toString()));
    });
      
    
  }

  void createUser({
    @required String name,
    @required String email,
    @required String phone,
    @required String uId,
    @required bool isUser,
    @required BuildContext context,}){

    UserModel userModel = new UserModel(
        name: name,
      email: email,
      phone: phone,
      uId: uId,
      isUser : isUser
    );

    CacheHelper.saveData(key: "name", value: name);
    CacheHelper.saveData(key: "phone", value: phone);
    CacheHelper.saveData(key: "email", value: email);

    FirebaseFirestore.instance
    .collection("users")
    .doc(uId)
    .set(userModel.toMap())
        .then((value) {
      CacheHelper.saveData(key: "uId", value: uId);
      navigateTo(context, HomeScreen());
      emit(SignUpCreateUserSuccessState());
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
      emit(SignUpCreateUserErrorState(onError.toString()));
    });
  }



  IconData suffix = Icons.visibility_outlined;
  bool isPassword = true;
  void changePasswordVisibility(){
    isPassword = !isPassword;
    suffix = isPassword ? Icons.visibility_outlined : Icons.visibility_off_outlined;
    
    emit(SignUpChangePasswordVisibilityState());
  }

  bool isUser = true;
  bool isHospital = false;
  Color userColor = Color(0xffD1424B);
  Color hospitalColor = Colors.white;
  Color userFontColor = Colors.white;
  Color hospitalFontColor = Color(0xff074BA0);
  void changeUserType(){
   isUser = !isUser;
   isHospital = !isHospital;
   userColor = isUser ? Color(0xffD1424B) : Colors.white;
   hospitalColor = isHospital ? Color(0xffD1424B) : Colors.white;
   userFontColor = isUser ? Colors.white : Color(0xff074BA0) ;
   hospitalFontColor = isHospital ? Colors.white : Color(0xff074BA0);
   emit(SignUpChangeUserTypeState());
  }


}