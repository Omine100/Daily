import 'package:flutter/material.dart';
import 'package:daily/servicesLocal/colorManagement.dart';
import 'package:daily/servicesLocal/systemPreferences.dart';

extension Neumorphic on Widget {
  addWrapper({
    double depth = 0.0,
    double borderRadius = 0.0,
    double blurRadius = 0.0,
    double height = 0.0,
    double width = 0.0,
    Offset blurOffset = const Offset(0, 0),
    Color backgroundColor = const Color(0x00FFFFFF),
    bool isEnabled = false,
  }) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(borderRadius),
        boxShadow: [
          BoxShadow(
            offset: blurOffset,
            blurRadius: blurRadius,
            color: adjust(backgroundColor, isDark ? 0.2 : -0.2),
          ),
          BoxShadow(
            offset: Offset(-blurOffset.dx, -blurOffset.dx),
            blurRadius: blurRadius,
            color: adjust(backgroundColor, isDark ? -0.2 : 0.2),
          ),
        ],
      ),
      child: this,
    );
  }
}
