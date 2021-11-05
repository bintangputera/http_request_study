import 'package:flutter/material.dart';
import 'package:http_request_study/model/post.dart';
import 'package:http_request_study/ui/detail/post_detail.dart';
import 'package:http_request_study/ui/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomeScreen(),
      routes: {
        HomeScreen.routeName: (context) => HomeScreen(),
        PostDetail.routeName: (context) => PostDetail(
              post: ModalRoute.of(context)!.settings.arguments as Post,
            ),
      },
    );
  }
}
