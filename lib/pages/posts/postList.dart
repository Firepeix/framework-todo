import 'package:flutter/material.dart';
import 'package:teste_framework/app/models/post.dart';
import 'package:teste_framework/pages/posts/postView.dart';
import 'package:teste_framework/repositories/postRepository.dart';

class PostList extends StatefulWidget {
  PostList({Key key}) : super(key: key);

  @override
  _PostListState createState() => _PostListState();
}

class _PostListState extends State<PostList> {
  final PostRepository _postRepository = PostRepository();

  List<Post> _posts;

  @override
  void initState() {
    super.initState();
    getPosts().then((posts) {
      setState(() {
        _posts = posts;
      });
    });
  }

  Future<List<Post>> getPosts() async {
    return await _postRepository.getAll();
  }

  @override
  Widget build(BuildContext context) {
    if (_posts != null) {
      return GridView.count(
          crossAxisCount: 1,
          childAspectRatio: (6 / 4),
          children: _posts.map((post) {
            return Container(
                padding: const EdgeInsets.all(5),
                child: Card(
                  elevation: 3,
                    child: PostView(
                        id: post.getId(),
                        userId: post.getUserId(),
                        title: post.getTitle(),
                        body: post.getBody(),
                    )
                )
            );
          }).toList()
      );
    }

    return Container();
  }
}
