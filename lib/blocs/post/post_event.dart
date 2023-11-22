part of 'post_bloc.dart';

sealed class PostEvent extends Equatable {
  const PostEvent();

  @override
  List<Object> get props => [];
}

class AddPostEvent extends PostEvent {
  final String title;
  final String body;

  const AddPostEvent({required this.title, required this.body});
}
