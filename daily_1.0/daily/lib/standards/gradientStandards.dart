import 'package:flutter/material.dart';

class GradientStandards {
  //MECHANICS
  Shader textLinearGradient(
      BuildContext context, Color topLeftColor, Color bottomRightColor) {
    final Shader linearGradient =
        LinearGradient(colors: <Color>[topLeftColor, bottomRightColor])
            .createShader(Rect.fromLTWH(110.0, 110.0, 0.0, 0.0));
    return linearGradient;
  }

  LinearGradient bodyLinearGradient(BuildContext context, Color topLeftColor,
      Color bottomRightColor, bool isSmall) {
    final LinearGradient linearGradient = LinearGradient(
      begin: isSmall ? Alignment.centerRight : Alignment.topRight,
      end: Alignment.bottomLeft,
      colors: <Color>[topLeftColor, bottomRightColor],
    );
    return linearGradient;
  }
}
