import 'package:flutter/material.dart';
import 'CameraRoute.dart';
import "Pager.dart";

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  MyApp({Key key}) : super(key: key);

  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  

  @override
  Widget build(BuildContext context) {
    // print(_pageController.page);
    return MaterialApp(
        theme: ThemeData(
          primaryColor: Colors.blue
        ),
        title: 'SexyAR',
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            // appBar: CustomAppBar(scroll: _scroll),
            body: Center(
            child: Container(
              child: Stack(
                children: <Widget>[
                  CameraRoute(),
                  Pager(),
                  
                ],
              ),
            ),
          ),
        ));
  }
}
