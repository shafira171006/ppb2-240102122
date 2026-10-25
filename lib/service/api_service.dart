import 'dart:convert'; 
import 'package:http/http.dart' as http;
import '../model/user_model.dart';

class ApiService {
  static const String url = 'https://jsonplaceholder.typicode.com/users';

  Future<List<User>> fetchUsers() async {
    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        List body = json.decode(response.body);
        return body.map((json) => User.fromJson(json)).toList();
      } else {
        throw Exception('Gagal load data');
      }
    } catch (e) {
      throw Exception('Gagal load — cek koneksi');
    }
  }
}