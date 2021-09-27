import 'package:flutter/material.dart';

Color adjust(Color color, double amount) {
  assert(amount >= -1 && amount <= 1);

  final hsl = HSLColor.fromColor(color);
  if (amount < 0)
    return hsl
        .withLightness((hsl.lightness - amount).clamp(0.0, 1.0))
        .toColor();
  return hsl.withLightness((hsl.lightness + amount).clamp(0.0, 1.0)).toColor();
}
