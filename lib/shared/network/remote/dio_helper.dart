import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

class DioHelper
{
     static Dio dio ;
     static void init()
    {
      dio = Dio(
        BaseOptions(
          baseUrl: 'https://newsapi.org/' ,
          receiveDataWhenStatusError: true
        )
      ) ;
    }

   static Future <Response> getData(
     {
  @required String path ,
  @required Map <String,dynamic> query ,
}
        )
    async {
     return  await dio.get(path,queryParameters:query ) ;
    }
}

//https://newsapi.org/v2/top-headlines?country=eg&apiKey=74592581d0744ffc82c62241d987b1f6