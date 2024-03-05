import 'dart:async';
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:ts_system/config/env.dart';
import 'package:ts_system/core/network/custom_exception.dart';
import 'package:ts_system/core/network/log.dart';

class ApiProvider {
  final _apiBaseUrl = EnvConfig.apiURL;

  Future<dynamic> postDataWithImage({
    required String url,
    required dynamic imageFile,
  }) async {
    try {
      final request =
          http.MultipartRequest('POST', Uri.parse("$_apiBaseUrl$url"));

      request.headers['API_KEY'] = 'TT18102023';

      if (kIsWeb) {
        request.files.add(http.MultipartFile.fromBytes(
          'image',
          imageFile,
          filename: 'image.jpg',
        ));
      } else {
        request.files.add(await http.MultipartFile.fromPath(
          'image',
          imageFile.path,
          filename: 'image.jpg',
        ));
      }

      final streamedResponse = await request.send();
      final response = await http.Response.fromStream(streamedResponse);

      if (response.statusCode != 200) return null;
      final responseJson = jsonDecode(response.body);
      return responseJson;
    } catch (e) {
      Log.error("ApiProvider get failed with error: $e");
      return null;
    }
  }

  Future<dynamic> postDataWithFormData({
    required String url,
    required Map<String, String> fields,
    required dynamic imageFile,
  }) async {
    try {
      final request =
          http.MultipartRequest('POST', Uri.parse("$_apiBaseUrl$url"));

      request.headers['API_KEY'] = 'TT18102023';

      if (kIsWeb) {
        request.fields.addAll(fields);
        request.files.add(http.MultipartFile.fromBytes(
          'image',
          imageFile,
          filename: 'image.jpg',
        ));
      } else {
        request.fields.addAll(fields);
        request.files.add(await http.MultipartFile.fromPath(
          'image',
          imageFile.path,
          filename: 'image.jpg',
        ));
      }

      final streamedResponse = await request.send();
      final response = await http.Response.fromStream(streamedResponse);

      if (response.statusCode != 200) return null;
      final responseJson = jsonDecode(response.body);
      return responseJson;
    } catch (e) {
      Log.error("ApiProvider get failed with error: $e");
      return null;
    }
  }

  Future<dynamic> getData({
    required String url,
    Map<String, dynamic>? body,
  }) async {
    var headers = <String, String>{};
    headers["Content-Type"] = "application/json";
    headers["API_KEY"] = "TT18102023";
    headers["Accept"] = "/";

    try {
      dynamic responseJson;

      final response = await http.post(Uri.parse("$_apiBaseUrl$url"),
          headers: headers, body: json.encode(body));

      if (response.statusCode != 200) return null;
      responseJson = _response(response);

      if (responseJson == null) return null;
      return responseJson;
    } on TimeoutException catch (_) {
      Log.error("ApiProvider get failed with timeout");
      return null;
    } catch (e) {
      Log.error("ApiProvider get failed with error: $e");
      return null;
    }
  }

  dynamic _response(http.Response response) {
    switch (response.statusCode) {
      case 200:
        var responseJson = json.decode(response.body.toString());
        return responseJson;
      case 400:
        Log.error(response.body.toString());
        throw BadRequestException(response.body.toString());
      case 401:
      case 403:
        Log.error(response.body.toString());
        throw UnauthorisedException(response.body.toString());
      case 500:
      default:
        Log.error(response.body.toString());
        throw FetchDataException(
            'Error occured while Communication with Server with StatusCode : ${response.statusCode}');
    }
  }
}
