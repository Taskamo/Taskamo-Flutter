import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:logger/logger.dart';
import 'package:taskamo/services/local_services/hive_client.dart';
import 'package:taskamo/services/network_services/api_handler.dart';
import 'package:taskamo/services/network_services/api_status.dart';
import 'package:taskamo/services/network_services/api_url.dart';
import 'package:taskamo/utils/categories/hive_categories.dart';

abstract class TaskamoApiClient {
  static String baseUrl = GetUrl().getUrlAPI();
  static String versionUrl = GetUrl().versionUrl();
  static Dio dio = Dio();

  static Future<Map<String, dynamic>> _getHeader() async {
    return {
      "Content-Type": "application/json; charset=UTF-8",
    };
  }

  static Future<Map<String, dynamic>> _getHeaderWithAccessToken() async {
    final accessToken = await _getAccessToken();
    return {
      "Content-Type": "application/json; charset=UTF-8",
      'Authorization': 'Bearer $accessToken'
    };
  }

  static Future<String> _getAccessToken() async {
    return await TaskamoHiveClient.read(
      key: TaskamoHiveCategories.accessToken,
    );
  }

  static Future<ApiHandler> get(
    String url, {
    bool auth = true,
    Map<String, dynamic> query = const {},
  }) async {
    final finalUrl = '$baseUrl$versionUrl$url';
    Map<String, dynamic> header =
        auth ? await _getHeaderWithAccessToken() : await _getHeader();
    Response response = await dio.get(
      finalUrl,
      options: Options(
        headers: header,
      ),
      queryParameters: query,
    );

    ApiHandler responseData = ApiHandler();
    try {
      responseData = StatusCode().checkResponseStatusCode(response);
    } catch (e) {
      responseData.setDataError(errorMassage: 'error');
      Logger().e(responseData.massage);
    }
    if (responseData.status == ResponseStatus.success) {
      Logger().wtf(
        "request: $header \n url : ${Uri.parse(finalUrl).replace(
          queryParameters: query.map(
            (key, value) => MapEntry(
              key,
              value.toString(),
            ),
          ),
        )} \n query : $query \n statusCode : ${response.statusCode} \n body : ${utf8.decode(response.data)} ",
      );
    } else {
      Logger().w(
        "request: $header \n url : $finalUrl \n query : $query \n statusCode : ${response.statusCode} \n body : ${utf8.decode(response.data)} ",
      );
    }
    return responseData;
  }

  static Future<ApiHandler> post(
    String url, {
    String? body,
    bool auth = true,
    Map<String, dynamic> query = const {},
  }) async {
    final finalUrl = '$baseUrl$versionUrl$url';
    Map<String, dynamic> header =
        auth ? await _getHeaderWithAccessToken() : await _getHeader();
    Response response = await dio.post(
      finalUrl,
      data: body,
      options: Options(
        headers: header,
      ),
      queryParameters: query,
    );

    ApiHandler responseData = ApiHandler();
    try {
      responseData = StatusCode().checkResponseStatusCode(response);
    } catch (e) {
      Logger().e(e);
      responseData.setDataError(errorMassage: 'error');
    }
    if (responseData.status == ResponseStatus.success) {
      Logger().i(
        "request: $header \n url : $finalUrl \n req: $body \n statusCode : ${response.statusCode} \n body : ${response.data}",
      );
    } else {
      Logger().w(
        "request: $header \n url : $finalUrl \n req: $body \n statusCode : ${response.statusCode} \n body : ${response.data}",
      );
    }

    return responseData;
  }
}
