import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';
import 'package:movieapp/src/models/app_config.dart';

// This class is responsible to handle the http services
class HttpService {
  final Dio dio = Dio();
  final GetIt getIt = GetIt.instance;
  String apiKey = "";
  String baseUrl = "";

  HttpService() {
    AppConfig appConfig = getIt.get<AppConfig>();
    apiKey = appConfig.apiKey!;
    baseUrl = appConfig.baseApiUrl!;
  }

  Future<Response> getData(String _path,
      {required Map<String, dynamic> query}) {
    try {
      final String _url = "$baseUrl/$_path";
      Map<String, dynamic> _query = {
        "api_key": apiKey,
        "language": "en-US",
      };
      if (query.isNotEmpty) {
        _query.addAll(query);
      }
      return dio.get(_url, queryParameters: _query);
    } on DioError catch (error) {
      debugPrint("unable to perform get request");
      debugPrint("Error $error");
      throw const HttpException("HTTP Exception ocurred!");
    }
  }
}
