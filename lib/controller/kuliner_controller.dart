import 'dart:convert';
import 'dart:io';

import 'package:ucp2/model/kuliner.dart';
import 'package:ucp2/service/kuliner_service.dart';

class KulinerController {
  final kulinerService = KulinerService();

  Future<Map<String, dynamic>> addKuliner(Kuliner kuliner, File? file) async {
    Map<String, String> data = {
      "resto": kuliner.resto,
      "alamat": kuliner.alamat
    };

    try {
      var response = await kulinerService.addKuliner(data, file);
      if (response.statusCode == 201) {
        return {
          'success': true,
          "message": "Data berhasil disimpan",
        };
      } else {
        if (response.headers['content-type']!.contains('application/json')) {
          var decodeJson = jsonDecode(response.body);
          return {
            'success': false,
            "message": decodeJson['message'] ?? 'Terjadi kesalahan',
          };
        }

        var decodeJson = jsonDecode(response.body);
        return {
          'success': false,
          "message":
              decodeJson['message'] ?? 'Terjadi kesalahan saat menyimpan data'
        };
      }
    } catch (e) {
      return {"success": false, "message": 'Terjadi kesalahan: $e'};
    }
  }

  Future<List<Kuliner>> getKuliner() async {
    try {
      List<dynamic> kulinerData = await kulinerService.fetchPeople();
      List<Kuliner> kuliner =
          kulinerData.map((json) => Kuliner.fromMap(json)).toList();
      return kuliner;
    } catch (e) {
      print(e);
      throw Exception('Failed');
    }
  }
}
