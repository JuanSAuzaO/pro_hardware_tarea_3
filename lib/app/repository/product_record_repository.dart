import 'dart:convert';
import 'package:http/http.dart' as http;

class ProductRecordRepository {
  Future<String?> login(String email, String password) async {
    final response = await http.post(
      Uri.parse('http://10.0.2.2:3000/api/v1/login'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        'user': {
          'email': email,
          'password': password
        }
      }),
    );
    if (response.statusCode == 200) {
      String? authorizationHeader = response.headers['authorization'];
      return authorizationHeader;
    }
    return 'error';
  }
  Future<List<dynamic>?> fetchProducts() async {
    final authorization = await login('sebastian@test.com', '12345678');
    final response =
    await http.get(Uri.parse('http://10.0.2.2:3000/api/v1/products'),
        headers: <String, String>{
          'Authorization': authorization!
        });
    if (response.statusCode == 200) {
      final data = await jsonDecode(response.body);
      return data['products'];
    }
    return [];
  }
  Future<dynamic> createProduct(Map<String, dynamic> body) async {
    final authorization = await login('sebastian@test.com', '12345678');
    final response = await http.post(
      Uri.parse('http://10.0.2.2:3000/api/v1/products'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': authorization!
      },
      body: jsonEncode(body),
    );
    final data = await jsonDecode(response.body);
    if (data['errors'] != null) {
      return data['errors'];
    } else {
      return true;
    }
  }
}