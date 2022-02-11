import 'package:flutter/material.dart';
import 'package:newapp/src/pages/tab1_page.dart';
import 'package:newapp/src/pages/tab2_page.dart';
import 'package:provider/provider.dart';

class _NavegacionModel with ChangeNotifier {
  int _paginaActual = 0;
  PageController _pageController = PageController();

  int get paginaActual => this._paginaActual;

  set paginaActual(int value) {
    this._paginaActual = value;
    this._pageController.animateToPage(value, duration: Duration(milliseconds: 250), curve: Curves.easeOut);
    notifyListeners();
  }

  PageController get pageController => this._pageController;

  set pageController(PageController value) {
    this._pageController = value;
  }
}

class TabsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => _NavegacionModel(),
      child: Scaffold(
        body: _Paginas(),
        bottomNavigationBar: _Navigation(),
      ),
    );
  }
}

class _Navigation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final navegacionModel = Provider.of<_NavegacionModel>(context);

    return BottomNavigationBar(
      currentIndex: navegacionModel.paginaActual,
      onTap: (i) => navegacionModel.paginaActual = i,
      items: [
        BottomNavigationBarItem(title: Text('Para ti'), icon: Icon(Icons.person_outline)),
        BottomNavigationBarItem(title: Text('Encabezados'), icon: Icon(Icons.public))
      ],
    );
  }
}

class _Paginas extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final navegacionModel = Provider.of<_NavegacionModel>(context);

    return PageView(
      controller: navegacionModel.pageController,
      physics: NeverScrollableScrollPhysics(),
      children: <Widget>[
        Tab1Page(),
        Tab2Page()
      ],
    );
  }
}
