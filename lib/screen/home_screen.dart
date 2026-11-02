import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:api_advance_fetching_practice/provider/post_provider.dart';

class HomeScreen extends ConsumerWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final posts = ref.watch(postProvider);
    return Scaffold(
      appBar: AppBar(centerTitle: true, title: Text("Api Listing")),
      body: posts.when(
        loading: () {
          return Center(child: CircularProgressIndicator());
        },
        error: (error, stackTrace) {
          return Center(child: Text("Something Went Wrong!"));
        },
        data: (postList) {
          if (postList.isEmpty) {
            return Center(child: Text("No data available"));
          }
          
          return ListView.builder(
            itemCount: postList.length,
            itemBuilder: ((context, index) {
              final post = postList[index];

              return Card(
                child: ListTile(
                  leading: CircleAvatar(child: Text(post.id.toString())),
                  title: Text(post.title),
                ),
              );
            }),
          );
        },
      ),
    );
  }
}
