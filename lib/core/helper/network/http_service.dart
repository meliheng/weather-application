import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:weatherapp/core/constants/api_constants.dart';

class HttpService {
  final String baseUrl;
  late Map<String, String>? defaultHeaders;

  HttpService({
    this.baseUrl = ApiConstants.weatherBaseUrl,
    this.defaultHeaders,
  }) {
    defaultHeaders ??= {
      'Content-Type': 'application/json',
      'x-rapidapi-host': dotenv.env['RAPID_API_HOST']!,
      'x-rapidapi-key': dotenv.env['RAPID_API_KEY']!,
    };
  }

  Future<http.Response> get(
    String endpoint, {
    Map<String, String>? headers,
    Map<String, dynamic>? queryParameters,
  }) async {
    final url = Uri.parse(
      '$baseUrl$endpoint?${queryParameters?.entries.map((e) => '${e.key}=${e.value}').join('&')}',
    );
    try {
      final response = await http
          .get(url, headers: _mergeHeaders(headers))
          .timeout(const Duration(seconds: 10));
      _logRequest('GET', url.toString(), null, response);
      return _handleResponse(response);
    } catch (e) {
      throw Exception('GET request failed: $e');
    }
  }

  http.Response _handleResponse(http.Response response) {
    if (response.statusCode >= 200 && response.statusCode < 300) {
      return response;
    } else {
      throw Exception(
        'HTTP Error: ${response.statusCode}, Body: ${response.body}',
      );
    }
  }

  Map<String, String> _mergeHeaders(Map<String, String>? headers) {
    return {...defaultHeaders!, if (headers != null) ...headers};
  }

  void _logRequest(
    String method,
    String url,
    Object? body,
    http.Response response,
  ) {
    print('''
      [$method] $url
      Request Body: ${body ?? 'N/A'}
      Response: ${response.statusCode} - ${response.body}
    ''');
  }
}
