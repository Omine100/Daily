import 'package:flutter/material.dart';
import 'dart:ui';

extension Glassmorphism on Widget {
  addWrapperGlass({
    double borderRadius = 0.0,
    double height = 0.0,
    double width = 0.0,
    double shadowBlur = 24,
    double containerSpread = 16,
    double backdropBlur = 20,
    Color containerColor = const Color(0xFFFFFFF),
    Color shadowColor = const Color(0xFF000000),
    Color edgeColor = const Color(0x00FFFFFF),
    double colorOpacity = 0.2,
  }) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(borderRadius),
          color: containerColor,
          boxShadow: [
            BoxShadow(
              blurRadius: shadowBlur,
              spreadRadius: containerSpread,
              color: shadowColor.withOpacity(colorOpacity),
            )
          ]),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(borderRadius),
        child: BackdropFilter(
          filter: ImageFilter.blur(
            sigmaX: backdropBlur,
            sigmaY: backdropBlur,
          ),
          child: Container(
              height: height,
              width: width,
              decoration: BoxDecoration(
                  color: Colors.white.withOpacity(colorOpacity),
                  borderRadius: BorderRadius.circular(borderRadius),
                  border: Border.all(
                    width: 1.5,
                    color: edgeColor.withOpacity(colorOpacity),
                  )),
              child: this),
        ),
      ),
    );
  }
}
