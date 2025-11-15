import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  static Future<Map<String, dynamic>> getUser() async {
    final url = Uri.parse("https://jsonplaceholder.typicode.com/users/1");
    final res = await http.get(url);

    if (res.statusCode == 200) {
      return jsonDecode(res.body);
    } else {
      throw Exception("Error: ${res.statusCode}");
    }
  }
}
