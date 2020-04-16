import 'package:flutter/material.dart';
import 'package:camera/camera.dart';

List<CameraDescription> cameras;
CameraController controller;

class CameraRoute extends StatefulWidget {
  CameraRoute({Key key}) : super(key: key);

  @override
  _CameraRouteState createState() => _CameraRouteState();
}

class _CameraRouteState extends State<CameraRoute> with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);

    availableCameras().then((cams) {
      cameras = cams;
      controller = new CameraController(cameras[0], ResolutionPreset.high);
      controller.initialize().then((_) {
        if (!mounted) {
          return;
        }
        setState(() {});
      });
    });
  }

  @override
  void dispose() {
    controller?.dispose();
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> columnChildren = <Widget>[];

    if (controller != null) {
      columnChildren.add(new Expanded(
          child: AspectRatio(
        aspectRatio: controller.value.aspectRatio,
        child: CameraPreview(controller),
      )));
    } else {
      columnChildren.add(new Center(
          child: new Directionality(
              textDirection: TextDirection.ltr,
              child: new Icon(Icons.question_answer))));
    }

    return new Column(
      children: columnChildren,
    );
  }
}
