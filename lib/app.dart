import 'package:flutter/material.dart';
import 'package:teste_framework/pages/appPage.dart';
import 'package:teste_framework/routes.dart';
import 'package:teste_framework/startup.dart';

class App extends StatefulWidget {
  App({Key key}) : super(key: key);
  final Startup startup = Startup();
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  bool _started = false;
  int _selectedPage = 0;
  Router _router = Router();
  List<AppPage> _pages =  Router.pages;

  @override
  void initState() {
    super.initState();
    widget.startup.start().then((value) => {
        setState(() {
          _started = true;
        })
    });
  }

  void _switchPage(int index) {
    setState(() {
      _selectedPage = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    if(_started) {
      return Scaffold(
        appBar: AppBar(
          title: Text(_pages[_selectedPage].getTitle()),
        ),
        bottomNavigationBar: BottomNavigationBar(
            items: _router.getNavItems(),
            currentIndex: _selectedPage,
            selectedItemColor: Theme.of(context).primaryColor,
            unselectedItemColor: Colors.grey,
            showUnselectedLabels: true,
            onTap: _switchPage
        ),
        body: Center(
          child: _pages[_selectedPage],
        ),
      );
    }
    return Scaffold(
      body: Center(
        child: Text('Carregando!'),
      ),
    );
  }
}