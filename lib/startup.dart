import 'package:teste_framework/services/services.dart';

class Startup {
  final List<AbstractService> _services = new List();

  Startup () {
    addServices();
  }

  void addServices () {
    _services.addAll([AlbumService(), PostService(), TodoService()]);
  }

  Future<void> synchronize () async {
    List<Future<void>> syncs = new List();
    _services.forEach((service) => {
      if(service.shouldSync()) {
        syncs.add(service.sync())
      }
    });

    return Future.wait(syncs);
  }

  Future<void> start () async {
    return await synchronize();
  }
}