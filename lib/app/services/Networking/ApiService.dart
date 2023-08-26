import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../../Helpers/typedef.dart';
import 'BaseProvider.dart';

class ApiService extends GetxService {
  final BaseProvider _baseProvider;

  ApiService(this._baseProvider);

  Future<List<JSON>> get<T>({
    required String endpoint,
  }) async {
    final response = await getData(endpoint);

    return response.body;
  }

  Future<dynamic> getData(var a) async {
    final response = await http.get(Uri.parse('http://10.0.2.2:7119' + a));

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to fetch data');
    }
  }

  Future<JSON> post<T>({
    required String endpoint,
    JSON? body,
    JSON? query,
    Map<String, String>? headers,
    bool requiresAuthToken = false,
  }) async {
    var customHeaders = {
      'Accept': 'application/json',
      requiresAuthToken ? 'Authorization' : '': '',
    };

    if (headers != null) {
      customHeaders.addAll(headers);
    }

    final response = await _baseProvider.post(endpoint, body,
        headers: customHeaders, query: query);

    return response.body;
  }

  Future<JSON> put<T>({
    required String endpoint,
    JSON? body,
    JSON? query,
    Map<String, String>? headers,
    bool requiresAuthToken = false,
  }) async {
    var customHeaders = {
      'Accept': 'application/json',
      requiresAuthToken ? 'Authorization' : '': '',
    };

    if (headers != null) {
      customHeaders.addAll(headers);
    }

    final response = await _baseProvider.put(endpoint, body,
        headers: customHeaders, query: query);

    return response.body;
  }

  Future<JSON> delete<T>({
    required String endpoint,
    JSON? body,
    JSON? query,
    Map<String, String>? headers,
    bool requiresAuthToken = false,
  }) async {
    var customHeaders = {
      'Accept': 'application/json',
      requiresAuthToken ? 'Authorization' : '': '',
    };

    if (headers != null) {
      customHeaders.addAll(headers);
    }

    final response = await _baseProvider.delete(endpoint,
        headers: customHeaders, query: query);

    return response.body;
  }
}
