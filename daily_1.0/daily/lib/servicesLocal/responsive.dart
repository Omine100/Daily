import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

class Responsive extends StatelessWidget {
  final Widget mobile;
  final Widget tablet;
  final Widget desktop;
  final Widget web;

  const Responsive({
    Key key,
    @required this.mobile,
    @required this.tablet,
    @required this.desktop,
    @required this.web,
  }) : super(key: key);

  static bool isMobile(BuildContext context) =>
      MediaQuery.of(context).size.width < 650;

  static bool isTablet(BuildContext context) =>
      MediaQuery.of(context).size.width < 1300 &&
      MediaQuery.of(context).size.width >= 650;

  static bool isDesktop(BuildContext context) =>
      MediaQuery.of(context).size.width >= 1300;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (kIsWeb) {
          SystemChrome.setPreferredOrientations(
              [DeviceOrientation.landscapeLeft]);
          return web;
        }
        if (constraints.maxWidth >= 1300) {
          SystemChrome.setPreferredOrientations(
              [DeviceOrientation.landscapeLeft]);
          return desktop;
        } else if (constraints.maxWidth >= 650) {
          SystemChrome.setPreferredOrientations(
              [DeviceOrientation.landscapeLeft]);
          return tablet;
        } else {
          SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
          return mobile;
        }
      },
    );
  }
}
