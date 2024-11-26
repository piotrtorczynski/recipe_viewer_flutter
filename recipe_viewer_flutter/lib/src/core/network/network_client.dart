import 'dart:convert';
import 'package:http/http.dart' as http;

import 'network_request.dart';

class NetworkClient {
  final String baseUrl;
  final http.Client httpClient;

  NetworkClient({required this.baseUrl, http.Client? client})
      : httpClient = client ?? http.Client();

  Future<T> send<T>(NetworkRequest<T> request) async {
    final uri = Uri.parse('$baseUrl${request.path}')
        .replace(queryParameters: request.queryParameters);

    late http.Response response;
    switch (request.method.toUpperCase()) {
      case 'GET':
        response = await httpClient.get(uri, headers: request.headers);
        break;
      case 'POST':
        response = await httpClient.post(
          uri,
          headers: request.headers,
          body: request.body != null ? jsonEncode(request.body) : null,
        );
        break;
      case 'PUT':
        response = await httpClient.put(
          uri,
          headers: request.headers,
          body: request.body != null ? jsonEncode(request.body) : null,
        );
        break;
      case 'DELETE':
        response = await httpClient.delete(uri, headers: request.headers);
        break;
      default:
        throw Exception('Unsupported HTTP method: ${request.method}');
    }

    if (response.statusCode >= 200 && response.statusCode < 300) {
      return request.parseResponse(jsonDecode(response.body));
    } else {
      throw Exception('HTTP Error: ${response.statusCode} ${response.body}');
    }
  }
}
