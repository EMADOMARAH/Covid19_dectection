import 'package:covid_19/modules/home/home_screen.dart';
import 'package:covid_19/modules/signup/cubit/cubit.dart';
import 'package:covid_19/modules/signup/cubit/states.dart';
import 'package:covid_19/modules/singin/signin_screen.dart';
import 'package:covid_19/shared/components/auth_back.dart';
import 'package:covid_19/shared/components/components.dart';
import 'package:covid_19/shared/components/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_conditional_rendering/conditional.dart';

class SignUpScreen extends StatelessWidget {


  bool individual = true;
  bool hospital = false;
  //bool isClicked = true;

  //var height = MediaQuery.of(context).size.height;
  @override
  Widget build(BuildContext context) {
    
    return BlocProvider(
  create: (context) => SignUpCubit(),
  child: BlocConsumer<SignUpCubit, SignUpStates>(
  listener: (context, state) {

  },
  builder: (context, state) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Directionality(
      textDirection: TextDirection.rtl,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: background,
          body: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Stack(
                  children: [
                    Container(child: Image.asset('assets/images/curve.png'),),
                    Padding(
                      padding: const EdgeInsets.only(right: 25.0),
                      child: Row(
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "تسجيل",
                                  style: TextStyle(color: Colors.white, fontSize: width*0.069, fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  "حساب جديد",
                                  style: TextStyle(color: Colors.white, fontSize: width*0.069, fontWeight: FontWeight.w800),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            child: Center(
                              child: Image.asset(
                                "assets/images/logo.png",
                                width: width*0.51,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                /*Container(
                  height: height*0.286,
                  padding: EdgeInsets.symmetric(horizontal: 25.0),
                  decoration: BoxDecoration(
                    image: DecorationImage(image: AssetImage('assets/images/curve.png'),fit: BoxFit.cover),
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        Color(0xff074BA0),
                        Color(0xff042650),
                      ],
                    ),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "تسجيل",
                              style: TextStyle(color: Colors.white, fontSize: width*0.069, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              "حساب جديد",
                              style: TextStyle(color: Colors.white, fontSize: width*0.069, fontWeight: FontWeight.w800),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        child: Center(
                          child: Image.asset(
                            "assets/images/logo.png",
                            width: width*0.51,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),*/
                SizedBox(
                  height: 25,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Form(
                    key: SignUpCubit.get(context).formKey,
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: GestureDetector(
                                onTap: () {
                                  SignUpCubit.get(context).changeUserType();
                                },
                                child: Container(
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    border: SignUpCubit.get(context).isUser
                                        ? Border.all(
                                      color: Color(0xffD1424B),
                                    )
                                        : Border.all(
                                      color: Color(0xff042650),
                                    ),
                                    borderRadius: BorderRadius.circular(20),
                                    color: SignUpCubit.get(context).userColor,
                                  ),
                                  child: Text(
                                    "فرد",
                                    style: TextStyle(
                                      fontSize: 20,
                                      color: SignUpCubit.get(context).userFontColor,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Expanded(
                              child: GestureDetector(
                                onTap: () {
                                 SignUpCubit.get(context).changeUserType();
                                },
                                child: Container(
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    border: SignUpCubit.get(context).isHospital
                                        ? Border.all(
                                      color: Color(0xffD1424B),
                                    )
                                        : Border.all(
                                      color: Color(0xff042650),
                                    ),
                                    borderRadius: BorderRadius.circular(20),
                                    color: SignUpCubit.get(context).hospitalColor,
                                  ),
                                  child: Text(
                                    "مستشفى",
                                    style: TextStyle(
                                      fontSize: 20,
                                      color: SignUpCubit.get(context).hospitalFontColor,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 25,
                        ),
                        defaultFormField(
                          controller: SignUpCubit.get(context).signUpNameController,
                          label: "الاسم",
                          validate: (value){
                            if (value.toString().isEmpty) {
                              return 'لابد من كتابه الاسم';
                            }
                            return null;
                          },
                          isPassword: false,
                          textInputType: TextInputType.text,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        defaultFormField(
                          controller: SignUpCubit.get(context).signUpEmailController,
                          label: "الريد الالكترونى",
                          validate: (value){
                            if (value.toString().isEmpty) {
                              return 'لابد من كتابه البريد الالكترونى';
                            }
                            return null;
                          },
                          isPassword: false,
                          textInputType: TextInputType.emailAddress,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        defaultFormField(
                          controller: SignUpCubit.get(context).signUpPasswordController,
                          label: "كلمه السر",
                          suffixPressed: ()=>SignUpCubit.get(context).changePasswordVisibility(),
                          isPassword: SignUpCubit.get(context).isPassword,
                          suffix: SignUpCubit.get(context).suffix,
                          textInputType: TextInputType.visiblePassword,
                          validate: (String value){
                            if (value.isEmpty) {
                              return 'لابد من كتابه كلمه السر';
                            }
                            return null;
                          },
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        defaultFormField(
                          controller: SignUpCubit.get(context).signUpPhoneController,
                          label: "رقم التلفون",
                          isPassword: false,
                          textInputType: TextInputType.phone,
                          maxLength: 11,
                          validate: (value){
                            if (value.toString().isEmpty) {
                              return 'لابد من كتابه رقم التلفون';
                            }
                            return null;
                          },
                        ),
                        Conditional.single(
                          context: context,
                          conditionBuilder: (context)=>state is! SignUpLoadingState,
                          widgetBuilder: (context)=>
                              TextButton(
                                onPressed: (){
                                  if (SignUpCubit.get(context).formKey.currentState.validate()) {
                                    SignUpCubit.get(context).userRegister(
                                        name: SignUpCubit.get(context).signUpNameController.text,
                                        email: SignUpCubit.get(context).signUpEmailController.text,
                                        password: SignUpCubit.get(context).signUpPasswordController.text,
                                        phone: SignUpCubit.get(context).signUpPhoneController.text,
                                        isUser: SignUpCubit.get(context).isUser,
                                        context: context,
                                    );

                                  }
                                },
                                style: ButtonStyle(
                                    overlayColor: MaterialStateProperty.all(Color(0xffb32d36)),
                                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                    backgroundColor: MaterialStateProperty.all(Color(0xffD1424B)),
                                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                        RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(30.0),
                                          //side: BorderSide(color: Colors.red)
                                        )
                                    )
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.fromLTRB(25,0,25,0),
                                  child: Text(
                                    "تسجيل الدخول",
                                    style: TextStyle(
                                      fontSize: 17,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      backgroundColor: Colors.transparent,
                                    ),
                                  ),
                                ),
                              ),
                          fallbackBuilder: (context) =>
                              Center(child: CircularProgressIndicator(),),

                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            TextButton(
                              onPressed: (){},
                              style: ButtonStyle(
                                padding:MaterialStateProperty.all(EdgeInsets.zero),
                                overlayColor: MaterialStateProperty.all(Colors.transparent),
                                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                              ),
                              child: Text(
                                "لديك حساب؟",
                                style: TextStyle(
                                    color: Color(0xff2D3462),
                                    fontWeight: FontWeight.w600
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            TextButton(
                              onPressed: (){
                                navigateReplacement(context, SignInScreen());
                              },
                              style: ButtonStyle(
                                padding:MaterialStateProperty.all(EdgeInsets.zero),
                                overlayColor: MaterialStateProperty.all(Colors.transparent),
                                alignment: Alignment.centerRight,
                                // )
                                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                              ),

                              child: Text(
                                "تسجيل دخول",
                                style: TextStyle(
                                    color: Color(0xffD1424B),
                                    fontWeight: FontWeight.w800
                                ),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Expanded(
                                child:Divider(
                                  color: Colors.grey[400],
                                  thickness: 2,
                                )
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 15),
                              child: Text(
                                "او",
                                style: TextStyle(
                                    color: Color(0xff2D3462),
                                    fontSize: 19,
                                    fontWeight: FontWeight.bold
                                ),
                              ),
                            ),
                            Expanded(
                                child:Divider(
                                  color: Colors.grey[400],
                                  thickness: 2,
                                )
                            ),

                          ],
                        ),
                        Row(
                          children: [
                            Spacer(
                              flex: 1,
                            ),
                            Image.asset(
                              "assets/images/face.png",

                            ),
                            Spacer(
                              flex: 2,
                            ),
                            Image.asset(
                              "assets/images/gmail.png",

                            ),
                            Spacer(
                              flex: 1,
                            ),
                          ],
                        ),


                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  },
),
);
  }
}


