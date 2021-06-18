import 'package:covid_19/modules/ambulane/cubit/cubit.dart';
import 'package:covid_19/modules/ambulane/cubit/states.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_conditional_rendering/conditional.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:url_launcher/url_launcher.dart';


class AmbulanceScreen extends StatelessWidget
{
  const AmbulanceScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context)
  {
    return BlocProvider(
      create: (context) => AmbulanceCubit() ,
      child: BlocConsumer<AmbulanceCubit , AmbulanceStates>(
        listener: (context , state)
        {
          // TODO: implement listener
        } ,
        builder: (context , state)
        {
          double width = MediaQuery.of(context).size.width;
          double height = MediaQuery.of(context).size.height;
          return Directionality(
              textDirection: TextDirection.rtl,
              child: Scaffold(
                body: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: HexColor("#3655D1"),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(height: 10,),
                            Text(
                              "عنوانك" ,
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
                            ),
                            SizedBox(height: 10,),
                            Text(
                              AmbulanceCubit.get(context).address,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.grey.shade300,
                                  fontWeight: FontWeight.normal,
                                  fontSize: 15
                              ),
                            ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20 , vertical: 20),
                            child: Conditional.single(
                                context: context,
                                conditionBuilder: (context)=> state is! AmbulanceLoadLocation,
                                widgetBuilder: (context)=>Container(
                                  width: double.infinity,
                                  height: height*0.0458,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    gradient: LinearGradient(
                                      begin: Alignment.centerRight,
                                      end: Alignment.centerLeft,
                                      colors: <Color>[
                                        HexColor("#074BA0"),
                                        HexColor("#042650"),
                                      ],
                                    ),
                                  ),
                                  child: MaterialButton(
                                    onPressed: (){
                                      AmbulanceCubit.get(context).getLoc();
                                    },
                                    child: Text(
                                      "تغير العنوان",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 15 ,
                                          fontWeight: FontWeight.w800
                                      ),
                                    ),
                                    shape: new RoundedRectangleBorder(
                                      borderRadius: new BorderRadius.circular(20.0),
                                    ),
                                    splashColor: HexColor("#074BA0"),

                                  ),
                                ),
                                fallbackBuilder: (context) => Center(child: CircularProgressIndicator())
                      ),
                          ),

                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 15,),
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: HexColor("#3655D1"),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Column(
                          children: [
                            SizedBox(height: 20,),
                            SvgPicture.asset(
                              'assets/images/ambulance.svg',
                              color: Colors.white,
                              width: width*0.20,
                            ),
                            SizedBox(height: 5,),
                            Text(
                              "اتصل بألاسعاف" ,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 25
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 30),
                              child: Text(
                                "فى حاله الطوارئ, اضغط على زر الاتصال بسياره اسعارف للاتصال بسياره الاسعاف القريبه للوصول لموقعك" ,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.normal,
                                    fontSize: 15,

                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 20 , vertical: 20),
                              child: Container(
                                width: double.infinity,
                                height: 40,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  gradient: LinearGradient(
                                    begin: Alignment.centerRight,
                                    end: Alignment.centerLeft,
                                    colors: <Color>[
                                      HexColor("#9E171B"),
                                      HexColor("#E03047"),
                                    ],
                                  ),
                                ),
                                child: MaterialButton(
                                  onPressed: (){
                                    launch("tel://123");

                                  },
                                  child: Text(
                                    "اتصال بسياره اسعاف",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 15 ,
                                        fontWeight: FontWeight.w800
                                    ),
                                  ),
                                  shape: new RoundedRectangleBorder(
                                    borderRadius: new BorderRadius.circular(20.0),
                                  ),
                                  splashColor: Colors.red,

                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                floatingActionButton: MaterialButton(
                  onPressed: ()
                  {Navigator.pop(context);} ,
                  height: height*0.057,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.home,
                        size: 35,
                        color: Colors.white,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Text(
                          "الرئيسية",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w600
                          ),

                        ),
                      ),
                    ],
                  ),
                  color: HexColor("#074BA0"),
                  shape: new RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(30.0),
                  ),

                ),
              )
          );
        } ,
      ) ,
    );
  }
}
