import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:logger/logger.dart';
import 'package:taskamo/services/local_services/hive_client.dart';
import 'package:taskamo/services/network_services/api_handler.dart';
import 'package:taskamo/services/network_services/api_status.dart';
import 'package:taskamo/services/network_services/api_url.dart';
import 'package:taskamo/utils/categories/api_categories.dart';
import 'package:taskamo/utils/categories/hive_categories.dart';

abstract class DaratoApiClient {
  static String baseUrl = GetUrl().getUrlAPI();
  static String versionUrl = GetUrl().versionUrl();
  static Dio dio = Dio();

  static Future<Map<String, String>> getHeader() async {
    return {
      "Content-Type": "application/json; charset=UTF-8",
    };
  }

  static Future<Map<String, String>> getHeaderWithAccessToken() async {
    final accessToken = await getAccessToken();
    return {
      "Content-Type": "application/json; charset=UTF-8",
      'Authorization': 'Bearer $accessToken'
    };
  }

  static Future<String> getAccessToken() async {
    // final expireTime =
    //     await TaskamoHiveClient.read(key: TaskamoHiveCategories.expireTime);
    if (
        // DaratoTimeStamp.isTimeToRefresh(expireTime)
        false) {
      // return getAccessTokenFromRefreshToken();
    } else {
      return await TaskamoHiveClient.read(
        key: TaskamoHiveCategories.accessToken,
      );
    }
  }

  // static Future<String> getAccessTokenFromRefreshToken() async {
  //   final accessToken = await TaskamoHiveClient.read(
  //     key: TaskamoHiveCategories.accessToken,
  //   );
  //   final refreshToken = await TaskamoHiveClient.read(
  //     key: TaskamoHiveCategories.refreshToken,
  //   );
  //   final finalUrl = '$baseUrl$versionUrl${TaskamoAPICategories.refresh}';
  //   Response response = await dio.post(
  //     finalUrl,
  //     headers: {
  //       "Content-Type": "application/json; charset=UTF-8",
  //       'Authorization': 'Bearer $accessToken'
  //     },
  //     data: {
  //       "refresh": refreshToken,
  //     },
  //     // requestRefreshTokenModelToMap(
  //     //   RequestRefreshTokenModel(
  //     //     refreshToken: refreshToken,
  //     //   ),
  //     // ),
  //   );
  //   ApiHandler responseData = ApiHandler();
  //   try {
  //     responseData = StatusCode().checkResponseStatusCode(response);
  //   } catch (e) {
  //     responseData.setDataError(errorMassage: 'error');
  //   }
  //   Logger().wtf(
  //     "url : $finalUrl \n statusCode : ${response.statusCode} \n body : ${response.body}",
  //   );
  //   if (responseData.status == ResponseStatus.success) {
  //     RefreshTokenModel refreshTokenModel = refreshTokenModelFromMap(
  //       responseData.data,
  //     );
  //     await DaratoHiveClient.writeSecure(
  //       key: DaratoHiveCategories.accessToken,
  //       value: refreshTokenModel.accessToken,
  //     );
  //     await DaratoHiveClient.writeSecure(
  //       key: DaratoHiveCategories.expireTime,
  //       value: refreshTokenModel.expiresIn,
  //     );
  //     return refreshTokenModel.accessToken;
  //   }
  //   return await DaratoHiveClient.readSecure(
  //     key: DaratoHiveCategories.accessToken,
  //   );
  // }

  static Future<ApiHandler> apiRequestGET(
    String url, {
    bool auth = true,
    Map<String, dynamic> query = const {},
  }) async {
    final finalUrl = '$baseUrl$versionUrl$url';
    Map<String, String> header =
        auth ? await getHeaderWithAccessToken() : await getHeader();
    Response response = await dio.get(
      // Uri.parse(finalUrl).replace(
      //   queryParameters: query.map(
      //     (key, value) => MapEntry(
      //       key,
      //       value.toString(),
      //     ),
      //   ),
      // ),
      // headers: header,
      url,
      options: Options(
        headers: header,
        // sendTimeout:
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

  static Future<ApiHandler> apiRequestPOST(
    String url, {
    String? body,
    bool auth = true,
  }) async {
    final finalUrl = '$baseUrl$versionUrl$url';
    Map<String, String> header =
        auth ? await getHeaderWithAccessToken() : await getHeader();
    Response response = await dio.post(
        // Uri.parse(finalUrl),
        // headers: header,
        // // body: jsonEncode(body),
        // body: body,
        url,
        data: body,
        options: Options(
          headers: header,
        ));

    ApiHandler responseData = ApiHandler();
    try {
      responseData = StatusCode().checkResponseStatusCode(response);
    } catch (e) {
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
