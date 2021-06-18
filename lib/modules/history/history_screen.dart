import 'package:covid_19/modules/history/cubit/cubit.dart';
import 'package:covid_19/modules/history/cubit/states.dart';
import 'package:covid_19/modules/home/home_screen.dart';
import 'package:covid_19/shared/components/components.dart';
import 'package:covid_19/shared/components/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_conditional_rendering/conditional.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hexcolor/hexcolor.dart';

class HistoryScreen extends StatelessWidget
{
  const HistoryScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context)
  {
    return BlocProvider(
      create: (context)
      => HistoryCubit()..fetchData() ,
      child: BlocConsumer<HistoryCubit , HistoryStates>(
        listener: (context , state)
        {
          // TODO: implement listener
          if (state is DeleteHistorySuccessState) {
            navigateAndFinish(context, HomeScreen());
          }
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
                        SizedBox(
                          height: 20,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20.0 , vertical: 5),
                          child: Row(
                            children: [
                              Expanded(
                                child: Text(
                                  "التحاليل السابقة" ,
                                  style: TextStyle(
                                      color: HexColor("#074BA0") ,
                                      fontSize: 20 ,
                                      fontWeight: FontWeight.bold
                                  ) ,
                                ),
                              ) ,
                              MaterialButton(
                                onPressed: ()
                                {
                                  HistoryCubit.get(context).showMyDialog(context: context);
                                } ,
                                height: 40,
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 20),
                                      child: Text(
                                        "مسح الكل",
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
                            ],
                          ),
                        ),
                        Conditional.single(
                          context: context,
                          conditionBuilder: (context) => state is! HistoryFetchingState,
                          widgetBuilder: (context)=>ListView.separated(
                            itemBuilder:(BuildContext context, int index) =>HistoryCubit.get(context).myItems[index],
                            separatorBuilder:(BuildContext context, int index)=> SizedBox(height: 20,),
                            itemCount: HistoryCubit.get(context).myItems.length,
                            shrinkWrap: true,
                            scrollDirection: Axis.vertical,
                            physics:BouncingScrollPhysics(),
                          ),
                          fallbackBuilder: (context) => Column(
                            children: [
                              SizedBox(height: 100,),
                              CircularProgressIndicator(),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                'لا يوجد تحاليل سابقه لعرضها'
                              ),
                            ],
                          )
                        ),
                        SizedBox(
                          height: 20,
                        ),
                      ],
                    ),
                  ),
                  floatingActionButton: Padding(
                    padding: const EdgeInsets.only(right: 30),
                    child: Row(
                      children: [

                        MaterialButton(
                            child: Text(
                                'Logout',
                                style: TextStyle(
                                    color: Colors.white ,
                                    fontWeight: FontWeight.bold
                                )
                            ),
                            height: height*0.045,
                            shape: new RoundedRectangleBorder(
                              borderRadius: new BorderRadius.circular(30.0),
                            ),
                           // color: HexColor("#074BA0"),
                            color: HexColor('#D01A46'),
                            onPressed:(){
                              HistoryCubit.get(context).logout(context);

                            }
                        ) ,
                        Spacer(),
                        MaterialButton(
                          onPressed: ()
                          {
                            navigateReplacement(context, HomeScreen());
                          } ,
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
                          height: height*0.057,
                          shape: new RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(30.0),
                          ),

                        ),
                      ],
                    ),
                  )


                ),
              )
          );
        } ,
      ) ,
    );
  }
}
