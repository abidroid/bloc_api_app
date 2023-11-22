import 'package:bloc_api_app/models/user.dart';
import 'package:bloc_api_app/repos/repositories.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final UserRepository _userRepository;

  UserBloc(this._userRepository) : super(UserLoadingState()) {
    on<UserLoadingEvent>((event, emit) async {
      print('User Loading');
      emit(UserLoadingState());

      try {
        final users = await _userRepository.getUsers();
        print(users.length.toString());
        emit(UserLoadedState(users));
      } catch (e) {
        emit(UserErrorState());
      }
    });
  }
}
