import 'package:flutter/material.dart';
import 'dart:ui';

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
        boxShadow: [
          BoxShadow(
            blurRadius: 24,
            spreadRadius: 16,
            color: Colors.black.withOpacity(0.2),
          )
        ]
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16.0),
        child: BackdropFilter(
          filter: ImageFilter.blur(
            sigmaX: 20.0,
            sigmaY: 20.0,
          ),
          child: Container(
            height: 300,
            width: 300,
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.2),
              borderRadius: BorderRadius.circular(16.0),
              border: Border.all(
                width: 1.5,
                color: Colors.white.withOpacity(0.2),
              )
            ),
            child: this
          ),
        ),
      ),
    );
  }
}
