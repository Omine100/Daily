import 'package:flutter/material.dart';

extension Glassmorphism on Widget {
  addWrapperGlass({
    double borderRadius = 0.0,
    double height = 0.0,
    double width = 0.0,
    double containerBlur = 0.0,
    double edgeBlue = 0.0,
    Color containerColor = const Color(0x00FFFFF),
    Color edgeColor = const Color(0x00FFFFFF),
  }) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(borderRadius),
        color: containerColor,
      ),
    );
  }
}
