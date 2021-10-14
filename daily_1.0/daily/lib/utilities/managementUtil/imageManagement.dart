import 'package:flutter/material.dart';
import 'package:image/image.dart' as img;
import 'dart:io';

Color averageImageColor(String imagePath) {
  img.Image bitmap =
      img.decodeImage(new File(imagePath).readAsBytesSync());

  int redBucket = 0;
  int greenBucket = 0;
  int blueBucket = 0;
  int pixelCount = 0;

  for (int y = 0; y < bitmap.height; y++) {
    for (int x = 0; x < bitmap.width; x++) {
      int c = bitmap.getPixel(x, y);

      pixelCount++;
      redBucket += img.getRed(c);
      greenBucket += img.getGreen(c);
      blueBucket += img.getBlue(c);
    }
  }

  Color averageColor = Color.fromRGBO(redBucket ~/ pixelCount,
      greenBucket ~/ pixelCount, blueBucket ~/ pixelCount, 1);
}