import 'package:flutter/material.dart';
import 'package:daily/servicesLocal/colorManagement.dart';
import 'package:daily/servicesLocal/systemPreferences.dart';

enum NeumorphicLightSource {
  topLeft,
  topRight,
  bottomLeft,
  bottomRight,
}

enum NeumorphicShape {
  concave,
  convex,
  emboxx,
  flat,
}

Offset sourceToOffset(NeumorphicLightSource lightSource, double distance) {
  Offset offset;
  switch (lightSource) {
    case NeumorphicLightSource.topLeft:
      offset = Offset(distance, distance);
      break;
    case NeumorphicLightSource.topRight:
      offset = Offset(-distance, distance);
      break;
    case NeumorphicLightSource.bottomLeft:
      offset = Offset(distance, -distance);
      break;
    case NeumorphicLightSource.bottomRight:
      offset = Offset(-distance, -distance);
      break;
  }
  return offset;
}

extension Neumorphic on Widget {
  addWrapper({
    Duration duration = const Duration(milliseconds: 100),
    double borderRadius = 0.0,
    double height = 0.0,
    double width = 0.0,
    double distance = 0.0,
    NeumorphicLightSource lightSource = NeumorphicLightSource.topLeft,
    double blurRadius = 0.0,
    Offset blurOffset = const Offset(0, 0),
    NeumorphicShape shape = NeumorphicShape.convex,
    Color backgroundColor = const Color(0x00FFFFFF),
    bool isEnabled = false,
  }) {
    return AnimatedContainer(
      duration: duration,
      height: height,
      width: width,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(borderRadius),
        boxShadow: [
          BoxShadow(
            offset: blurOffset,
            blurRadius: blurRadius,
            color: colorShade(backgroundColor, isDark ? 0.2 : -0.2),
          ),
          BoxShadow(
            offset: Offset(-blurOffset.dx, -blurOffset.dx),
            blurRadius: blurRadius,
            color: colorShade(backgroundColor, isDark ? -0.2 : 0.2),
          ),
        ],
      ),
      child: this,
    );
  }
}
