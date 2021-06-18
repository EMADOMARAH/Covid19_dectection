import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:url_launcher/url_launcher.dart';

import 'constants.dart';

Widget typeButton({
  @required String text,
  @required Function function,
  bool isClicked,
}) =>
    Expanded(
      child: GestureDetector(
        onTap: function,
        child: Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
            border: isClicked
                ? Border.all(
                    color: Color(0xffD1424B),
                  )
                : Border.all(
                    color: Color(0xff042650),
                  ),
            borderRadius: BorderRadius.circular(20),
            color: isClicked ? Color(0xffD1424B) : Colors.white,
          ),
          child: Text(
            text,
            style: TextStyle(
              fontSize: 20,
              color: isClicked ? Colors.white : Color(0xff074BA0),
            ),
          ),
        ),
      ),
    );



Widget registerHeader({
  double height,
  double width,
  String text1,
  String text2,
}) =>
    Stack(
      children: [
        Container(
          child: Image.asset('assets/images/curve.png'),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 25.5),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      text1,
                      style: TextStyle(color: Colors.white, fontSize: 25, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      text2,
                      style: TextStyle(color: Colors.white, fontSize: 13, fontWeight: FontWeight.w800),
                    ),
                  ],
                ),
              ),
              Container(
                width: width * 0.4,
                child: Center(
                  child: Image.asset(
                    "assets/images/logo.png",
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );

Widget defaultFormField({
  @required TextEditingController controller,
  @required String label,
  TextInputType textInputType,
  bool isPassword = false,
  IconData suffix,
  IconData prefix,
  int maxLength,
  Function validate,
  Function onSubmit,
  Function onChanged,
  Function suffixPressed,
}) =>
    TextFormField(
      controller: controller,
      keyboardType: textInputType,
      obscureText: isPassword,
      onFieldSubmitted: onSubmit,
      validator: validate,
      onChanged: onChanged,
      maxLength: maxLength,
      decoration: InputDecoration(
        labelText: label,
        labelStyle: TextStyle(
          fontSize: 15,
        ),
        suffixIcon: suffix != null
            ? IconButton(
                onPressed: suffixPressed,
                icon: Icon(
                  suffix,
                ),
              )
            : null,
        prefixIcon: prefix != null
            ? Icon(
                prefix,
              )
            : null,
        border: OutlineInputBorder(
          borderRadius: const BorderRadius.all(
            const Radius.circular(15.0),
          ),
        ),
      ),
    );

Widget DoctorsItem(
        {@required String image,
        @required String doctorName,
        @required String spec,
        @required String exp,
        @required String phone}) =>
    Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
          decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: Colors.grey, width: 2),
              borderRadius: BorderRadius.circular(8)),
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              children: [
                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    CircleAvatar(
                      radius: 27.0,
                      backgroundImage: AssetImage(
                        '${image}',
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '${doctorName}',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: HexColor("#074BA0"),
                          ),
                        ),
                        Row(
                          children: [
                            Text(
                              '${spec}',
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: HexColor("#074BA0").withOpacity(0.8),
                              ),
                            ),
                            SizedBox(
                              width: 70,
                            ),
                            Text(
                              '${exp}',
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: HexColor("#074BA0").withOpacity(0.8),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                      ],
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: Row(
                    children: [
                      typeButton(
                          text: "حجز معاد",
                          function: () {
                            Fluttertoast.showToast(
                                msg: "قريبا ستتوفر الخدمه",
                                toastLength: Toast.LENGTH_SHORT,
                                timeInSecForIosWeb: 1,
                                backgroundColor: Colors.blue,
                                textColor: Colors.white,
                                fontSize: 16.0);
                          },
                          isClicked: false),
                      Spacer(),
                      typeButton(
                        text: "اتصال",
                        function: () {
                          launch("tel://${phone}");
                        },
                        isClicked: false,
                      ),
                    ],
                  ),
                )
              ],
            ),
          )),
    );

Widget historyItem(
        {bool positive = false, String date = "14/5/2021", String name = "عماد عبد الحليم", String result = "سلبى"}) =>
    Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: positive ? HexColor('#D01A46') : HexColor('#7AA464'),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Padding(
          padding: const EdgeInsets.only(right: 30),
          child: Container(
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(topLeft: Radius.circular(15), bottomLeft: Radius.circular(15))),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          'نتيجة تحليل كرونا',
                          style: TextStyle(color: HexColor("#042650"), fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                      ),
                      Text(
                        date,
                        style: TextStyle(
                          color: HexColor("#042650"),
                          fontSize: 14,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ],
                  ),
                  Text(
                    "الاسم : ${name}",
                    style: TextStyle(color: HexColor("#042650"), fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'النتيجه : ${result}',
                    style: TextStyle(color: HexColor("#042650"), fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );

void navigateTo(BuildContext context, Widget screen) {
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => screen),
  );
}

void navigateReplacement(BuildContext context, Widget screen) {
  Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context) => screen));
}

void navigateAndFinish(context, widget) =>
    Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => widget), (route) => false);
