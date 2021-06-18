import 'package:covid_19/modules/home/cubit/states.dart';
import 'package:covid_19/shared/network/local/cache_helper.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeCubit extends Cubit<HomeStates>{

  HomeCubit() : super(HomeInitialState());

  static HomeCubit get(context) => BlocProvider.of(context);

  String userName =  CacheHelper.getData(key: "name");








}