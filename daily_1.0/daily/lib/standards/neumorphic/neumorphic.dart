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

extension Neumorphic on Widget {
  addWrapper({
    Duration duration = const Duration(milliseconds: 100),
    double borderRadius = 0.0,
    double height = 0.0,
    double width = 0.0,
    double distance = 0.0,
    double intensity = 0.2,
    NeumorphicLightSource lightSource = NeumorphicLightSource.topLeft,
    NeumorphicShape shape = NeumorphicShape.convex,
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
            shape == NeumorphicShape.flat
                ? backgroundColor
                : colorShadow(backgroundColor,
                    shape == NeumorphicShape.convex ? 0.07 : -0.1),
            shape == NeumorphicShape.flat
                ? backgroundColor
                : colorShadow(backgroundColor,
                    shape == NeumorphicShape.convex ? -0.1 : 0.07),
          ],
        ),
        borderRadius: BorderRadius.circular(borderRadius),
        boxShadow: [
          BoxShadow(
            offset:
                shape == NeumorphicShape.emboss ? offset.scale(2.5, 2.5) : offset,
            blurRadius: blurRadius,
            color: colorShadow(backgroundColor, isDark ? -intensity : intensity),
            spreadRadius: shape == NeumorphicShape.emboss ? -15.0 : 0.0,
          ),
          BoxShadow(
            offset:
                shape == NeumorphicShape.emboss ? offset.scale(-2.5, -2.5) : offset.scale(-3, -3),
            blurRadius: blurRadius,
            color: colorShadow(backgroundColor, isDark ? intensity : -intensity),
            spreadRadius: shape == NeumorphicShape.emboss ? -15.0 : 0.0,
          ),
        ],
      ),
      child: Center(
        child: this,
      ),
    );
  }
}
