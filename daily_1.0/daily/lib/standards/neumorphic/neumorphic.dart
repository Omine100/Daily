import 'package:flutter/material.dart';
import 'package:daily/servicesLocal/colorManagement.dart';
import 'package:daily/servicesLocal/systemPreferences.dart';

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
  addWrapper({
    Duration duration = const Duration(milliseconds: 100),
    double borderRadius = 0.0,
    double height = 0.0,
    double width = 0.0,
    double distance = 0.0,
    double intensity = 0.2,
    NeumorphicLightSources lightSource = NeumorphicLightSources.topLeft,
    NeumorphicShapes shape = NeumorphicShapes.convex,
    double blurRadius,
    Color backgroundColor = const Color(0x00FFFFFF),
  }) {
    final offset = sourceToOffset(lightSource, distance);

    return AnimatedContainer(
      duration: duration,
      height: height,
      width: width,
      decoration: BoxDecoration(
        color: backgroundColor,
        gradient: LinearGradient(
          begin: Alignment(
            -offset.dx.clamp(-1, 1).toDouble(),
            -offset.dy.clamp(-1, 1).toDouble(),
          ),
          end: Alignment(
            offset.dx.clamp(-1, 1).toDouble(),
            offset.dy.clamp(-1, 1).toDouble(),
          ),
          colors: [
            shape == NeumorphicShapes.flat
                ? backgroundColor
                : colorShadow(backgroundColor,
                    shape == NeumorphicShapes.convex ? 0.07 : -0.1),
            shape == NeumorphicShapes.flat
                ? backgroundColor
                : colorShadow(backgroundColor,
                    shape == NeumorphicShapes.convex ? -0.1 : 0.07),
          ],
        ),
        borderRadius: BorderRadius.circular(borderRadius),
        boxShadow: [
          BoxShadow(
            offset:
                shape == NeumorphicShapes.emboss ? offset.scale(1, 1) : offset,
            blurRadius: blurRadius,
            color: colorShadow(backgroundColor, isDark ? -intensity : intensity),
            spreadRadius: shape == NeumorphicShapes.emboss ? -15.0 : 0.0,
          ),
          BoxShadow(
            offset:
                shape == NeumorphicShapes.emboss ? offset.scale(-1, -1) : offset.scale(-3, -3),
            blurRadius: blurRadius,
            color: colorShadow(backgroundColor, isDark ? intensity : -intensity),
            spreadRadius: shape == NeumorphicShapes.emboss ? -15.0 : 0.0,
          ),
        ],
      ),
      child: Center(
        child: this,
      ),
    );
  }
}
