import 'package:teste_framework/app/models/model.dart';

class Post extends Model<Post> {
  int userId;
  String title;
  String body;

  Post({this.userId, this.title, this.body});

  @override
  factory Post.fromMap(Map<String, dynamic> json, { bool exists = false }) {
    return Post.fromJson(json, exists: exists);
  }

  factory Post.fromJson(Map<String, dynamic> json, { bool exists = false }) {
    var post = Post(userId: json['userId'], title: json['title'], body: json['body']);
    post.persistExistence(json, exists);
    return post;
  }


  @override
  Post update(Post model) {
    this.userId = model.userId;
    this.title = model.title;
    this.body = model.body;
    return this;
  }

  Map<String, dynamic> toMap() => {
    "id": id,
    "user_id": userId,
    "title": title,
    "body": body
  };

}


