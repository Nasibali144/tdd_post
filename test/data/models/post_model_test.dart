import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:tdd_post/data/models/post_model.dart';
import 'package:tdd_post/domain/entities/post_entity.dart';

import '../../fixtures/fixture_reader.dart';

void main() {
  final List<PostModel> mockModel = [PostModel(title: "Pdp B17", body: "salom", id: "28", userId: 1)];

  test(
    'should be a subclass of NumberTrivia entity',
        () async {
      // assert
      expect(mockModel, isA<Post>());
    },
  );

  group('fromJson', () {
    test(
      'should return a valid model when the JSON number is an integer',
          () async {
        // arrange
        final List jsonMap =
        json.decode(fixture('list_post.json'));
        // act
        final result = parseListPostFromJson(jsonMap);
        // assert
        expect(result, mockModel);
      },
    );
  });

  group('toJson', () {
    test(
      'should return a JSON map containing the proper data',
          () async {
        // act
        final result = toListJson(mockModel);
        // assert
        final expectedJsonMap = [{
          "title": "Pdp B17",
          "body": "salom",
          "userId": 1,
          "id": "28"
        }];
        expect(result, expectedJsonMap);
      },
    );
  });
}