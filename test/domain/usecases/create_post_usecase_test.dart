import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:tdd_post/data/models/post_model.dart';
import 'package:tdd_post/domain/usecases/create_post_usecase.dart';

import 'get_all_post_usecase_test.mocks.dart';

void main() {
  late MockPostBaseRepositoryTest mockRepository;
  late CreatePostUseCase useCase;

  setUp(() {
    mockRepository = MockPostBaseRepositoryTest();
    useCase = CreatePostUseCase(mockRepository);
  });

  PostModel postModel = PostModel(title: "title", body: "body", id: "01", userId: 1);

  test('should get trivia from the repository', () async {
      // arrange
      when(mockRepository.createPost(postModel))
          .thenAnswer((_) async => Right(postModel));
      // act
      final result = await useCase(const Params(title: "title", body: "body", userId: 1));

      // assert
      expect(result, Right(postModel));
      verify(mockRepository.createPost(postModel));
      verifyNoMoreInteractions(mockRepository);
    },
  );
}