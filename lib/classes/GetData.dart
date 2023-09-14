import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:gif/classes/Gif.dart';

class GetData {
  String api;
  String situation;

  GetData({
    required this.api,
    required this.situation,
  });

  Future<List<Gif>> fetchAlbum() async {
    final response = await http.get(Uri.parse(
        'https://tenor.googleapis.com/v2/search?q=$situation&key=$api&client_key=my_test_app&limit=8&locale=tr&limit=8'));

    if (response.statusCode == 200) {
      final jsonList = jsonDecode(response.body)["results"] as List;
      return jsonList.map((json) => Gif.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load album');
    }
  }
}
