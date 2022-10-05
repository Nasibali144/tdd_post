import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:tdd_post/core/error/failures.dart';
import 'package:tdd_post/domain/repositories/post_base_repository.dart';
import 'package:tdd_post/domain/usecases/base_usecase.dart';

class DeletePostUseCase extends UseCase<bool, DeleteParams> {
  PostBaseRepository postBaseRepository;

  DeletePostUseCase(this.postBaseRepository);

  @override
  Future<Either<Failure, bool>> call(DeleteParams params) async {
    return await postBaseRepository.deletePost(params.id);
  }
}

class DeleteParams extends Equatable {
  final String id;

  const DeleteParams({
    required this.id,
  });

  @override
  List<Object> get props => [id];
}