import 'package:bloc_api_app/models/post_model.dart';
import 'package:bloc_api_app/repos/repositories.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'post_event.dart';
part 'post_state.dart';

class PostBloc extends Bloc<PostEvent, PostState> {
  final PostRepository _postRepository;

  PostBloc(this._postRepository) : super(PostInitial()) {
    on<AddPostEvent>((event, emit) async {
      emit(AddingPost());

      try {
        final postModel = await _postRepository.addPost(
            title: event.title, bodyy: event.body);

        emit(PostSuccess(postModel: postModel));
      } catch (e, st) {
        print(e.toString());
        print(st.toString());
        emit(PostError());
      }
    });
  }
}
