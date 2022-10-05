part of 'post_bloc.dart';

abstract class PostState extends Equatable {
  const PostState();
}

class Loading extends PostState {
  @override
  List<Object> get props => [];
}

class Error extends PostState {
  final String message;

  const Error({required this.message});

  @override
  List<Object> get props => [message];
}

class GetAllPostSuccessState extends PostState {
  final List<Post> list;

  const GetAllPostSuccessState({required this.list});

  @override
  List<Object> get props => [list];
}

class GetOnePostSuccessState extends PostState {
  @override
  List<Object> get props => [];
}

class CreatePostSuccessState extends PostState {
  @override
  List<Object> get props => [];
}

class EditPostSuccessState extends PostState {
  @override
  List<Object> get props => [];
}

class DeletePostSuccessState extends PostState {
  @override
  List<Object> get props => [];
}



