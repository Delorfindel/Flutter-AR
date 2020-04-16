import 'package:flutter/material.dart';
import 'package:myapp/CatalogRoute.dart';
import "CustomBottomBar.dart";

class Pager extends StatefulWidget {
  Pager({Key key}) : super(key: key);

  @override
  _PagerState createState() => _PagerState();
}

class _PagerState extends State<Pager> {
  PageController _pageController;
  int index;
  double _scroll;
  int _previousPage;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(
      initialPage: 0,
    )..addListener(_onScroll);
    index = 0;
    _scroll = 0;
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_pageController.page.toInt() == _pageController.page) {
      _previousPage = _pageController.page.toInt();
    }
    setState(() {
      _scroll = _pageController.page;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Stack(children: <Widget>[
      PageView(
        onPageChanged: (page) {
          setState(() {
            index = page;
          });
        },
        controller: _pageController,
        children: <Widget>[
          //Left Widget
          Container(
            decoration: new BoxDecoration(
              color: Colors.white,
            ),
            child: SafeArea(child: CatalogRoute(scroll: _scroll)),
          ),
          //Center Widget
          Opacity(
            opacity: 0.0,
            child: Container(color: Colors.white),
          ),
          //Right Widget
          Container(
            decoration: new BoxDecoration(
              color: Colors.white,
            ),
            child: SafeArea(child: Center(child: Text(_scroll.toString()))),
          ),
        ],
      ),
      Align(alignment: Alignment.bottomCenter, child: CustomBottomBar(scroll: _scroll, pageController: _pageController))
    ]));
  }
}
