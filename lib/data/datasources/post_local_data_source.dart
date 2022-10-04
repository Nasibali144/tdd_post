import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tdd_post/core/error/exception.dart';
import 'package:tdd_post/data/models/post_model.dart';

const CACHED_LIST_POST = 'CACHED_LIST_POST';

abstract class PostLocalDataSource {
  Future<List<PostModel>> getLastListPost();

  Future<void> cacheNListPost(List<PostModel> postListToCache);
}

class PostLocalDataSourceImpl implements PostLocalDataSource {
  final SharedPreferences sharedPreferences;

  PostLocalDataSourceImpl({required this.sharedPreferences});

  @override
  Future<List<PostModel>> getLastListPost() {
    final jsonString = sharedPreferences.getString(CACHED_LIST_POST);
    if (jsonString != null) {
      return Future.value(parseListPostFromJson(json.decode(jsonString)));
    } else {
      throw CacheException();
    }
  }

  @override
  Future<void> cacheNListPost(List<PostModel> postListToCache) {
    return sharedPreferences.setString(
      CACHED_LIST_POST,
      json.encode(toListJson(postListToCache)),
    );
  }
}