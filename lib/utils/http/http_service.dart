import 'dart:convert';

import 'package:http/http.dart';
import 'package:http_request_study/model/post.dart';

class HttpService {
  final String baseUrl = "https://jsonplaceholder.typicode.com/posts";

  Future<List<Post>> getPosts() async {
    Response res = await get(Uri.parse(baseUrl));

    if (res.statusCode == 200) {
      List<dynamic> body = jsonDecode(res.body);

      List<Post> posts = body
          .map(
            (dynamic item) => Post.fromJson(item),
          )
          .toList();

      return posts;
    } else {
      throw "Unable to retrieve data";
    }
  }
}
