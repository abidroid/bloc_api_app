import 'package:bloc_api_app/blocs/post/post_bloc.dart';
import 'package:bloc_api_app/blocs/user/user_bloc.dart';
import 'package:bloc_api_app/repos/repositories.dart';
import 'package:bloc_api_app/screens/landing_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(
          create: (context) => UserRepository(),
        ),
        RepositoryProvider(
          create: (context) => PostRepository(),
        ),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider<UserBloc>(
            create: (context) =>
                UserBloc(RepositoryProvider.of<UserRepository>(context))
                  ..add(UserLoadingEvent()),
          ),
          BlocProvider<PostBloc>(
            create: (context) =>
                PostBloc(RepositoryProvider.of<PostRepository>(context)),
          ),
        ],
        child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          home: const LandingScreen(),
        ),
      ),
    );
  }
}
