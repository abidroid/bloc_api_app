import 'package:bloc_api_app/blocs/user/user_bloc.dart';
import 'package:bloc_api_app/models/user.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GetRequestScreen extends StatelessWidget {
  const GetRequestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Get Request Screen')),
      body: BlocBuilder<UserBloc, UserState>(builder: (context, state) {
        print('Executed');
        if (state is UserLoadingState) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        if (state is UserLoadedState) {
          print('User Loaded');
          List<User> users = state.users;

          return Padding(
            padding: const EdgeInsets.all(16),
            child: ListView.builder(
                itemCount: users.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: ListTile(
                      title: Text(users[index].name!),
                    ),
                  );
                }),
          );
        }

        if (state is UserErrorState) {
          return const Center(
            child: Text('Something Went Wrong'),
          );
        }

        return const SizedBox.shrink();
      }),
    );
  }
}
