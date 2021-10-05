import 'package:flutter/material.dart';
import 'package:daily/utilities/colorManagement.dart';
import 'package:daily/servicesLocal/systemPreferences.dart';
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

    final boxShadow = [
      BoxShadow(
        blurRadius: 15,
        offset: -Offset(5, 5),
        color: Colors.white,
      ),
      BoxShadow(
        blurRadius: 15,
        offset: Offset(4.5, 4.5),
        color: Colors.grey.shade400,
      )
    ];

    final innerShadow = ConcaveDecoration(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(25),
      ),
      colors: [Colors.grey.shade200, Colors.grey.shade400],
      depression: 10,
    );

    final outerShadow = BoxDecoration(
      border: Border.all(color: Colors.grey.shade400),
      borderRadius: BorderRadius.circular(25),
      color: Colors.grey.shade300,
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
