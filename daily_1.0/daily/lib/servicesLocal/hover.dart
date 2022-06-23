import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

extension HoverExtensions on Widget {
  Widget get showClickOnHover {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: this,
    );
  }
}
