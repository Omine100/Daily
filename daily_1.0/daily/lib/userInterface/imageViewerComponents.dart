import 'package:flutter/material.dart';

Image image;

Widget imageViewerImage(BuildContext context, Widget image) {
  image = image;
  return Center(
    child: image,
  );
}

Widget imageViewerProgressButton(BuildContext context) {
  return IconButton(
    color: Colors.grey,
    onPressed: () {
      //save image
    },
    icon: Icon(Icons.arrow_forward, color: Colors.white),
    iconSize: 45,
  );
}
