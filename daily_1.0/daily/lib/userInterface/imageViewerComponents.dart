import 'package:flutter/material.dart';
import 'dart:math' as math;
import 'dart:io';

Widget imageViewerImage(
    BuildContext context, String filePath, double aspectRatio) {
  return AspectRatio(
    aspectRatio:
        MediaQuery.of(context).size.width / MediaQuery.of(context).size.height,
    child: Transform(
      transform: Matrix4.rotationY(-2 * math.pi / 2),
      alignment: Alignment.center,
      child: Image.file(
        File(filePath),
        fit: BoxFit.fill,
      ),
    ),
  );
}
