import 'package:flutter/material.dart';
import 'package:http_request_study/model/post.dart';

class PostDetail extends StatefulWidget {
  final Post post;

  const PostDetail({required this.post});

  static const routeName = "/postDetailScreen";

  @override
  _PostDetailState createState() => _PostDetailState();
}

class _PostDetailState extends State<PostDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Detail", style: TextStyle(color: Colors.black)),
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
        backgroundColor: Colors.transparent,
      ),
      body: SafeArea(child: _buildBody()),
    );
  }
 
  Widget _buildBody() {
    return SingleChildScrollView(
      child: _buildContent(),
    );
  }

  Widget _buildContent() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          Card(
            child: Column(
              children: [
                ListTile(
                  title: Text("Title"),
                  subtitle: Text(widget.post.title),
                ),
                ListTile(
                  title: Text("ID"),
                  subtitle: Text("${widget.post.id}"),
                ),
                ListTile(
                  title: Text("Body"),
                  subtitle: Text(widget.post.body),
                ),
                ListTile(
                  title: Text("User ID"),
                  subtitle: Text("${widget.post.userId}"),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
