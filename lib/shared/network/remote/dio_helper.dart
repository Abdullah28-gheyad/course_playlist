import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

class DioHelper
{
     static Dio dio ;
     static void init()
    {
      dio = Dio(
        BaseOptions(
          baseUrl: 'https://student.valuxapps.com/api/' ,
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

    static Future <Response> postData(
     {
  @required String path ,
       @required Map <String , dynamic> data ,
       Map <String ,dynamic> query ,

}
        ) async
    {
      return await dio.post(path,queryParameters: query ,data: data ) ;
    }
}

//https://newsapi.org/v2/top-headlines?country=eg&apiKey=74592581d0744ffc82c62241d987b1f6