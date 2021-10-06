import 'package:flutter/material.dart';
import 'package:daily/servicesLocal/systemPreferences.dart';
import 'package:daily/utilities/colorManagement.dart';
import 'package:daily/utilities/neumorphism/neumorphicCorner.dart';

enum NeumorphicLightSources {
  topLeft,
  topRight,
  bottomLeft,
  bottomRight,
}

enum NeumorphicShapes {
  concave,
  convex,
  emboss,
  flat,
}

Offset sourceToOffset(NeumorphicLightSources lightSource, double distance) {
  Offset offset;
  switch (lightSource) {
    case NeumorphicLightSources.topLeft:
      offset = Offset(distance, distance);
      break;
    case NeumorphicLightSources.topRight:
      offset = Offset(-distance, distance);
      break;
    case NeumorphicLightSources.bottomLeft:
      offset = Offset(distance, -distance);
      break;
    case NeumorphicLightSources.bottomRight:
      offset = Offset(-distance, -distance);
      break;
  }
  return offset;
}

extension Neumorphism on Widget {
  addWrapperNeu({
    Duration duration = const Duration(milliseconds: 100),
    double borderRadius = 0.0,
    double height = 0.0,
    double width = 0.0,
    double distance = 0.0,
    double intensity = 0.0,
    double blurRadius = 0.0,
    Color backgroundColor = const Color(0x00FFFFFF),
    NeumorphicLightSources lightSource = NeumorphicLightSources.topLeft,
    NeumorphicShapes shape = NeumorphicShapes.convex,
  }) {
    final offset = sourceToOffset(lightSource, distance);

    final boxShadow = [
      BoxShadow(
        blurRadius: blurRadius,
        offset: -offset,
        color: colorShadow(backgroundColor, isDark ? -intensity : intensity),
      ),
      BoxShadow(
        blurRadius: blurRadius,
        offset: offset,
        color: colorShadow(backgroundColor, isDark ? intensity : -intensity),
      )
    ];

    final innerShadow = ConcaveDecoration(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      colors: [colorShadow(backgroundColor, isDark ? intensity : -intensity), colorShadow(backgroundColor, isDark ? -intensity : intensity)],
      depression: distance,
    );

    final outerShadow = BoxDecoration(
      borderRadius: BorderRadius.circular(borderRadius),
      color: backgroundColor,
      boxShadow: boxShadow,
    );

    return AnimatedContainer(
      duration: duration,
      height: height,
      width: width,
      decoration: shape == NeumorphicShapes.emboss ? innerShadow : outerShadow,
      child: Center(
        child: this,
      ),
    );
  }
}
