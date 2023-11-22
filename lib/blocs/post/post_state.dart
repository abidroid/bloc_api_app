part of 'post_bloc.dart';

sealed class PostState extends Equatable {
  const PostState();

  @override
  List<Object> get props => [];
}

final class PostInitial extends PostState {}

class AddingPost extends PostState {}

class PostSuccess extends PostState {
  final PostModel postModel;

  const PostSuccess({required this.postModel});

  @override
  List<Object> get props => [postModel];
}

class PostError extends PostState {}
