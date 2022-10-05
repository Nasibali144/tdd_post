import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:tdd_post/domain/entities/post_entity.dart';
import 'package:tdd_post/domain/repositories/post_base_repository.dart';
import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';
import 'package:tdd_post/domain/usecases/base_usecase.dart';
import 'package:tdd_post/domain/usecases/delete_post_usecase.dart';
import 'package:tdd_post/domain/usecases/get_all_post_usecase.dart';
import 'get_all_post_usecase_test.mocks.dart';

class PostBaseRepositoryTest extends Mock implements PostBaseRepository{}

@GenerateMocks([PostBaseRepositoryTest])

void main() {
  late MockPostBaseRepositoryTest mockRepository;
  late DeletePostUseCase useCase;

  setUp(() {
    mockRepository = MockPostBaseRepositoryTest();
    useCase = DeletePostUseCase(mockRepository);
  });

  const id = "01";

  test(
    'should get trivia from the repository',
        () async {
      // arrange
      when(mockRepository.deletePost(id))
          .thenAnswer((_) async => const Right(true));
      // act
      final result = await useCase(const DeleteParams(id: id));

      // assert
      expect(result, const Right(true));
      verify(mockRepository.deletePost(id));
      verifyNoMoreInteractions(mockRepository);
    },
  );
}