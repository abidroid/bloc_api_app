import 'dart:convert';

import 'package:bloc_api_app/models/post_model.dart';
import 'package:bloc_api_app/models/user.dart';
import 'package:http/http.dart' as http;

class UserRepository {
  final String endPoint = 'https://jsonplaceholder.typicode.com/users';

  Future<List<User>> getUsers() async {
    http.Response response = await http.get(Uri.parse(endPoint));

    if (response.statusCode == 200) {
      List jsonResponse = jsonDecode(response.body);

      return jsonResponse.map((jsonUser) => User.fromJson(jsonUser)).toList();
    } else {
      throw Exception(response.reasonPhrase);
    }
  }
}

class PostRepository {
  Future<PostModel> addPost(
      {required String title, required String bodyy}) async {
    var body = {'titile': title, 'body': bodyy, 'userId': '1'};

    http.Response response = await http.post(
      Uri.parse('https://jsonplaceholder.typicode.com/posts'),
      body: body,
    );

    print(response.body);
    if (response.statusCode == 200 || response.statusCode == 201) {
      PostModel postModel = PostModel.fromJson(jsonDecode(response.body));

      return postModel;
    } else {
      throw Exception(response.reasonPhrase);
    }
  }
}
