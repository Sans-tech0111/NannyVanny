import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiServices {
  final baseUrl = "https://www.cgprojects.in/lens8/api/dummy";


  Future<Map<String,dynamic>> getData(String dataKey) async {
    final url = Uri.parse("$baseUrl/$dataKey");
    return await _makeGetRequest(url);
  }


  Future<Map<String, dynamic>> _makeGetRequest(Uri uri) async {
    try {
      final response = await http.get(uri);
      return _processResponse(response);
    } catch (e) {
      return {'success': false, 'message': 'Error: $e'};
    }
  }


  Map<String,dynamic> _processResponse(http.Response response){
    if (response.statusCode == 200) {
      return {'success': true, 'data': json.decode(response.body)};
    } else {
      return {'success': false, 'message': 'Failed with status code: ${response.statusCode}'};
    }
  }
}