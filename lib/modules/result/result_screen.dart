import 'package:covid_19/modules/history/history_screen.dart';
import 'package:covid_19/modules/result/cubit/cubit.dart';
import 'package:covid_19/modules/result/cubit/states.dart';
import 'package:covid_19/shared/components/components.dart';
import 'package:covid_19/shared/components/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_conditional_rendering/conditional.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hexcolor/hexcolor.dart';

class ResultScreen extends StatelessWidget
{
  const ResultScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context)
  {
    return BlocProvider(
      create: (context) => ResultCubit()..addUserResult(context: context)..addAdminResult(context: context),
      child: BlocConsumer<ResultCubit , ResultStates>(
        listener: (context , state)
        {
          // TODO: implement listener
        } ,
        builder: (context , state)
        {
          var cubit  = ResultCubit.get(context);
          double width = MediaQuery.of(context).size.width;
          double height = MediaQuery.of(context).size.height;
          return Directionality(
              textDirection: TextDirection.rtl ,
              child: SafeArea(
                child: Scaffold(
                  backgroundColor: background ,
                  body: SingleChildScrollView(
                    physics: BouncingScrollPhysics(),
                    child: Column(
                      children: [
                        SizedBox(height: 20,),
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
                                padding: const EdgeInsets.fromLTRB(10,5,10,5),
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
                                        width: width*0.255 ,
                                      ) ,
                                    ) ,

                                  ] ,
                                ),
                              ),
                            ) ,

                          ],
                        ),
                        SizedBox(height: 20,),
                        Column(
                           children: [
                             Container(
                               color: HexColor("#3655D1"),
                               width: double.infinity,
                               child: Column(
                                 mainAxisAlignment: MainAxisAlignment.start,
                                 mainAxisSize: MainAxisSize.max,
                                 children: [
                                   SizedBox(height: 20,),
                                   Text(
                                     'نتيجه التحليل',
                                     style: TextStyle(
                                       color: Colors.black,
                                       fontSize: 25,
                                       fontWeight: FontWeight.w600,
                                     ),
                                   ),
                                   Container(
                                     width: double.infinity,
                                     child: Padding(
                                       padding: const EdgeInsets.symmetric(vertical: 15 , horizontal: 20),
                                       child: Column(
                                         mainAxisAlignment: MainAxisAlignment.start,
                                         crossAxisAlignment: CrossAxisAlignment.start,
                                         children: [
                                           Padding(
                                             padding: const EdgeInsets.all(8.0),
                                             child: Row (
                                               children: [
                                                 Text(
                                                   "اسم المريض : ",
                                                   style: TextStyle(
                                                     color: Colors.white,
                                                     fontSize: 20,
                                                     fontWeight: FontWeight.w400,
                                                   ),
                                                 ),
                                                 SizedBox(width: 10,),
                                                 Text(
                                                   "${cubit.patientName}",
                                                   style: TextStyle(
                                                     color: Colors.white,
                                                     fontSize: 20,
                                                     fontWeight: FontWeight.w400,
                                                   ),
                                                 ),
                                               ],
                                             ),
                                           ),
                                           Padding(
                                             padding: const EdgeInsets.all(8.0),
                                             child: Row(
                                               children: [
                                                 Text(
                                                   "البريد : ",
                                                   style: TextStyle(
                                                     color: Colors.white,
                                                     fontSize: 20,
                                                     fontWeight: FontWeight.w400,
                                                   ),
                                                 ),
                                                 SizedBox(width: 5,),
                                                 Text(
                                                   "${cubit.email}",
                                                   style: TextStyle(
                                                     color: Colors.white,
                                                     fontSize: 20,
                                                     fontWeight: FontWeight.w400,
                                                   ),
                                                 ),
                                               ],
                                             ),
                                           ),
                                           Padding(
                                             padding: const EdgeInsets.all(8.0),
                                             child: Row(
                                               children: [
                                                 Text(
                                                   "نتيجه الأشعه : ",
                                                   style: TextStyle(
                                                     color: Colors.white,
                                                     fontSize: 20,
                                                     fontWeight: FontWeight.w400,
                                                   ),
                                                 ),
                                                 SizedBox(width: 10,),
                                                 Text(
                                                   "${cubit.myResult}",
                                                   style: TextStyle(
                                                     color: Colors.white,
                                                     fontSize: 20,
                                                     fontWeight: FontWeight.w400,
                                                   ),
                                                 )
                                               ],
                                             ),
                                           ),
                                         ],
                                       ),
                                     ),
                                   ),
                                   Container(
                                     width: width*0.38,
                                     child:Conditional.single(
                                         context: context,
                                         conditionBuilder: (context)=> cubit.myResult == "سلبى",
                                         widgetBuilder: (context)=> Image.asset(
                                           "assets/images/clear.png",
                                         ),
                                         fallbackBuilder: (context)=> Image.asset(
                                           "assets/images/positive.png",
                                         ),
                                     )
                                   ),
                                   SizedBox(
                                     height: 20,
                                   ),
                                   Conditional.single(
                                       context: context,
                                       conditionBuilder:(context)=> cubit.myResult == "سلبى",
                                       widgetBuilder: (context) => Text(
                                         'استمر فى الحفاظ على صحتك',
                                         style: TextStyle(
                                           color: Colors.white,
                                           fontSize: width*0.051,
                                           fontWeight: FontWeight.w600,
                                         ),
                                       ),
                                       fallbackBuilder: (context) => Text(
                                         'ابقى فى المنزل واحصل على زياره منزليه',
                                         style: TextStyle(
                                           color: Colors.white,
                                           fontSize: width*0.051,
                                           fontWeight: FontWeight.w600,
                                         ),
                                       )
                                   ),
                                   SizedBox(
                                     height: 20,
                                   ),
                                 ],
                               ),


                             ),
                             SizedBox(
                               height: 30,
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
                    height: 50,
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
              )
          );
        } ,
      ) ,
    );
  }
}
