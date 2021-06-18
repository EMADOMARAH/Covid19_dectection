import 'package:covid_19/modules/home/home_screen.dart';
import 'package:covid_19/modules/signup/signup_screen.dart';
import 'package:covid_19/modules/singin/cubit/cubit.dart';
import 'package:covid_19/modules/singin/cubit/states.dart';
import 'package:covid_19/shared/components/components.dart';
import 'package:covid_19/shared/components/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_conditional_rendering/conditional.dart';
import 'package:flutter_conditional_rendering/conditional_switch.dart';

class SignInScreen extends StatelessWidget {



  @override
  Widget build(BuildContext context) {
    return BlocProvider(
  create: (context) => SignInCubit(),
  child: BlocConsumer<SignInCubit, SignInStates>(
  listener: (context, state) {
    // TODO: implement listener]

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
              children: [
                registerHeader(
                  height: height*0.345,
                  width: width,
                  text1: "تسجيل الدخول",
                  text2:  "تسجيل الدخول لحسابك",
                ),
                SizedBox(
                  height: 40,
                ),
                Padding(
                    padding: EdgeInsets.symmetric(horizontal: 25.0),
                  child: Form(
                    key: SignInCubit.get(context).formKey,
                    child: Column(
                      children: [
                        defaultFormField(
                          controller: SignInCubit.get(context).emailController,
                          textInputType: TextInputType.emailAddress,
                          label: "البريد الالكترونى",
                            validate: (value){
                              if (value.toString().isEmpty) {
                                return 'لابد من كتابه البريد الالكترونى';
                              }
                              return null;
                            }
                        ),
                        SizedBox(
                          height: 20,
                        ),

                        defaultFormField(
                          controller: SignInCubit.get(context).passwordController,
                          textInputType: TextInputType.visiblePassword,
                          label: "كلمه السر",
                          suffix: SignInCubit.get(context).suffix,
                          isPassword: SignInCubit.get(context).isPassword,
                          suffixPressed: (){
                            SignInCubit.get(context).changePasswordVisibility();
                          },
                          validate: (value){
                            if (value.toString().isEmpty) {
                              return 'لابد من كتابه كلمه السر';
                            }
                            return null;
                          }

                        ),
                        SizedBox(
                          height: 40,
                        ),
                        Conditional.single(
                          context: context,
                          conditionBuilder: (context)=>true,
                          widgetBuilder: (context)=>
                              TextButton(
                                onPressed: (){
                                  if (SignInCubit.get(context).formKey.currentState.validate()) {
                                    SignInCubit.get(context).userLogin(
                                        email: SignInCubit.get(context).emailController.text,
                                        password: SignInCubit.get(context).passwordController.text,
                                        context: context
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
                        SizedBox(
                          height: 15,
                        ),
                        TextButton(
                          onPressed: (){},
                          style: ButtonStyle(

                            padding:MaterialStateProperty.all(EdgeInsets.zero),
                            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                            overlayColor: MaterialStateProperty.all(Colors.transparent)
                          ),
                          child: Text(
                              "نسيت كلمه السر؟",
                              style: TextStyle(
                                color: Color(0xff2D3462),
                                fontWeight: FontWeight.w600,

                              ),
                            ),
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
                                "مستخدم جديد؟",
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
                                navigateReplacement(context, SignUpScreen());
                              },
                              style: ButtonStyle(
                                padding:MaterialStateProperty.all(EdgeInsets.zero),
                                overlayColor: MaterialStateProperty.all(Colors.transparent),
                                 alignment: Alignment.centerRight,
                                // )
                                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                              ),

                              child: Text(
                                "تسجيل",
                                style: TextStyle(
                                    color: Color(0xffD1424B),
                                    fontWeight: FontWeight.w800
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10,
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
                        SizedBox(
                          height: 10,
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
