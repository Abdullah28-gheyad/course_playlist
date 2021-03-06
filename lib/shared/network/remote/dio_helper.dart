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
         Map <String,dynamic> query ,
        String authorization ,
      }
      )
  async {
    dio.options.headers={
      'Authorization':authorization ,
      'Content-Type':'application/json' ,
      'lang':'en' ,
    } ;
    return  await dio.get(path,queryParameters:query ) ;
  }

  static Future <Response> postData(
      {
        @required String path ,
        @required Map <String , dynamic> data ,
        Map <String ,dynamic> query ,
        String authorization  ,
      }
      ) async
  {
    dio.options.headers={
      'Authorization':authorization ,
      'Content-Type':'application/json' ,
      'lang':'en' ,
    } ;
    return await dio.post(path,queryParameters: query ,data: data ) ;
  }



  static Future <Response> putData(
      {
        @required String path ,
        @required Map <String , dynamic> data ,
        Map <String ,dynamic> query ,
        String authorization  ,
      }
      ) async
  {
    dio.options.headers={
      'Authorization':authorization ,
      'Content-Type':'application/json' ,
      'lang':'en' ,
    } ;
    return await dio.put(path,queryParameters: query ,data: data ) ;
  }


}

//https://newsapi.org/v2/top-headlines?country=eg&apiKey=74592581d0744ffc82c62241d987b1f6