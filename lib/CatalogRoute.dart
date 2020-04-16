import 'package:flutter/material.dart';

class SearchBar extends StatefulWidget {
  SearchBar({Key key}) : super(key: key);

  @override
  _SearchBarState createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints.expand(width: double.infinity, height: 50),
      padding: EdgeInsets.all(16.0),
      decoration: new ShapeDecoration(
          color: Colors.black12,
          shape: new RoundedRectangleBorder(
              borderRadius: new BorderRadius.circular(200))),
      child: Center(
          child: Row(crossAxisAlignment: CrossAxisAlignment.center,
              // mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
            Container(
                margin: EdgeInsets.only(right: 10),
                child: Icon(
                  Icons.search,
                  color: Colors.black87,
                  size: 24.0,
                  semanticLabel: 'Text to announce search input',
                )),
            Text("Search...",
                style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.w600,
                    color: Colors.black26))
            // Container(
            //   child: TextField(
            //       decoration: InputDecoration(labelText: "Search..."),
            //       style: TextStyle(
            //           fontSize: 16.0,
            //           fontWeight: FontWeight.w600,
            //           color: Colors.black26))
            // )
          ])),
    );
  }
}

class CatalogRoute extends StatefulWidget {
  final scroll;
  CatalogRoute({Key key, this.scroll}) : super(key: key);

  @override
  _CatalogRoute createState() => _CatalogRoute();
}

class _CatalogRoute extends State<CatalogRoute> {
  @override
  Widget build(BuildContext context) {
    return Container(
        constraints: BoxConstraints.expand(),
        alignment: Alignment.topCenter,
        padding: EdgeInsets.all(16.0),
        // child: Column(
        //     children: <Widget>[SearchBar(), Text(widget.scroll.toString())]));
        child: SearchBar());
  }
}
