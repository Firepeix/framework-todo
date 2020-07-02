import 'package:teste_framework/app/models/model.dart';

class Album extends Model<Album> {
  int userId;
  String title;

  Album({this.userId, this.title});

  @override
  factory Album.fromMap(Map<String, dynamic> json, { bool exists = false }) {
    return Album.fromJson(json, exists: exists);
  }

  factory Album.fromJson(Map<String, dynamic> json, { bool exists = false }) {
    var album = Album(userId: json['userId'], title: json['title']);
    album.persistExistence(json, exists);
    return album;
  }

  int getUserId() {
    return userId;
  }

  String getTitle() {
    return title;
  }


  @override
  Album update(Album model) {
    this.userId = model.userId;
    this.title = model.title;
    return this;
  }

  Map<String, dynamic> toMap() => {
    "id": id,
    "userId": userId,
    "title": title
  };

}


