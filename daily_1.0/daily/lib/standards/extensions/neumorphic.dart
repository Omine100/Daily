import 'package:flutter/material.dart';

extension Neumorphic on Widget {
  addWrapper({
    double depth = 0.0,
    double borderRadius = 0.0,
    double blurRadius = 0.0,
    double height = 0.0,
    double width = 0.0,
    Offset blurOffset = const Offset(0, 0),
    Color backgroundColor = const Color(0x00FFFFFF),
    bool isDarkEnabled = false,
    bool isEnabled = false,
  }) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(borderRadius),
        boxShadow: [
          BoxShadow(
            offset: blurOffset,
            blurRadius: blurRadius,
            color: bottomShadowColor,
          ),
          BoxShadow(
            offset: Offset(-blurOffset.dx, -blurOffset.dx),
            blurRadius: blurRadius,
            color: topShadowColor,
          ),
        ],
      ),
      child: this,
    );
  }
}
