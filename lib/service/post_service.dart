import 'dart:convert';

import 'package:api_advance_fetching_practice/model/post_model.dart';
import 'package:http/http.dart' as http;

class PostService {
  Future<List<PostModel>> fetchPosts() async {
    try {
      final url = Uri.parse("https://jsonplaceholder.typicode.com/posts");

      final response = await http.get(url);

      if (response.statusCode == 200) {
        final List data = jsonDecode(response.body);
        return data.map((item) {
          return PostModel.fromJson(item);
        }).toList();
      } else {
        throw Exception("Failed to load. Status code : ${response.statusCode}");
      }
    } catch (e) {
      throw Exception("Error while fetching : $e");
    }
  }
}
