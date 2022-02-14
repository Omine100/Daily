import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:image/image.dart' as img;
import 'dart:io';
import 'package:daily/servicesLocal/variableDeclaration.dart';

Future<Widget> imageProcess(BuildContext context, XFile rawFile) async {
  img.Image image = img.decodeImage(File(rawFile.path).readAsBytesSync());
  if (controller.description.lensDirection == CameraLensDirection.front)
    image = img.flipHorizontal(image);

  Image newImage = new Image.memory(
    img.encodeJpg(image),
    fit: BoxFit.fill,
    alignment: Alignment.center,
  );

  return Transform.scale(scale: scale, child: newImage);
}
