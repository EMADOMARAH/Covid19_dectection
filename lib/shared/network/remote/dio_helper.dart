import 'package:dio/dio.dart';

class DioHelper
{
  static Dio dio;

  static init()
  {
    dio = Dio(
        BaseOptions(
          baseUrl: "http://139.59.188.165/" ,
          receiveDataWhenStatusError: true ,
        )
    );
  }


  static Future<Response> uploadImage({
    dynamic data ,
    Options options
  }) async{
    return await dio.post(
        'get_result',
        data: data,
        options: options
    );
  }

}