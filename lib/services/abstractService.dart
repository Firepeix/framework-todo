import 'dart:convert';
import 'package:http/http.dart' as http;

abstract class AbstractService {
  final String baseUri = 'https://jsonplaceholder.typicode.com';
  String uri;

  bool shouldSync ();
  Future<void> sync () async {

  }

  Future<List> fetch() async {
    var response = await http.get(uri);
    return json.decode(response.body);
  }
}