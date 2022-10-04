import 'dart:convert';

import 'package:tdd_post/core/error/exception.dart';
import 'package:tdd_post/data/models/post_model.dart';
import 'package:tdd_post/domain/entities/post_entity.dart';
import 'package:http/http.dart' as http;

abstract class PostRemoteDataSource {
  Future<List<PostModel>> getAllPost();
  // Future<Post> createPost(Map<String, String> json);
  // Future<Post> editPost(Map<String,String> json);
  // Future<bool> deletePost(String id);
}

class PostRemoteDataSourceImpl implements PostRemoteDataSource {
  final http.Client client;

  PostRemoteDataSourceImpl({required this.client});

  @override
  Future<List<PostModel>> getAllPost() async {
    final response = await client.get(
      Uri.parse("https://630ddfe9109c16b9abef55a6.mockapi.io/api/v1/posts"),
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode == 200) {
      return parseListPostFromJson(json.decode(response.body));
    } else {
      throw ServerException();
    }
  }
}