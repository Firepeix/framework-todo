abstract class Model<TModel> {
  int id;
  bool exists = false;

  int getId() {
    return id;
  }

  bool modelExists () {
    return exists;
  }

  TModel update(TModel model);

  void persistExistence(dynamic json, bool exists ) {
    if(json['id'] != null) {
      this.id = json['id'];
    }
    this.exists = exists;
  }

  Map<String, dynamic> toMap();
}