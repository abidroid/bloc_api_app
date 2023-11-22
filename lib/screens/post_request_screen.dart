import 'package:bloc_api_app/blocs/post/post_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PostRequestScreen extends StatefulWidget {
  const PostRequestScreen({super.key});

  @override
  State<PostRequestScreen> createState() => _PostRequestScreenState();
}

class _PostRequestScreenState extends State<PostRequestScreen> {
  late TextEditingController titleCon;
  late TextEditingController bodyCon;

  @override
  void initState() {
    super.initState();
    titleCon = TextEditingController();
    bodyCon = TextEditingController();
  }

  @override
  void dispose() {
    titleCon.dispose();
    bodyCon.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Post Request'),
      ),
      body: BlocConsumer<PostBloc, PostState>(
        listener: (context, state) {
          if (state is PostSuccess) {
            ScaffoldMessenger.of(context)
                .showSnackBar(const SnackBar(content: Text('Post Added')));

            print(state.postModel.body);
          }

          if (state is PostError) {
            ScaffoldMessenger.of(context)
                .showSnackBar(const SnackBar(content: Text('Post Failed')));
          }
        },
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                TextField(
                  controller: titleCon,
                  decoration: const InputDecoration(
                    hintText: 'Title',
                  ),
                ),
                const SizedBox(height: 20),
                TextField(
                  controller: bodyCon,
                  decoration: const InputDecoration(
                    hintText: 'Body',
                  ),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: state is AddingPost
                      ? null
                      : () {
                          BlocProvider.of<PostBloc>(context).add(AddPostEvent(
                              title: titleCon.text, body: bodyCon.text));
                        },
                  child: state is AddingPost
                      ? const CircularProgressIndicator()
                      : const Text('Add Post'),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
