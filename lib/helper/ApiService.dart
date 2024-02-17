import 'dart:convert';
import 'package:coba1/helper/storage.dart';
import 'package:http/http.dart' as http;
import 'package:dio/dio.dart';

class ApiService {
  final String baseUrl = "http://192.168.1.103/ionic-commerce/public/api/";
  // final String baseUrl = "https://ionic-commerce.app/api";

  Future<Map<String, dynamic>> get(String path) async {
    var response = await Dio().get(
      baseUrl + path,
      options: Options(
        headers: {
          "Content-Type": "application/json",
        },
      ),
    );
    return handleResponse(response);
  }

  Future<Map<String, dynamic>> post(
      String path, Map<String, dynamic> body) async {
    var response = await Dio().post(baseUrl + path,
        options: Options(
          headers: {
            "Content-Type": "application/json",
          },
        ),
        data: body);
    return handleResponse(response);
  }

  Future<Map<String, dynamic>> getWithToken(String path) async {
    var token = await Storage().get('token');
    var response = await Dio().get(
      "https://reqres.in/api/users",
      options: Options(
        headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer $token"
        },
      ),
    );

    return handleResponse(response);
  }

  Future<Map<String, dynamic>> postWithToken(
    String path,
    Map<String, dynamic> body,
  ) async {
    var token = await Storage().get('token');
    var response = await Dio().post(baseUrl + path,
        options: Options(
          headers: {
            "Content-Type": "application/json",
            "Authorization": "Bearer $token",
          },
        ),
        data: body);
    return handleResponse(response);
  }

  Map<String, dynamic> handleResponse(Response response) {
    final Map<String, dynamic> result = {
      'statusCode': response.statusCode,
      'data': null,
    };

    if (response.statusCode! >= 200 && response.statusCode! < 300) {
      result['data'] = response.data;
    } else {
      result['data'] = {
        'error': 'Failed to fetch data',
      };
    }

    return result;
  }
}
