import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:api_advance_fetching_practice/model/post_model.dart';
import 'package:api_advance_fetching_practice/service/post_service.dart';

final postProvider = FutureProvider<List<PostModel>>((ref) {
  return PostService().fetchPosts();
});
