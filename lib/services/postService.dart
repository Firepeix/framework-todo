import 'package:teste_framework/app/models/post.dart';
import 'package:teste_framework/repositories/postRepository.dart';
import 'package:teste_framework/services/abstractService.dart';

class PostService extends AbstractService {
  final PostRepository _postRepository = PostRepository();

  PostService () {
    uri = baseUri + '/posts';
  }

  @override
  bool shouldSync() {
    return true;
  }

  @override
  void sync() async {
    var posts = await getPosts();
    var existentPosts = await _postRepository.getWhereIn('id', posts.map((post) => post.getId()).toList());
    posts.forEach((post) {
      if(existentPosts.isNotEmpty) {
        var existentPost = existentPosts.firstWhere((existentPost) => existentPost.getId() == post.getId());
        if(existentPost != null) {
          post = existentPost.update(post);
        }
      }

      _postRepository.save(post);
    });
  }

  Future<List<Post>> getPosts() async {
    var posts = await fetch();
    return posts.map((post) => Post.fromJson(post)).toList();
  }
}