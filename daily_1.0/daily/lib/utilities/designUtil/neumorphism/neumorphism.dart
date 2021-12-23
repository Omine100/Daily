import 'package:flutter/material.dart';
import 'package:daily/servicesLocal/settingsDeclaration.dart';
import 'package:daily/utilities/managementUtil/colorManagement.dart';
import 'package:daily/utilities/designUtil/neumorphism/neumorphicCorner.dart';

enum NeumorphicLightSource {
  topLeft,
  topRight,
  bottomLeft,
  bottomRight,
}

enum NeumorphicShape {
  concave,
  convex,
  emboss,
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
    NeumorphicLightSource lightSource = NeumorphicLightSource.topLeft,
    NeumorphicShape shape = NeumorphicShape.convex,
  }) {
    final offset = sourceToOffset(lightSource, distance);

    final boxShadow = [
      BoxShadow(
        blurRadius: blurRadius,
        offset: -offset,
        color:
            colorShadow(backgroundColor, isDark.value ? -intensity : intensity),
      ),
      BoxShadow(
        blurRadius: blurRadius,
        offset: offset,
        color:
            colorShadow(backgroundColor, isDark.value ? intensity : -intensity),
      )
    ];

    final innerShadow = ConcaveDecoration(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      colors: [
        colorShadow(backgroundColor, isDark.value ? intensity : -intensity),
        colorShadow(backgroundColor, isDark.value ? -intensity : intensity)
      ],
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
      decoration: shape == NeumorphicShape.emboss ? innerShadow : outerShadow,
      child: Center(
        child: this,
      ),
    );
  }
}
