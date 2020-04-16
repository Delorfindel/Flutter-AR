import 'package:flutter/material.dart';
import 'dart:ui';

class PlayButton extends StatefulWidget {
  final scroll;
  final pageController;
  PlayButton({Key key, this.scroll, this.pageController}) : super(key: key);

  @override
  _PlayButtonState createState() => _PlayButtonState();
}

class _PlayButtonState extends State<PlayButton> {
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
    } else if (pageController >= 1 && pageController <= 2) {
      if (menu == 0) {
        return Colors.white;
      } else if (menu == 1) {
        return Color.lerp(
            Theme.of(context).primaryColor, Colors.white, pageController - 1);
      } else if (menu == 2) {
        print(pageController.toString());
        return Color.lerp(
            Colors.white, Theme.of(context).primaryColor, pageController - 1.1);
      }
    }
    return Colors.white;
  }

  double getPlayMargin(double scroll) {
    double toUse = scroll;
    if (scroll > 1) {
      toUse = 1 - (scroll - 1);
    }
    return lerpDouble(0, 50, toUse);
  }

  double getPlaySize(double scroll) {
    double toUse = scroll;
    if (scroll > 1) {
      toUse = 1 - (scroll - 1);
    }
    return lerpDouble(80, 100, toUse);
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: 150,
        height: 150,
        child: Container(
          alignment: Alignment.center,
            margin: EdgeInsets.only(
                bottom: getPlayMargin(widget.pageController.page)),
            child: FlatButton(
                onPressed: () => widget.pageController.animateToPage(
                      1,
                      duration: const Duration(milliseconds: 400),
                      curve: Curves.easeInOut,
                    ),
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                child: SizedBox(
                    width: getPlaySize(widget.pageController.page),
                    height: getPlaySize(widget.pageController.page),
                    child: Container(
                      alignment: Alignment.center,
                      decoration: new ShapeDecoration(
                          shape: new CircleBorder(
                              side: new BorderSide(
                                  width: 5.0, color: Colors.white))),
                      // child:
                      // Text("Play!",
                      //     style: TextStyle(
                      //       fontSize: 20.0,
                      //       fontWeight: FontWeight.w600,
                      //       color: getColorLerp(1, widget.pageController.page),
                      //       shadows: [
                      //         Shadow(
                      //           blurRadius: 10.0,
                      //           color: Colors.black45,
                      //           offset: Offset(0, 0),
                      //         ),
                      //       ],
                      //     ))
                    )))));
  }
}
