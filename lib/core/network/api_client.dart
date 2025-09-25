import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:dio/dio.dart';

class ApiClient {
  final Dio _dio = Dio(
    BaseOptions(
      baseUrl:
          dotenv.env['API_URL'] ?? 'https://api.example.com', // URL desde .env
      connectTimeout: const Duration(seconds: 5),
      receiveTimeout: const Duration(seconds: 5),
      headers: {
        'Content-Type': 'application/json',
        // si tienes tokens por defecto en headers, también puedes ponerlos desde dotenv
        'Authorization': 'Bearer ${dotenv.env['API_TOKEN'] ?? ''}',
      },
    ),
  );

  Future<Map<String, dynamic>> post(
    String endpoint,
    Map<String, dynamic> data,
  ) async {
    final response = await _dio.post(endpoint, data: data);
    return response.data;
  }

  Future<Map<String, dynamic>> get(String endpoint) async {
    final response = await _dio.get(endpoint);
    return response.data;
  }
}
