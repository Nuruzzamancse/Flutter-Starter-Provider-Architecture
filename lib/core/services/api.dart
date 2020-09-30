import 'dart:convert';

import 'package:provider_architecture/core/models/comment.dart';
import 'package:provider_architecture/core/models/post.dart';
import 'package:provider_architecture/core/models/user.dart';
import 'package:http/http.dart' as http;

/// The service responsible for networking requests
class Api {
  static const endpoint =
      'https://7402c41a9a0b.ngrok.io/address-book/server.php';

  var client = new http.Client();

  Future<User> login(String email, String password) async {
    // Get user profile for id
    var response = await client.post('$endpoint/api/v1/user/login',
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body:
            jsonEncode(<String, String>{'email': email, 'password': password}));

    final Map<String, dynamic> responseJson = json.decode(response.body);
    // Convert and return
    return User.fromJson(responseJson['user']);
  }

  Future<List<User>> getContactsList() async {
    var users = List<User>();
    // Get user posts for id
    var response = await client
        .get('$endpoint/api/v1/user');

    // parse into List
    var parsed = json.decode(response.body) as List<dynamic>;

    // loop and convert each item to Post
    for (var user in parsed) {
      users.add(User.fromJson(user));
    }

    return users;
  }

  Future<List<Comment>> getCommentsForPost(int postId) async {
    var comments = List<Comment>();

    // Get comments for post
    var response = await client
        .get('https://jsonplaceholder.typicode.com/comments?postId=$postId');

    // Parse into List
    var parsed = json.decode(response.body) as List<dynamic>;

    // Loop and convert each item to a Comment
    for (var comment in parsed) {
      comments.add(Comment.fromJson(comment));
    }

    print('Comment fetching ');
    print(comments);

    return comments;
  }
}
