import 'dart:async';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:covid_19/modules/upload/cubit/states.dart';
import 'package:covid_19/shared/components/components.dart';
import 'package:covid_19/shared/network/local/cache_helper.dart';
import 'package:covid_19/shared/network/remote/dio_helper.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image/image.dart' as imglib;
import 'package:image_picker/image_picker.dart';



class UploadCubit extends Cubit<UploadStates>{
  UploadCubit() : super(UploadInitialState());

  static UploadCubit get(context) => BlocProvider.of(context);

  File imageFile;
  final picker = ImagePicker();

  var patientNameController = TextEditingController();
  var formKey = GlobalKey<FormState>();



  Future getImage() async {
    emit(LoadingImageState());
     await picker.getImage(
         source: ImageSource.values.last,
     ).then((value){
      if (value != null)
      {
        emit(SuccessImageState());

        imageFile = File(value.path);
        uploadImage(imageFile);

      }
      else {
        print('No image selected.');
        Fluttertoast.showToast(
            msg: "لم يتم اختيار صوره",
            toastLength: Toast.LENGTH_SHORT,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0
        );
        emit(SuccessImageState());
      }

    }).catchError((onError){
      emit(ErrorImageState(onError.toString()));
      Fluttertoast.showToast(
          msg: onError.toString(),
          toastLength: Toast.LENGTH_SHORT,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0
      );
      print("CatchError : ${onError.toString()}");
    });

  }


  Future uploadImage(File file) async {
    emit(LoadingUploadImageState());
    FormData formData = FormData.fromMap({
      "image": await MultipartFile.fromFile(file.path),
    });
    await DioHelper.uploadImage(data: formData)
    .then((value) {
      print("Value : ${value.data.toString()}");
      if (value.data.toString().length > 6) {
        CacheHelper.saveData(key: "result", value: "سلبى"  );
      }  else{
        CacheHelper.saveData(key: "result", value: "ايجابى"  );
      }

      emit(SuccessUploadImageState());
    }).catchError((onError){
      print("error : ${onError.toString()}");
      Fluttertoast.showToast(
          msg: onError.toString(),
          toastLength: Toast.LENGTH_LONG,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0
      );

      emit(ErrorUploadImageState(onError.toString()));
    });

  }
}
