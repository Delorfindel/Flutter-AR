import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:icon_shadow/icon_shadow.dart';
import 'package:myapp/PlayButton.dart';

class CustomBottomBar extends StatefulWidget {
  final scroll;
  final pageController;
  CustomBottomBar({Key key, this.scroll, this.pageController})
      : super(key: key);

  // CustomBottomBar({Key key})
  //     : super(key: key);

  @override
  _CustomBottomBarState createState() => _CustomBottomBarState();
}

class _CustomBottomBarState extends State<CustomBottomBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Container(
            alignment: Alignment.center,
            height: 150,
            // color: Colors.transparent,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.transparent, Colors.black38],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
            child:
                Row(crossAxisAlignment: CrossAxisAlignment.center, children: <
                    Widget>[
              Spacer(),
              FlatButton(
                  onPressed: () => widget.pageController.animateToPage(
                        0,
                        duration: const Duration(milliseconds: 400),
                        curve: Curves.easeInOut,
                      ),
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  child: Container(
                      alignment: Alignment.center,
                      child: Column(mainAxisAlignment: MainAxisAlignment.center,
                          // crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                                margin: EdgeInsets.only(bottom: 5),
                                child: IconShadowWidget(
                                    Icon(
                                      Icons.apps,
                                      color: Colors.white,
                                      size: 40.0,
                                      semanticLabel:
                                          'Text to announce search input',
                                    ),
                                    shadowColor: Colors.black38)),
                            Container(
                                margin: EdgeInsets.only(bottom: 10),
                                child: Text("Search",
                                    style: TextStyle(
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.white,
                                      shadows: [
                                        Shadow(
                                          blurRadius: 10.0,
                                          color: Colors.black45,
                                          offset: Offset(0, 0),
                                        ),
                                      ],
                                    ))),
                            SizedBox(
                                width: 50,
                                height: 5,
                                child: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Container(
                                          child: AnimatedOpacity(
                                              duration: Duration(seconds: 0),
                                              opacity: widget.scroll <= 1
                                                  ? lerpDouble(
                                                      1, 0, widget.scroll)
                                                  : 0,
                                              child: AnimatedContainer(
                                                duration: Duration(seconds: 0),
                                                width: widget.scroll <= 1
                                                    ? lerpDouble(
                                                        50, 0, widget.scroll)
                                                    : 0,
                                                height: 5,
                                                // margin: EdgeInsets.only(bottom: 10),
                                                decoration: BoxDecoration(
                                                  color: widget.scroll <= 1
                                                      ? Color.lerp(
                                                          Colors.white,
                                                          Colors.transparent,
                                                          widget.scroll)
                                                      : Colors.transparent,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          20.0),
                                                  boxShadow: [
                                                    BoxShadow(
                                                      blurRadius: 10.0,
                                                      color: Colors.black45,
                                                      offset: Offset(0, 0),
                                                    )
                                                  ],
                                                ),
                                              )))
                                    ]))
                          ]))),
              Spacer(),
              PlayButton(
                  scroll: widget.scroll, pageController: widget.pageController),
              Spacer(),
              FlatButton(
                  onPressed: () => widget.pageController.animateToPage(
                        2,
                        duration: const Duration(milliseconds: 400),
                        curve: Curves.easeInOut,
                      ),
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  child: Container(
                      alignment: Alignment.center,
                      child: Column(mainAxisAlignment: MainAxisAlignment.center,
                          // crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                                margin: EdgeInsets.only(bottom: 5),
                                child: IconShadowWidget(
                                    Icon(
                                      Icons.settings,
                                      color: Colors.white,
                                      size: 40.0,
                                      semanticLabel:
                                          'Text to announce search input',
                                    ),
                                    shadowColor: Colors.black38)),
                            Container(
                                margin: EdgeInsets.only(bottom: 10),
                                child: Text("Settings",
                                    style: TextStyle(
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.white,
                                      shadows: [
                                        Shadow(
                                          blurRadius: 10.0,
                                          color: Colors.black45,
                                          offset: Offset(0, 0),
                                        ),
                                      ],
                                    ))),
                            SizedBox(
                                width: 50,
                                height: 5,
                                child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Container(
                                          child: AnimatedOpacity(
                                              duration: Duration(seconds: 0),
                                              opacity: widget.scroll >= 1
                                                  ? lerpDouble(
                                                      0, 1, widget.scroll - 1)
                                                  : 0,
                                              child: AnimatedContainer(
                                                duration: Duration(seconds: 0),
                                                width: widget.scroll >= 1
                                                    ? lerpDouble(0, 50,
                                                        widget.scroll - 1)
                                                    : 0,
                                                height: 5,
                                                // margin: EdgeInsets.only(bottom: 10),
                                                decoration: BoxDecoration(
                                                  color: widget.scroll >= 1
                                                      ? Color.lerp(
                                                          Colors.transparent,
                                                          Colors.white,
                                                          widget.scroll)
                                                      : Colors.transparent,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          20.0),
                                                  boxShadow: [
                                                    BoxShadow(
                                                      blurRadius: 10.0,
                                                      color: Colors.black45,
                                                      offset: Offset(0, 0),
                                                    )
                                                  ],
                                                ),
                                              )))
                                    ]))
                          ]))),
              Spacer()
            ])));
  }

  Color getColorLerp(int menu, double pageController) {
    if (pageController < 1) {
      if (menu == 0) {
        return Color.lerp(
            Theme.of(context).primaryColor, Colors.white, pageController);
      } else if (menu == 1) {
        return Color.lerp(
            Colors.white, Theme.of(context).primaryColor, pageController);
      } else if (menu == 2) {
        return Colors.white;
      }
    } else if (pageController > 1 && pageController <= 2) {
      if (menu == 0) {
        return Colors.white;
      } else if (menu == 1) {
        return Color.lerp(
            Theme.of(context).primaryColor, Colors.white, pageController - 1);
      } else if (menu == 2) {
        return Color.lerp(
            Colors.white, Theme.of(context).primaryColor, pageController - 1);
      }
    }
    return Colors.white;
  }
}
