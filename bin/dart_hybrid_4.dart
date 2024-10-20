import 'dart:convert' as convert;
import 'package:http/http.dart' as http;


void main() async {

  final url = Uri.parse('https://random-data-api.com/api/v2/users?size=10');

  try {
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final jsonData = convert.jsonDecode(response.body) as List<dynamic>;
      final List<Map<String, dynamic>> userList = jsonData.cast<Map<String, dynamic>>();
      
      for (var user in userList) {
        print('UID: ${user['uid']} Name: ${user['first_name']} ${user['last_name']}');
      }
      
    } else {
      print('Request failed- status: ${response.statusCode}.');
    }
  } catch (e) {
    print('Request failed: $e.');
  }


}




