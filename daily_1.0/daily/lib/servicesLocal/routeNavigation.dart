import 'package:flutter/material.dart';
import 'package:daily/userInterface/textViewer.dart';
import 'package:daily/userInterface/imageViewer.dart';

class RouteNavigation {
  void routeTextViewer(BuildContext context, String filePath) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => TextViewerScreen(filePath: filePath)));
  }

  void routeImageViewer(BuildContext context, Widget image, String imagePath) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => ImageViewerScreen(
                  image: image,
                  imagePath: imagePath,
                )));
  }
}
