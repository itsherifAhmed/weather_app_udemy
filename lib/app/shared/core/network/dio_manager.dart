import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:weather/app/shared/constant/app_value.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:weather/app/shared/utils/utils.dart';

import '../../../domain/requests/location_requests.dart';
import '../../../domain/requests/weather_request.dart';
import '../../../domain/response/location_response.dart';
import '../../../domain/response/weather_response.dart';

class DioManager {
  Dio? _dioInstance;

  Dio? get dio {
    _dioInstance ??= initDio();
    return _dioInstance;
  }

  Dio initDio() {
    final Dio dio = Dio(BaseOptions(
      baseUrl: AppValues.baseUrl,
      headers: <String, dynamic>{},

      connectTimeout: 3000,
      receiveTimeout: 3000,
    ));

    if (!kReleaseMode) {
      dio.interceptors.add(PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        request: true,
        responseBody: true,
        responseHeader: true,
        compact: true,
        maxWidth: 120,
      ));
    }
    return dio;
  }

  void update() => _dioInstance = initDio();

  ///http req
  ///get
  ///post
  ///put
  ///delete
///
///
///
///
   ///get -> url
   Future<Response> get (String url,{Map <String,dynamic>? header, Map <String,dynamic>? json})async{
     return await dio!.get(url,queryParameters: json,options: Options(headers: header)).then((response) {
       return response;
     }).catchError((error){
       errorToast(code: error.response?.statusCode?.toString()??"error",
       msg: error.response?.data?.toString()??"error "
       );
     });
   }

   ///post -> url
   Future<Response> post (String url,{Map <String,dynamic>? header,dynamic data})async{
     return await dio!.post(url,data: data,options: Options(headers: header)).then((response) {
       return response;
     }).catchError((error){
       errorToast(code: error.response?.statusCode?.toString()??"error",
       msg: error.response?.data?.toString()??"error "
       );
     });
   }

   ///put -> url
   Future<Response> put (String url,{Map <String,dynamic>? header,dynamic data})async{
     return await dio!.put(url,data: data,options: Options(headers: header)).then((response) {
       return response;
     }).catchError((error){
       errorToast(code: error.response?.statusCode?.toString()??"error",
       msg: error.response?.data?.toString()??"error "
       );
     });
   }

   ///delete -> url
   Future<Response> delete (String url,{Map <String,dynamic>? header,dynamic data})async{
     return await dio!.delete(url,data: data,options: Options(headers: header)).then((response) {
       return response;
     }).catchError((error){
       errorToast(code: error.response?.statusCode?.toString()??"error",
       msg: error.response?.data?.toString()??"error "
       );
     });
   }



}


