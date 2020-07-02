import 'package:teste_framework/app/models/model.dart';

class Todo extends Model<Todo> {
  int userId;
  String title;
  bool completed;

  Todo({this.userId, this.title, this.completed});

  @override
  factory Todo.fromMap(Map<String, dynamic> json, { bool exists = false }) {
    return Todo.fromJson(json, exists: exists);
  }

  factory Todo.fromJson(Map<String, dynamic> json, { bool exists = false }) {
    var post = Todo(userId: json['userId'], title: json['title'], completed: json['completed'] == 1 || json['completed'] == true);
    post.persistExistence(json, exists);
    return post;
  }

  int getUserId() => userId;
  String getTitle() => title;
  bool isCompleted() => completed;


  @override
  Todo update(Todo model) {
    this.userId = model.userId;
    this.title = model.title;
    this.completed = model.completed;
    return this;
  }

  Map<String, dynamic> toMap() => {
    "id": id,
    "userId": userId,
    "title": title,
    "completed": completed ? 1 : 0
  };

}


