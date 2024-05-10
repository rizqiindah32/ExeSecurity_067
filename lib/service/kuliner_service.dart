import 'dart:io';
import 'dart:convert';
import 'package:http/http.dart' as http;

class KulinerService {
  final String baseUrl = 'https://paml.tatiumy.com/api/';
  final String endpoint = 'kuliner';

  Uri getUri(String path) {
    return Uri.parse("$baseUrl$path");
  }

  Future<http.Response> addKuliner(Map<String, String> data, File? file) async {
    var request = http.MultipartRequest(
      'POST',
      getUri(endpoint),
    )
      ..fields.addAll(data)
      ..headers['Content-type'] = 'application/json';

    return await http.Response.fromStream(await request.send());
  }

  Future<List<dynamic>> fetchPeople() async {
    var response = await http.get(
        getUri(
          endpoint,
        ),
        headers: {
          "Accept": "application/json",
        });
    if (response.statusCode == 200) {
      final Map<String, dynamic> decodedResponse = json.decode(response.body);
      return decodedResponse['kuliner'];
    } else {
      throw Exception('Failed to load people: ${response.reasonPhrase}');
    }
  }
}
