import 'package:http/http.dart' as http;
import 'dart:convert';

class ApiService {
  Future<Map<String, dynamic>?> verifyPan(String pan) async {
    final response = await http.post(
      Uri.parse('https://lab.pixel6.co/api/verify-pan.php'),
      body: jsonEncode({'panNumber': pan}),
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    }
    return null;
  }

  Future<Map<String, dynamic>?> getPostcodeDetails(String postcode) async {
    final response = await http.post(
      Uri.parse('https://lab.pixel6.co/api/get-postcode-details.php'),
      body: jsonEncode({'postcode': postcode}),
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    }
    return null;
  }
}
