import 'package:flutter/material.dart';
import 'dart:math';

Color colorShade(Color color, double amount) {
  assert(amount >= -1 && amount <= 1);

  final hsl = HSLColor.fromColor(color);
  if (amount < 0)
    return hsl
        .withLightness((hsl.lightness - amount).clamp(0.0, 1.0))
        .toColor();
  return hsl.withLightness((hsl.lightness + amount).clamp(0.0, 1.0)).toColor();
}

Color colorShadow(Color base, double intensity) {
  final t = intensity ?? 0;
  String e = base.value.toRadixString(16).substring(2);
  if (e.length < 6) e = e[0] + e[0] + e[1] + e[1] + e[2] + e[2];
  String o = '';
  for (int n = 0; n < 3; n++) {
    var a = int.parse(e.substring(2 * n, 2 * n + 2), radix: 16);
    a = min(max(0, (a + a * t).round()), 255);
    o += ('00' + a.toRadixString(16)).substring(a.toRadixString(16).length);
  }

  return Color(int.parse(o, radix: 16)).withAlpha(255);
}
