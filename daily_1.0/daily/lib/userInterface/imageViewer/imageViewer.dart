import 'package:flutter/material.dart';
import 'package:daily/servicesLocal/adaptive.dart';
import 'package:daily/servicesLocal/responsive.dart';
import 'package:daily/userInterface/imageViewer/imageViewerWebComponents.dart';
import 'package:daily/userInterface/imageViewer/imageViewerMobileComponents.dart';

class ImageViewerScreen extends StatefulWidget {
  final Widget image;
  final String imagePath;
  ImageViewerScreen({this.image, this.imagePath});

  @override
  _ImageViewerScreenState createState() => _ImageViewerScreenState();
}

class _ImageViewerScreenState extends State<ImageViewerScreen> {
  imageViewerScreenSmall() {
    return Adaptive(
        iOS: imageViewerScreenMobileSmall(false),
        android: imageViewerScreenMobileSmall(true),
        web: imageViewerScreenWebSmall());
  }

  imageViewerScreenLarge() {
    return Adaptive(
        iOS: imageViewerScreenMobileLarge(false),
        android: imageViewerScreenMobileLarge(true),
        web: imageViewerScreenWebLarge());
  }

  imageViewerScreenWebSmall() {
    return Stack(
      alignment: Alignment.center,
      children: [
        imageViewerWebImage(context, widget.image),
        Positioned(
            bottom: 50,
            child: imageViewerWebProgressButton(context, widget.imagePath)),
      ],
    );
  }

  imageViewerScreenWebLarge() {
    return Stack(
      alignment: Alignment.center,
      children: [
        imageViewerWebImage(context, widget.image),
        Positioned(
            bottom: 50,
            child: imageViewerWebProgressButton(context, widget.imagePath)),
      ],
    );
  }

  imageViewerScreenMobileSmall(bool isAndroid) {
    return Stack(
      alignment: Alignment.center,
      children: [
        imageViewerMobileImage(context, widget.image),
        Positioned(
            bottom: 50,
            child: imageViewerMobileProgressButton(context, widget.imagePath)),
      ],
    );
  }

  imageViewerScreenMobileLarge(bool isAndroid) {
    return Stack(
      alignment: Alignment.center,
      children: [
        imageViewerMobileImage(context, widget.image),
        Positioned(
            bottom: 50,
            child: imageViewerMobileProgressButton(context, widget.imagePath)),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
        body: Responsive(
          small: imageViewerScreenSmall(),
          large: imageViewerScreenLarge(),
        ),
      ),
    );
  }
}
