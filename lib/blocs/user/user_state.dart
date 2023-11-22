part of 'user_bloc.dart';

sealed class UserState extends Equatable {
  const UserState();

  @override
  List<Object> get props => [];
}

final class UserInitial extends UserState {}

class UserLoadingState extends UserState {}

class UserLoadedState extends UserState {
  final List<User> users;

  const UserLoadedState(this.users);
  @override
  List<Object> get props => [users];
}

class UserErrorState extends UserState {}
