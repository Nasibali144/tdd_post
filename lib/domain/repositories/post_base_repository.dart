import 'package:tdd_post/core/error/failures.dart';
import 'package:tdd_post/domain/entities/post_entity.dart';
import 'package:dartz/dartz.dart';

abstract class PostBaseRepository {
  Future<Either<Failure, List<Post>>> getAllPost();
  // Future<Either<Failure, Post>> createPost(Post post);
  // Future<Either<Failure, Post>> editPost(Post post);
  // Future<Either<Failure, bool>> deletePost(Post post);
}
