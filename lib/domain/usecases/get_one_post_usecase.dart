import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:tdd_post/core/error/failures.dart';
import 'package:tdd_post/domain/entities/post_entity.dart';
import 'package:tdd_post/domain/repositories/post_base_repository.dart';
import 'package:tdd_post/domain/usecases/base_usecase.dart';

class GetOnePostUseCase extends UseCase<Post, GetOneParams> {
  PostBaseRepository postBaseRepository;

  GetOnePostUseCase(this.postBaseRepository);

  @override
  Future<Either<Failure, Post>> call(GetOneParams params) async {
    return await postBaseRepository.getOnePost(params.id);
  }
}

class GetOneParams extends Equatable {
  final String id;

  const GetOneParams({
    required this.id,
  });

  @override
  List<Object> get props => [id];
}