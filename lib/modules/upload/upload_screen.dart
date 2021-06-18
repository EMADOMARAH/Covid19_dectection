import 'package:covid_19/modules/history/history_screen.dart';
import 'package:covid_19/modules/result/result_screen.dart';
import 'package:covid_19/modules/upload/cubit/cubit.dart';
import 'package:covid_19/modules/upload/cubit/states.dart';
import 'package:covid_19/shared/components/components.dart';
import 'package:covid_19/shared/components/constants.dart';
import 'package:covid_19/shared/network/local/cache_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_conditional_rendering/conditional.dart';
import 'package:hexcolor/hexcolor.dart';

class UploadScreen extends StatelessWidget
{
  const UploadScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context)
  {

    return BlocProvider(
      create: (context) => UploadCubit(),
      child: BlocConsumer<UploadCubit , UploadStates>(
        listener: (context , state)
        {
          if (state is SuccessUploadImageState) {
            navigateTo(context, ResultScreen());
          }

        } ,
        builder: (context , state)
        {
          var cubit = UploadCubit.get(context);
          double width = MediaQuery.of(context).size.width;
          double height = MediaQuery.of(context).size.height;
          return Directionality(
              textDirection: TextDirection.rtl ,
              child: SafeArea(
                child: Scaffold(
                  resizeToAvoidBottomInset: false,
                  backgroundColor: background ,
                  body: SingleChildScrollView(
                    physics: BouncingScrollPhysics(),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 20,
                        ),
                        Column(
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    color: Colors.white ,
                                    borderRadius: BorderRadius.circular(15) ,
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.withOpacity(0.2) ,
                                        spreadRadius: 2 ,
                                        blurRadius: 8 ,
                                        offset: Offset(0 , 6) , // changes position of shadow
                                      ) ,
                                    ] ,
                                  ) ,
                                  child: Padding(
                                    padding: const EdgeInsets.fromLTRB(10,25,10,25),
                                    child: Row(
                                      children: [
                                        Text(
                                          "تحليل كورونا" ,
                                          style: TextStyle(
                                              color: Colors.black ,
                                              fontSize: 25 ,
                                              fontWeight: FontWeight.w500
                                          ) ,
                                        ) ,
                                        Padding(
                                          padding: const EdgeInsets.all(5) ,
                                          child: Image.asset(
                                            "assets/images/corona.png" ,
                                            width: width*0.25 ,
                                          ) ,
                                        ) ,

                                      ] ,
                                    ),
                                  ),
                                ) ,

                              ],
                            ),
                            SizedBox(
                              height: 30,
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 50 , vertical: 20),
                              child: Form(
                                key: cubit.formKey,
                                child: defaultFormField(
                                    controller: cubit.patientNameController,
                                    label: "اسم المريض",
                                    textInputType: TextInputType.text,
                                    validate: (value){
                                    if (value.toString().isEmpty) {
                                      return 'لابد من كتابه اسم المريض';
                                    }
                                    return null;
                                    },

                                ),
                              ),
                            ),
                            Conditional.single(
                                context: context,
                                conditionBuilder: (context)=> state is! LoadingUploadImageState,
                                widgetBuilder: (context)=> TextButton(
                                  style: ButtonStyle(
                                      padding: MaterialStateProperty.all<EdgeInsets>(EdgeInsets.fromLTRB(20, 20, 20, 20)),
                                      backgroundColor: MaterialStateProperty.all<Color>(HexColor("#3655D1")),
                                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                        RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(10.0),
                                        ),
                                      )
                                  ),
                                  onPressed: (){
                                    if (cubit.formKey.currentState.validate()) {
                                      CacheHelper.saveData(key: "patient", value: cubit.patientNameController.text);
                                      cubit.getImage();
                                    }

                                  },
                                  child: Text(
                                    "اضغط هنا لأضافه الأشعه" ,
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w700,
                                        fontSize: 20
                                    ),
                                  ),
                                ),
                                fallbackBuilder: (context)=>Center(child: CircularProgressIndicator())
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Container(
                                width: double.infinity,
                                height: height*0.344,
                                child: Image.asset(
                                  'assets/images/doctor.png'
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  floatingActionButton: MaterialButton(
                    onPressed: ()
                    {
                      navigateTo(context, HistoryScreen());
                    } ,
                    height: height*0.057,
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.update,
                          size: 35,
                          color: Colors.white,
                        ),
                        Text(
                          "التحاليل السابقة",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w600
                          ),

                        ),
                      ],
                    ),
                    color: HexColor("#074BA0"),
                    shape: new RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(30.0),
                    ),

                  ),

                ),
              ),
          );
        } ,
      ) ,
    );
  }
}
