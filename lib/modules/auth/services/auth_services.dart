import '../../../core/network/api_client.dart';
import '../models/auth_dto.dart';

class AuthApiService {
  final ApiClient _apiClient = ApiClient();

  Future<LoginResponse?> login(LoginRequest request) async {
    try {
      final response = await _apiClient.post('/auth/login', request.toJson());
      return LoginResponse.fromJson(response);
    } catch (e) {
      return null;
    }
  }
}
