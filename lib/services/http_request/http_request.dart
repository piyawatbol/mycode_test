import 'dart:developer';
import 'dart:io';
import 'package:dio/dio.dart';
import '../../config/app_import.dart';
import '../../models/response/response_model.dart';
import '../../utilities/show_log.dart';

class HttpRequest {
  static final Dio dio = Dio();

  static Future<Map<String, String>> buildHeaders({
    bool withAccessToken = false,
  }) async {
    Map<String, String> headers;

    headers = {
      HttpHeaders.contentTypeHeader: "application/json; charset=UTF-8",
    };

    return headers;
  }

  static Future<ResponseModel> post(
    String path, {
    Map<String, dynamic>? body,
    bool withAccessToken = false,
    bool showLog = false,
  }) async {
    final headers = await buildHeaders(
      withAccessToken: withAccessToken,
    );
    try {
      Response response = await dio.post(
        path,
        data: body,
        options: Options(headers: headers),
      );
      return responseSuccess(response, path, "post", showLog);
    } on DioException catch (e) {
      log(e.response!.data.toString());
      return responseError(e, path, "post");
    }
  }

  static Future<ResponseModel> get(
    String path, {
    Map<String, dynamic>? body,
    bool withAccessToken = false,
    bool showLog = false,
  }) async {
    final headers = await buildHeaders(withAccessToken: withAccessToken);
    try {
      final response = await dio.get(
        path,
        queryParameters: body,
        options: Options(headers: headers),
      );

      return responseSuccess(response, path, "get", showLog);
    } on DioException catch (e) {
      // log(e.toString());
      return responseError(e, path, "get");
    }
  }

  static Future<ResponseModel> patch(
    String path, {
    Map<String, dynamic>? body,
    bool withAccessToken = false,
    bool showStatus = false,
  }) async {
    final headers = await buildHeaders(withAccessToken: withAccessToken);
    try {
      Response response = await dio.patch(
        path,
        data: body,
        options: Options(headers: headers),
      );

      return responseSuccess(response, path, "patch", showStatus);
    } on DioException catch (e) {
      log(e.response!.data.toString());
      return responseError(e, path, "patch");
    }
  }

  static Future<ResponseModel> delete(
    String path, {
    Map<String, dynamic>? body,
    bool withAccessToken = false,
    bool showStatus = false,
  }) async {
    final headers = await buildHeaders(withAccessToken: withAccessToken);
    try {
      final response = await dio.delete(
        path,
        data: body,
        options: Options(headers: headers),
      );
      return responseSuccess(response, path, "delete", showStatus);
    } on DioException catch (e) {
      log(e.toString());
      return responseError(e, path, "delete");
    }
  }

  static Future<ResponseModel> postImage(
    String path, {
    FormData? body,
    bool withAccessToken = false,
    bool showStatus = false,
  }) async {
    final headers = await buildHeaders(withAccessToken: withAccessToken);
    try {
      final response = await Dio().post(
        path,
        data: body,
        options: Options(headers: headers),
      );
      return responseSuccess(response, path, "postImg", showStatus);
    } on DioException catch (e) {
      log("error : ${e.message}");
      log(e.toString());
      return responseError(e, path, "postImg");
    }
  }

  static ResponseModel responseSuccess(
      Response response, path, String method, bool showStatus) {
    if (showStatus) {
      log("status $method => ${response.statusCode} $path");
      Log.json(response.data);
    }

    switch (response.statusCode) {
      case 200:
        return ResponseModel(
          isSucces: true,
          data: response.data,
          path: path,
          method: method,
          statusCode: response.statusCode!,
        );
      case 201:
        return ResponseModel(
          isSucces: true,
          data: response.data,
          path: path,
          method: method,
          statusCode: response.statusCode!,
        );
      case 202:
        return ResponseModel(
          isSucces: true,
          data: response.data,
          path: path,
          method: method,
          statusCode: response.statusCode!,
        );
      case 203:
        return ResponseModel(
          isSucces: true,
          data: response.data,
          path: path,
          method: method,
          statusCode: response.statusCode!,
        );
      case 204:
        return ResponseModel(
          isSucces: true,
          data: response.data,
          path: path,
          method: method,
          statusCode: response.statusCode!,
        );
      default:
        throw Exception('Failed to load province');
    }
  }

  static ResponseModel responseError(DioException e, path, String method) {
    Map<String, dynamic> body = {
      "status": "${e.response!.statusCode}",
      "path": "$path",
      "method": method,
      "data": "${e.response!.data}"
    };
    switch (e.response!.statusCode) {
      case 400:
        Log.json(body);
        return ResponseModel(
          isSucces: false,
          data: e.response!.data,
          path: path,
          method: method,
          statusCode: e.response!.statusCode!,
        );
      case 401:
        Log.json(body);

        return ResponseModel(
          isSucces: false,
          data: e.response!.data,
          path: path,
          method: method,
          statusCode: e.response!.statusCode!,
        );
      case 403:
        Log.json(body);
        return ResponseModel(
          isSucces: false,
          data: e.response!.data,
          path: path,
          method: method,
          statusCode: e.response!.statusCode!,
        );
      case 404:
        Log.json(body);
        return ResponseModel(
          isSucces: false,
          data: e.response!.data,
          path: path,
          method: method,
          statusCode: e.response!.statusCode!,
        );
      case 409:
        Log.json(body);
        return ResponseModel(
          isSucces: false,
          data: e.response!.data,
          path: path,
          method: method,
          statusCode: e.response!.statusCode!,
        );
      case 500:
        // AlertError.showPopup("Server Error");
        log("Error => $path");
        log("Error => ${e.response!.statusCode}  Server Error");
        return ResponseModel(
          isSucces: false,
          data: null,
          path: path,
          method: method,
          statusCode: e.response!.statusCode!,
        );
      default:
        log("Error => $path");
        log("Error => ${e.response!.statusCode}  Server Error");
        return ResponseModel(
          isSucces: false,
          data: null,
          path: path,
          method: method,
          statusCode: e.response!.statusCode!,
        );
    }
  }
}
