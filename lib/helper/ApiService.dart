import 'dart:convert';
import 'package:coba1/helper/storage.dart';
import 'package:http/http.dart' as http;

class ApiService {
  final String baseUrl = "http://192.168.1.103/ionic-commerce/public/api";
  // final String baseUrl = "https://ionic-commerce.app/api";

  Future<Map<String, dynamic>> get(String path) async {
    final response = await http.get(Uri.parse('$baseUrl/$path'));

    return _handleResponse(response);
  }

  Future<Map<String, dynamic>> post(
      String path, Map<String, dynamic> body) async {
    final response = await http.post(
      Uri.parse('$baseUrl/$path'),
      body: jsonEncode(body),
      headers: {"Content-Type": "application/json"},
    );

    return _handleResponse(response);
  }

  Future<Map<String, dynamic>> getWithToken(String path, String token) async {
    var token = await Storage().get('token');
    final response = await http.get(
      Uri.parse('$baseUrl/$path'),
      headers: {"Authorization": "Bearer $token"},
    );

    return _handleResponse(response);
  }

  Future<Map<String, dynamic>> postWithToken(
      String path, Map<String, dynamic> body, String token) async {
    var token = await Storage().get('token');
    final response = await http.post(
      Uri.parse('$baseUrl/$path'),
      body: jsonEncode(body),
      headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer $token",
      },
    );

    return _handleResponse(response);
  }

  Map<String, dynamic> _handleResponse(http.Response response) {
    final Map<String, dynamic> result = {
      'statusCode': response.statusCode,
      'data': null,
    };

    if (response.statusCode >= 200 && response.statusCode < 300) {
      result['data'] = jsonDecode(response.body);
    } else {
      result['data'] = {
        'error': 'Failed to fetch data',
      };
    }

    return result;
  }
}
