import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:covid_19/modules/history/cubit/states.dart';
import 'package:covid_19/modules/home/cubit/states.dart';
import 'package:covid_19/modules/home/home_screen.dart';
import 'package:covid_19/modules/singin/signin_screen.dart';
import 'package:covid_19/shared/components/components.dart';
import 'package:covid_19/shared/components/constants.dart';
import 'package:covid_19/shared/network/local/cache_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

class HistoryCubit extends Cubit<HistoryStates>{

  HistoryCubit() : super(HistoryInitialState());

  static HistoryCubit get(context) => BlocProvider.of(context);

  String email = CacheHelper.getData(key: "email");
  String name, result,date;
  bool status;

  List<Widget>myItems=[];

  Future logout(BuildContext context)async{
    emit(LogingoutState());


    CacheHelper.removeData(key: 'uId').then((value){
      emit(LogoutSuccessState());
      Fluttertoast.showToast(
          msg: "تم تسجيل الخروج",
          toastLength: Toast.LENGTH_SHORT,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.green,
          textColor: Colors.white,
          fontSize: 16.0
      );
      userExist = false;
      navigateAndFinish(context,SignInScreen() );
    }).catchError((onError){
      print(onError.toString());
      emit(LogoutFailedState(onError.toString()));

    });
  }

  void fetchData()async{
    emit(HistoryFetchingState());
    await FirebaseFirestore.instance..collection("users_results")
        .doc(email)
        .collection("results")
        .get().then((value){
      for(int i=0;i<value.docs.length;i++){
        if (value.docs[i].data()['result'] == "سلبى") {
          status = false;
        }  else{
          status = true;
        }
        name = value.docs[i].data()['name'];
        date = value.docs[i].data()['date'];
        result = value.docs[i].data()['result'];

        myItems.add(historyItem(name: name , date:date , result: result, positive: status ));
        emit(HistoryFetchSuccessState());

      }
    }).catchError((onError){
      print(onError.toString());
      emit(HistoryFetchErrorState(onError.toString()));
    });
  }


   Future clearData(context) async {
    if (myItems.isEmpty) {

      Fluttertoast.showToast(
          msg: "لا يوجد تحاليل سابقه",
          toastLength: Toast.LENGTH_SHORT,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.redAccent,
          textColor: Colors.white,
          fontSize: 16.0
      );
    }  else{
      var querySnapshots = await FirebaseFirestore.instance.collection("users_results").doc(email).collection("results").get();
      for (var doc in querySnapshots.docs) {
        await doc.reference.delete();
      }
      Fluttertoast.showToast(
          msg: "تم مسح التحاليل السابقه",
          toastLength: Toast.LENGTH_SHORT,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.green,
          textColor: Colors.white,
          fontSize: 16.0
      );
    }

    emit(DeleteHistorySuccessState());






  }


  Future<void> showMyDialog({
  @required BuildContext context,
}) async {
    emit(DeleteingHistoryState());
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text(
              'تحذير' ,
          style: TextStyle(
            color: Colors.red,
            fontWeight: FontWeight.bold
          ),
          ),
          content: SingleChildScrollView(
            child: ListBody(
              children: const <Widget>[
                Text('هل انت متأكد من مسح النتائج السابقه ؟ '),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('تأكيد'),
              onPressed: () {
                clearData(context);
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }







}