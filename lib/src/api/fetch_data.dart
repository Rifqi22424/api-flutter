import 'dart:convert';
import 'package:http/http.dart' as http;

class ExampleApi {
  Future<List<Map<String, dynamic>>> fetchDataFromApi() async {
    final response = await http.get(
      Uri.parse('https://jsonplaceholder.typicode.com/posts'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );

    if (response.statusCode == 200) {
      final List<dynamic> responseData = jsonDecode(response.body) as List;
      final List<Map<String, dynamic>> data =
          responseData.cast<Map<String, dynamic>>();
      return data;
    } else {
      throw Exception('Gagal mengambil data dari API');
    }
  }

  Future<bool> postDataToApi(String title, String body) async {
    final response = await http.post(
      Uri.parse('https://jsonplaceholder.typicode.com/posts'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'title': title,
        'body': body,
      }),
    );

    if (response.statusCode == 201) {
      return true;
    } else {
      throw Exception(response.statusCode);
    }
  }
}
