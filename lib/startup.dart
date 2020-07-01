import 'package:teste_framework/services/services.dart';

class Startup {
  final List<AbstractService> _services = new List();

  Startup () {
    addServices();
  }

  void addServices () {
    _services.addAll([AlbumService(), PostService(), TodoService()]);
  }

  void synchronize () {
    _services.forEach((service) => {
      if(service.shouldSync()) {
        service.sync()
      }
    });
  }

  void start () async {
    synchronize();
  }
}