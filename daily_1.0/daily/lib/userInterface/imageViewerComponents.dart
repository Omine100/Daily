import 'package:flutter/material.dart';
import 'dart:math' as math;
import 'dart:io';

Widget imageViewerImage(
    BuildContext context, String filePath, double scale, bool isMirrored) {
  return Center(
    child: Transform(
      transform: Matrix4.rotationY(isMirrored ? -2 * math.pi / 2 : 0),
      alignment: Alignment.center,
      child: Transform.scale(
        scale: scale,
        child: Image.file(
          File(filePath),
          fit: BoxFit.fill,
        ),
      ),
    ),
  );
}
