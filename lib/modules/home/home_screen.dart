import 'package:covid_19/modules/ambulane/ambulance_screen.dart';
import 'package:covid_19/modules/doctors/doctors_screen.dart';
import 'package:covid_19/modules/history/history_screen.dart';
import 'package:covid_19/modules/home/cubit/cubit.dart';
import 'package:covid_19/modules/home/cubit/states.dart';
import 'package:covid_19/modules/upload/upload_screen.dart';
import 'package:covid_19/shared/components/components.dart';
import 'package:covid_19/shared/components/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_conditional_rendering/conditional.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hexcolor/hexcolor.dart';

class HomeScreen extends StatelessWidget
{
  HomeScreen({Key key }) : super(key: key);

  @override
  Widget build(BuildContext context)
  {
    return BlocProvider(
      create: (context) => HomeCubit(),
      child: BlocConsumer<HomeCubit , HomeStates>(
        listener: (context , state)
        {
          // TODO: implement listener
        } ,
        builder: (context , state)
        {
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
                      Padding(
                        padding: EdgeInsets.only(top:0 , right: 50 , left: 30) ,
                        child: Row(
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start ,
                                mainAxisAlignment: MainAxisAlignment.center ,
                                children: [
                                  Text(
                                    "كيف تشعر الان," ,
                                    style: TextStyle(
                                        color: HexColor("#074BA0") , fontSize: 20 , fontWeight: FontWeight.bold) ,
                                  ) ,
                                  Conditional.single(
                                      context: context,
                                      conditionBuilder: (context)=> HomeCubit.get(context).userName != null,
                                      widgetBuilder: (context)=>Text(
                                        '${HomeCubit.get(context).userName}' ,
                                        style: TextStyle(
                                            color: HexColor("#D1424B") , fontSize: 18 , fontWeight: FontWeight.w800) ,
                                      ) ,
                                      fallbackBuilder: (context)=>Text(
                                        '' ,
                                  ),),
                                ] ,
                              ) ,
                            ) ,
                            Container(
                              child: Center(
                                child: Image.asset(
                                  "assets/images/logo.png" ,
                                  width: width*0.38 ,
                                ) ,
                              ) ,
                            ) ,
                          ] ,
                        ) ,
                      ) ,
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20) ,
                        child: Container(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.topRight ,
                              end: Alignment.bottomLeft ,
                              colors: [
                                Color(0xff3987e7) ,
                                Color(0xff1c4e92) ,
                              ] ,
                            ) ,
                            borderRadius: BorderRadius.circular(10) ,
                          ) ,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0) ,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center ,
                              children: [
                                Expanded(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start ,
                                    crossAxisAlignment: CrossAxisAlignment.start ,
                                    children: [
                                      Text(
                                        "إبق آمنًا ! " ,
                                        style: TextStyle(color: Colors.white , fontWeight: FontWeight.bold , fontSize: 15) ,
                                      ) ,
                                      Text(
                                        "اغسل يديك جيدا وكثيرا بالماء والصابون\n او دلكهما بالكحول\nهكذا تقتل الفيروسات التى قد تكون عالقه فى يديك \nحاول ألا تلمس عينيك ولا انفك ولا فمك فألايدى تلمس العديد من الاسطح ويمكن ان تعلق بها الفيروسات. ومن هنا يمكن ان يخترق الفيروس جسمك حافظ على نفسك " ,
                                        style: TextStyle(color: Colors.white , fontSize: 11 , fontWeight: FontWeight.w700) ,
                                      ) ,
                                    ] ,
                                  ) ,
                                ) ,
                                Image.asset(
                                  "assets/images/home.png" ,
                                  width: width*0.382 ,
                                ) ,
                              ] ,
                            ) ,
                          ) ,
                        ) ,
                      ) ,
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 10.0 , horizontal: 20.0),
                        child: Row(
                          children: [
                           Expanded(
                             child: Container(
                               decoration: BoxDecoration(
                                   borderRadius: BorderRadius.circular(10),
                                   color: Colors.white
                               ),
                               child: MaterialButton(
                                 child: Row(
                                   children: [
                                     Container(
                                       decoration: BoxDecoration(
                                         borderRadius: BorderRadius.circular(10),
                                         color: HexColor("#DBF8FA"),
                                       ),

                                       child: SvgPicture.asset(
                                         "assets/images/ambulance.svg" ,
                                         width: width*0.051 ,
                                         color: HexColor("#2DD3E4"),

                                       ),
                                     ) ,
                                     SizedBox(width: 15,),
                                     Text(
                                       "اسعاف" ,
                                       style: TextStyle(
                                           color: Colors.black ,
                                           fontSize: width*0.051 ,
                                           fontWeight: FontWeight.bold
                                       ) ,
                                     ) ,

                                   ],
                                 ),
                                 onPressed: (){
                                   navigateTo(context, AmbulanceScreen());
                                 },
                               ),
                             ),
                           ),
                            SizedBox(
                              width: 10,
                            ),
                            Expanded(
                              child: Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.white
                                ),
                                child:MaterialButton(
                                  child: Row(
                                    children: [
                                      Container(
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(10),
                                          color: HexColor("#FFE7E3"),
                                        ),
                                        child: SvgPicture.asset(
                                          "assets/images/doctorvisit.svg" ,
                                          width: width*0.051,
                                          color: HexColor("#FF3E68"),

                                        ),
                                      ) ,
                                      SizedBox(width: 15,),
                                      Text(
                                        "زياره منزليه" ,
                                        style: TextStyle(
                                            color: Colors.black ,
                                            fontSize: width*0.051 ,
                                            fontWeight: FontWeight.bold
                                        ) ,
                                      ) ,

                                    ],
                                  ),
                                  elevation: 10,
                                  onPressed: (){
                                    navigateTo(context, DoctorsScreen());
                                  },
                                ),
                              ),
                            ),

                          ] ,
                        ),
                      ),
                      Padding(
                        padding:  EdgeInsets.symmetric(horizontal: width*0.153, vertical: height*0.023) ,
                        child: GestureDetector(
                          onTap: (){
                            navigateTo(context, UploadScreen());
                          },
                          child: Container(
                            height: height*0.32 ,
                            width: width*0.712 ,
                            decoration: BoxDecoration(
                              color: Colors.white ,
                              borderRadius: BorderRadius.circular(15) ,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.5) ,
                                  spreadRadius: 2 ,
                                  blurRadius: 8 ,
                                  offset: Offset(0 , 6) , // changes position of shadow
                                ) ,
                              ] ,
                            ) ,
                            child: Column(
                              children: [
                                Padding(
                                  padding:  EdgeInsets.only(top: width*0.051) ,
                                  child: Image.asset(
                                    "assets/images/corona.png" ,
                                    width: width*0.382 ,
                                  ) ,
                                ) ,
                                Text(
                                  "تحليل كورونا" ,
                                  style: TextStyle(
                                      color: Colors.black ,
                                      fontSize: 30 ,
                                      fontWeight: FontWeight.w500
                                  ) ,
                                ) ,
                              ] ,
                            ) ,
                          ),
                        ) ,
                      ) ,
                    ] ,
                  ),
                ) ,
                floatingActionButton:  MaterialButton(
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
            ) ,
          );
        } ,
      ) ,
    );
  }
}
