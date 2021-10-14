import 'package:flutter/material.dart';
import 'package:image/image.dart' as img;
import 'dart:io';

Color averageImageColor(String imagePath) {
  img.Image bitmap =
      img.decodeImage(new File(imagePath).readAsBytesSync());

  //[pixelCount, red, green, blue]
  var pixelData = [0, 0, 0, 0];

  for (int y = 0; y < bitmap.height; y++) {
    for (int x = 0; x < bitmap.width; x++) {
      int c = bitmap.getPixel(x, y);

      pixelData[0]++;
      pixelData[1] += img.getRed(c);
      pixelData[2] += img.getGreen(c);
      pixelData[3] += img.getBlue(c);
    }
  }

  return Color.fromRGBO(pixelData[1] ~/ pixelData[0],
      pixelData[2] ~/ pixelData[0], pixelData[3] ~/ pixelData[0], 1);
}