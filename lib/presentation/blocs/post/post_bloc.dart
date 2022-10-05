import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:tdd_post/domain/entities/post_entity.dart';
import 'package:tdd_post/domain/usecases/create_post_usecase.dart';
import 'package:tdd_post/domain/usecases/delete_post_usecase.dart';
import 'package:tdd_post/domain/usecases/edit_post_usecase.dart';
import 'package:tdd_post/domain/usecases/get_all_post_usecase.dart';
part 'post_event.dart';
part 'post_state.dart';

class PostBloc extends Bloc<PostEvent, PostState> {
  // CreatePostUseCase createPostUseCase;
  // GetAllPostUseCase getAllPostUseCase;
  // EditPostUseCase editPostUseCase;
  // DeletePostUseCase deletePostUseCase;


  PostBloc() : super(Loading()) {
    on<PostEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
