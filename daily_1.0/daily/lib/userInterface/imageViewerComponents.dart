import 'package:flutter/material.dart';
import 'dart:math' as math;
import 'dart:io';

Widget imageViewerImage(BuildContext context, String filePath, double scale) {
  return Transform.scale(
    scale: scale,
    child: Center(
      child: Image.file(
        File(filePath),
        fit: BoxFit.fill,
      ),
    ),
  );
}
