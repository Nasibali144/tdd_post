import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:tdd_post/core/error/failures.dart';
import 'package:tdd_post/data/models/post_model.dart';
import 'package:tdd_post/domain/entities/post_entity.dart';
import 'package:tdd_post/domain/repositories/post_base_repository.dart';
import 'package:tdd_post/domain/usecases/base_usecase.dart';

class EditPostUseCase extends UseCase<Post, EditParams> {
  PostBaseRepository postBaseRepository;

  EditPostUseCase(this.postBaseRepository);

  @override
  Future<Either<Failure, Post>> call(EditParams params) async {
    PostModel post = PostModel(title: params.title, body: params.body, id: params.id, userId: params.userId);
    return await postBaseRepository.editPost(post);
  }
}

class EditParams extends Equatable {
  final String title;
  final String body;
  final int userId;
  final String id;

  const EditParams({
    required this.title,
    required this.body,
    required this.userId,
    required this.id,
  });

  @override
  List<Object> get props => [title, body, userId, id];
}