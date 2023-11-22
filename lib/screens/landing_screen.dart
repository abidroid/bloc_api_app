import 'package:bloc_api_app/screens/get_request_screen.dart';
import 'package:bloc_api_app/screens/post_request_screen.dart';
import 'package:flutter/material.dart';

class LandingScreen extends StatelessWidget {
  const LandingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Topics'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView(
          children: [
            Card(
              child: ListTile(
                title: const Text('Get Examp;le'),
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (_) {
                    return const GetRequestScreen();
                  }));
                },
              ),
            ),
            Card(
              child: ListTile(
                title: const Text('Post Examp;le'),
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (_) {
                    return const PostRequestScreen();
                  }));
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
