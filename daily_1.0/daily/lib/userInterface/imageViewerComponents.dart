import 'package:flutter/material.dart';
import 'dart:io';
import 'package:daily/servicesBroad/firebaseCRUD.dart';

Image image;

Widget imageViewerImage(BuildContext context, Widget image) {
  image = image;
  return Center(
    child: image,
  );
}

Widget imageViewerProgressButton(BuildContext context) {
  DateTime date = DateTime.now();
  return IconButton(
    color: Colors.grey,
    onPressed: () {
      FirebaseCRUD()
          .createImageData(context, date.toIso8601String(), File("capture"));
    },
    icon: Icon(Icons.arrow_forward, color: Colors.white),
    iconSize: 45,
  );
}
