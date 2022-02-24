import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'dart:io' show Platform;

class Adaptive extends StatelessWidget {
  final Widget iOS;
  final Widget android;
  final Widget web;

  const Adaptive({
    Key key,
    @required this.iOS,
    @required this.android,
    @required this.web,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: ((context, constraints) {
      if (Platform.isIOS) {
        SystemChrome.setPreferredOrientations(
            [DeviceOrientation.landscapeLeft]);
        return iOS;
      } else if (Platform.isAndroid) {
        SystemChrome.setPreferredOrientations(
            [DeviceOrientation.landscapeLeft]);
        return android;
      } else if (kIsWeb) {
        SystemChrome.setPreferredOrientations(
            [DeviceOrientation.landscapeLeft]);
        return web;
      }
    }));
  }
}
