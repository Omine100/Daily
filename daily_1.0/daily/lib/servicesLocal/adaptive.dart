import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'dart:io';

class Adaptive extends StatelessWidget {
  final Widget iOS;
  final Widget android;
  final Widget web;

  const Adaptive({
    Key? key,
    required this.iOS,
    required this.android,
    required this.web,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: ((context, constraints) {
      if (kIsWeb) {
        SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
        return web;
      } else if (Platform.isIOS) {
        SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
        return iOS;
      } else if (Platform.isAndroid) {
        SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
        return android;
      }
      return web;
    }));
  }
}

class AdaptiveText extends StatelessWidget {
  final String text;
  final TextStyle? style;
  AdaptiveText(this.text, {this.style});

  @override
  Widget build(BuildContext context) {
    if (kIsWeb) {
      return SelectableText(
        text,
        style: style,
      );
    }

    return Text(
      text,
      style: style,
    );
  }
}
