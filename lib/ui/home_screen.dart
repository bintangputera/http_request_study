import 'package:flutter/material.dart';
import 'package:http_request_study/model/post.dart';
import 'package:http_request_study/ui/detail/post_detail.dart';
import 'package:http_request_study/utils/http/http_service.dart';

class HomeScreen extends StatefulWidget {
  final HttpService httpService = HttpService();

  static const routeName = "/homeScreen";

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: _buildBody()),
    );
  }

  Widget _buildBody() {
    return _buildContent();
  }

  Widget _buildContent() {
    return FutureBuilder(
      future: widget.httpService.getPosts(),
      builder: (BuildContext context, AsyncSnapshot<List<Post>> snapshot) {
        if (snapshot.hasData) {
          List<Post>? post = snapshot.data;
          return ListView(
              children: post!
                  .map(
                    (Post post) => ListTile(
                      title: Text(post.title),
                      subtitle: Text("${post.userId}"),
                      onTap: () => Navigator.pushNamed(context, PostDetail.routeName, arguments: post),
                    ),
                  )
                  .toList());
        } else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
