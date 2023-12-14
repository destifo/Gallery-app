import 'dart:convert';

import 'package:gallery_app/core/Exceptions.dart';
import 'package:gallery_app/data/models/image_meta.dart';
import 'package:http/http.dart' as http;

class GalleryRemoteDataSource {
  final http.Client client = http.Client();

  Future<List<ImageMeta>> getImages() async {
    const url = "https://picsum.photos/v2/list";
    try {
      final response = await client.get(Uri.parse(url), headers: {
        "User-Agent": "PostmanRuntime/7.36.0",
        "Accept": "*/*",
      });
      if (response.statusCode != 200) {
        throw ServerException();
      }
      List<dynamic> jsonBody = jsonDecode(response.body);

      return jsonBody.map((e) => ImageMeta.fromJson(e)).toList();
    } catch (e) {
      throw ServerException();
    }
  }
}
