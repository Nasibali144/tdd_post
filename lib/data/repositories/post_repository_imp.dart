import 'package:dartz/dartz.dart';
import 'package:tdd_post/core/error/exception.dart';
import 'package:tdd_post/core/error/failures.dart';
import 'package:tdd_post/core/network/network_info.dart';
import 'package:tdd_post/data/datasources/post_local_data_source.dart';
import 'package:tdd_post/data/datasources/post_remote_data_source.dart';
import 'package:tdd_post/data/models/post_model.dart';
import 'package:tdd_post/domain/repositories/post_base_repository.dart';

class PostRepositoryImp implements PostBaseRepository {

  final PostLocalDataSource localDataSource;
  final PostRemoteDataSource remoteDataSource;
  final NetworkInfo info;

  PostRepositoryImp({
    required this.localDataSource,
    required this.remoteDataSource,
    required this.info,
  });

  @override
  Future<Either<Failure, List<PostModel>>> getAllPost() async {
    if (await info.isConnected) {
      try {
        final remotePost = await remoteDataSource.getAllPost();
        localDataSource.cacheNListPost(remotePost);
        return Right(remotePost);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      try {
        final localList = await localDataSource.getLastListPost();
        return Right(localList);
      } on CacheException {
        return Left(CacheFailure());
      }
    }
  }
}
