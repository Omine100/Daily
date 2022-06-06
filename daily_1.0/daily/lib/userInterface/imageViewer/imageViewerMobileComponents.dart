import 'package:flutter/material.dart';
import 'dart:io';

Widget imageViewerMobileImage(BuildContext context, Widget image) {
  return Center(
    child: image,
  );
}

Widget imageViewerMobileProgressButton(BuildContext context, String imagePath) {
  DateTime date = DateTime.now();
  return IconButton(
    color: Colors.grey,
    onPressed: () {
      // FirebaseCRUD()
      //     .createImageData(context, date.toIso8601String(), File(imagePath));
    },
    icon: Icon(Icons.arrow_forward, color: Colors.white),
    iconSize: 45,
  );
}
