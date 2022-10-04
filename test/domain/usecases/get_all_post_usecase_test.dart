import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:tdd_post/domain/entities/post_entity.dart';
import 'package:tdd_post/domain/repositories/post_base_repository.dart';
import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';
import 'package:tdd_post/domain/usecases/base_usecase.dart';
import 'package:tdd_post/domain/usecases/get_all_post_usecase.dart';

import 'get_all_post_usecase_test.mocks.dart';

class PostBaseRepositoryTest extends Mock implements PostBaseRepository{}

@GenerateMocks([PostBaseRepositoryTest])

void main() {
  late MockPostBaseRepositoryTest mockRepository;
  late GetAllPostUseCase useCase;

  setUp(() {
    mockRepository = MockPostBaseRepositoryTest();
    useCase = GetAllPostUseCase(mockRepository);
  });

  final postList = [Post(id: "1", userId: 1, title: "Test", body: "test")];

  test(
    'should get trivia from the repository',
        () async {
      // arrange
      when(mockRepository.getAllPost())
          .thenAnswer((_) async => Right(postList));
      // act
      final result = await useCase(NoParams());

      // assert
      expect(result, Right(postList));
      verify(mockRepository.getAllPost());
      verifyNoMoreInteractions(mockRepository);
    },
  );
}