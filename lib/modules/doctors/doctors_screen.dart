import 'package:covid_19/modules/doctors/cubit/cubit.dart';
import 'package:covid_19/modules/doctors/cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:covid_19/shared/components/components.dart';


class DoctorsScreen extends StatelessWidget
{
  const DoctorsScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context)
  {
    return BlocProvider(
      create: (context) => DoctorsCubit() ,
      child: BlocConsumer<DoctorsCubit , DoctorsStates>(
        listener: (context , state)
        {
          // TODO: implement listener
        } ,
        builder: (context , state)
        {
          var cubit = DoctorsCubit.get(context);
          double width = MediaQuery.of(context).size.width;
          double height = MediaQuery.of(context).size.height;
          return Directionality(

            textDirection: TextDirection.rtl,
            child: SafeArea(
              child: Scaffold(
                body: SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 20,),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0 , vertical: 20),
                        child:Text(
                          "زياره منزليه" ,
                          style: TextStyle(
                              color: HexColor("#074BA0") ,
                              fontSize: 20 ,
                              fontWeight: FontWeight.bold
                          ) ,
                        ) ,
                      ),
                      SizedBox(height: 20,),
                      ListView.separated(
                        shrinkWrap: true,
                          physics: BouncingScrollPhysics(),
                          itemBuilder: (context, index)=> DoctorsItem(image: cubit.doctorsImages[index], doctorName: cubit.doctorsNames[index] ,exp: cubit.doctorsExp[index] , spec: cubit.doctorsSpec[index] , phone: cubit.doctorsPhone[index]),
                          separatorBuilder: (context, index) => SizedBox(
                            height: 10,
                          ),
                          itemCount: cubit.doctorsNames.length)
                    ],
                  ),
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
              ),
            ),
          );
        } ,
      ) ,
    );
  }
}
