import 'package:flutter/material.dart';

class CustomAppBar extends StatefulWidget implements PreferredSizeWidget {
  final scroll;
  CustomAppBar({Key key, this.scroll})
      : preferredSize = Size.fromHeight(kToolbarHeight),
        super(key: key);

  @override
  final Size preferredSize; // default is 56.0

  @override
  _CustomAppBarState createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text("Sample App Bar"),
      // toolbarOpacity: 1 - widget.scroll,
      backgroundColor: Color.lerp(Theme.of(context).primaryColor, Colors.deepPurple, widget.scroll),
      elevation: 10,
    );
  }
}
