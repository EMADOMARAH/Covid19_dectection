import 'package:covid_19/modules/ambulane/cubit/states.dart';
import 'package:covid_19/modules/doctors/cubit/states.dart';
import 'package:covid_19/shared/network/local/cache_helper.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class  DoctorsCubit extends Cubit< DoctorsStates>{

  DoctorsCubit() : super(DoctorsInitialState());

  static  DoctorsCubit get(context) => BlocProvider.of(context);

  List<String>doctorsImages=[
    'assets/images/khairy.jpg' ,
    'assets/images/dabash.jpg' ,
    'assets/images/emad.jpg',
    'assets/images/harry.jpg',
    'assets/images/semba.png',
    'assets/images/zazo.png',
    'assets/images/skar.jpg',
    'assets/images/bomba.jpg',
    'assets/images/temon.png',
  ];

  List<String>doctorsNames=[
    'د.محمود' ,
    'د.احمد' ,
    'د.عماد' ,
    'د.هارى' ,
    'د.سيمبا' ,
    'د.زازو' ,
    'د.سكار' ,
    'د.بومبا' ,
    'د.تيمون' ,
  ];

  List<String>doctorsSpec=[
    'دكتور امراض قلب' ,
    'دكتور امراض صدر' ,
    'دكتور امراض قلب' ,
    'دكتور امراض باطنه' ,
    'دكتور امراض باطنه' ,
    'دكتور امراض باطنه' ,
    'دكتور امراض باطنه' ,
    'دكتور امراض باطنه' ,
    'دكتور امراض باطنه' ,
  ];
  List<String>doctorsExp=[
    '15 سنه خبره' ,
    '13 سنه خبره' ,
    '15 سنه خبره' ,
    '12 سنه خبره' ,
    '10 سنه خبره' ,
    '8 سنه خبره' ,
    '9 سنه خبره' ,
    '7 سنه خبره' ,
    '12 سنه خبره' ,
  ];

  List<String>doctorsPhone=[
    '01016689126',
    '01008502479' ,
    '01096918681' ,
    '01096918681' ,
    '01096918681' ,
    '01096918681' ,
    '01096918681' ,
    '01096918681' ,
    '01096918681' ,
  ];




}