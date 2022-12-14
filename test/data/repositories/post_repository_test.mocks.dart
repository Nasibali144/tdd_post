// Mocks generated by Mockito 5.3.2 from annotations
// in tdd_post/test/data/repositories/post_repository_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i4;

import 'package:mockito/mockito.dart' as _i1;
import 'package:tdd_post/data/models/post_model.dart' as _i5;
import 'package:tdd_post/domain/entities/post_entity.dart' as _i2;

import 'post_repository_test.dart' as _i3;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

class _FakePost_0 extends _i1.SmartFake implements _i2.Post {
  _FakePost_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [PostRemoteDataSourceTest].
///
/// See the documentation for Mockito's code generation for more information.
class MockPostRemoteDataSourceTest extends _i1.Mock
    implements _i3.PostRemoteDataSourceTest {
  MockPostRemoteDataSourceTest() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i4.Future<List<_i5.PostModel>> getAllPost() => (super.noSuchMethod(
        Invocation.method(
          #getAllPost,
          [],
        ),
        returnValue: _i4.Future<List<_i5.PostModel>>.value(<_i5.PostModel>[]),
      ) as _i4.Future<List<_i5.PostModel>>);
  @override
  _i4.Future<_i2.Post> createPost(Map<String, dynamic>? json) =>
      (super.noSuchMethod(
        Invocation.method(
          #createPost,
          [json],
        ),
        returnValue: _i4.Future<_i2.Post>.value(_FakePost_0(
          this,
          Invocation.method(
            #createPost,
            [json],
          ),
        )),
      ) as _i4.Future<_i2.Post>);
  @override
  _i4.Future<_i2.Post> editPost(
    Map<String, dynamic>? json,
    String? id,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #editPost,
          [
            json,
            id,
          ],
        ),
        returnValue: _i4.Future<_i2.Post>.value(_FakePost_0(
          this,
          Invocation.method(
            #editPost,
            [
              json,
              id,
            ],
          ),
        )),
      ) as _i4.Future<_i2.Post>);
  @override
  _i4.Future<bool> deletePost(String? id) => (super.noSuchMethod(
        Invocation.method(
          #deletePost,
          [id],
        ),
        returnValue: _i4.Future<bool>.value(false),
      ) as _i4.Future<bool>);
}

/// A class which mocks [PostLocalDataSourceTest].
///
/// See the documentation for Mockito's code generation for more information.
class MockPostLocalDataSourceTest extends _i1.Mock
    implements _i3.PostLocalDataSourceTest {
  MockPostLocalDataSourceTest() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i4.Future<List<_i5.PostModel>> getLastListPost() => (super.noSuchMethod(
        Invocation.method(
          #getLastListPost,
          [],
        ),
        returnValue: _i4.Future<List<_i5.PostModel>>.value(<_i5.PostModel>[]),
      ) as _i4.Future<List<_i5.PostModel>>);
  @override
  _i4.Future<void> cacheNListPost(List<_i5.PostModel>? postListToCache) =>
      (super.noSuchMethod(
        Invocation.method(
          #cacheNListPost,
          [postListToCache],
        ),
        returnValue: _i4.Future<void>.value(),
        returnValueForMissingStub: _i4.Future<void>.value(),
      ) as _i4.Future<void>);
  @override
  _i4.Future<void> cacheOneAddPost(_i5.PostModel? post) => (super.noSuchMethod(
        Invocation.method(
          #cacheOneAddPost,
          [post],
        ),
        returnValue: _i4.Future<void>.value(),
        returnValueForMissingStub: _i4.Future<void>.value(),
      ) as _i4.Future<void>);
  @override
  _i4.Future<void> cacheOneUpdatePost(_i5.PostModel? post) =>
      (super.noSuchMethod(
        Invocation.method(
          #cacheOneUpdatePost,
          [post],
        ),
        returnValue: _i4.Future<void>.value(),
        returnValueForMissingStub: _i4.Future<void>.value(),
      ) as _i4.Future<void>);
  @override
  _i4.Future<void> cacheOneDeletePost(String? id) => (super.noSuchMethod(
        Invocation.method(
          #cacheOneDeletePost,
          [id],
        ),
        returnValue: _i4.Future<void>.value(),
        returnValueForMissingStub: _i4.Future<void>.value(),
      ) as _i4.Future<void>);
}

/// A class which mocks [NetworkInfoTest].
///
/// See the documentation for Mockito's code generation for more information.
class MockNetworkInfoTest extends _i1.Mock implements _i3.NetworkInfoTest {
  MockNetworkInfoTest() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i4.Future<bool> get isConnected => (super.noSuchMethod(
        Invocation.getter(#isConnected),
        returnValue: _i4.Future<bool>.value(false),
      ) as _i4.Future<bool>);
}
