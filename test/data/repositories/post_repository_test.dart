import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:tdd_post/core/network/network_info.dart';
import 'package:tdd_post/data/datasources/post_local_data_source.dart';
import 'package:tdd_post/data/datasources/post_remote_data_source.dart';
import 'package:tdd_post/data/models/post_model.dart';
import 'package:tdd_post/data/repositories/post_repository_imp.dart';

import 'post_repository_test.mocks.dart';

class PostRemoteDataSourceTest extends Mock implements PostRemoteDataSource {}

class PostLocalDataSourceTest extends Mock implements PostLocalDataSource {}

class NetworkInfoTest extends Mock implements NetworkInfo {}

@GenerateMocks([PostRemoteDataSourceTest, PostLocalDataSourceTest, NetworkInfoTest])
void main() {
  late PostRepositoryImp repository;
  late MockPostLocalDataSourceTest localDataSource;
  late MockPostRemoteDataSourceTest remoteDataSource;
  late MockNetworkInfoTest info;

  setUp(() {
    localDataSource = MockPostLocalDataSourceTest();
    remoteDataSource = MockPostRemoteDataSourceTest();
    info = MockNetworkInfoTest();
    repository = PostRepositoryImp(localDataSource: localDataSource, remoteDataSource: remoteDataSource, info: info);
  });

  group('getAllPost', () {

    final postList = [PostModel(id: "1", userId: 1, title: "Test", body: "test")];

    test('should check if the device is online', () {
      //arrange
      when(info.isConnected).thenAnswer((_) async => true);
      when(repository.getAllPost()).thenAnswer((_) async => Right(postList));
      // act
      repository.getAllPost();
      // assert
      expect(info.isConnected, true);
    });

    // group('device is online', () {
    //   // This setUp applies only to the 'device is online' group
    //   setUp(() {
    //     when(mockNetworkInfo.isConnected).thenAnswer((_) async => true);
    //   });
    //
    //   test(
    //     'should return remote data when the call to remote data source is successful',
    //         () async {
    //       // arrange
    //       when(mockRemoteDataSource.getConcreteNumberTrivia(tNumber))
    //           .thenAnswer((_) async => tNumberTriviaModel);
    //       // act
    //       final result = await repository.getConcreteNumberTrivia(tNumber);
    //       // assert
    //       verify(mockRemoteDataSource.getConcreteNumberTrivia(tNumber));
    //       expect(result, equals(const Right(tNumberTrivia)));
    //     },
    //   );
    //
    //   test(
    //     'should cache the data locally when the call to remote data source is successful',
    //         () async {
    //       // arrange
    //       when(mockRemoteDataSource.getConcreteNumberTrivia(tNumber))
    //           .thenAnswer((_) async => tNumberTriviaModel);
    //       // act
    //       await repository.getConcreteNumberTrivia(tNumber);
    //       // assert
    //       verify(mockRemoteDataSource.getConcreteNumberTrivia(tNumber));
    //       verify(mockLocalDataSource.cacheNumberTrivia(tNumberTriviaModel));
    //     },
    //   );
    //
    //   test(
    //     'should return server failure when the call to remote data source is unsuccessful',
    //         () async {
    //       // arrange
    //       when(mockRemoteDataSource.getConcreteNumberTrivia(tNumber))
    //           .thenThrow(ServerException());
    //       // act
    //       final result = await repository.getConcreteNumberTrivia(tNumber);
    //       // assert
    //       verify(mockRemoteDataSource.getConcreteNumberTrivia(tNumber));
    //       verifyZeroInteractions(mockLocalDataSource);
    //       expect(result, equals(Left(ServerFailure())));
    //     },
    //   );
    // });
  });
}