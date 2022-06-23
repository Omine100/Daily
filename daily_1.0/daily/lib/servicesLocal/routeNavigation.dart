import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:daily/servicesLocal/routeManagement.gr.dart';

class RouteNavigation {
  void routeImageViewer(BuildContext context, Widget image, String imagePath) {
    context.router.push(ImageViewerScreen(image: image, imagePath: imagePath));
  }

  void routeTextViewer(BuildContext context, String filePath) {
    context.router.push(TextViewerScreen(filePath: filePath));
  }
}
