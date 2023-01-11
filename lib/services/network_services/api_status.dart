import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:taskamo/services/network_services/api_handler.dart';

class StatusCode {
  ApiHandler apiHandler = ApiHandler();

  ApiHandler checkResponseStatusCode(Response response) {
    switch (response.statusCode) {
      case 200:
        apiHandler.setDataSuccess(data: utf8.decode(response.data));
        break;
      case 400:
        apiHandler.setDataError(
          errorMassage: '400',
          data: utf8.decode(response.data),
        );
        break;
      case 401:
        apiHandler.setDataError(errorMassage: '401');
        break;
      case 403:
        apiHandler.setDataError(errorMassage: '403');
        break;
      case 500:
        apiHandler.setDataError(errorMassage: '500');
        break;
      case 404:
        apiHandler.setDataError(
          errorMassage: '404',
          data: utf8.decode(response.data),
        );
        break;
      default:
        apiHandler.setDataError(errorMassage: 'error');
        break;
    }
    return apiHandler;
  }
}
