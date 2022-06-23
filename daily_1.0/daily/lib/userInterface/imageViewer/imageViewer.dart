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
  _imageViewerScreenSmall() {
    return Adaptive(
        iOS: _imageViewerScreenMobileSmall(false),
        android: _imageViewerScreenMobileSmall(true),
        web: _imageViewerScreenWebSmall());
  }

  _imageViewerScreenLarge() {
    return Adaptive(
        iOS: _imageViewerScreenMobileLarge(false),
        android: _imageViewerScreenMobileLarge(true),
        web: _imageViewerScreenWebLarge());
  }

  _imageViewerScreenWebSmall() {
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

  _imageViewerScreenWebLarge() {
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

  _imageViewerScreenMobileSmall(bool isAndroid) {
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

  _imageViewerScreenMobileLarge(bool isAndroid) {
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
          small: _imageViewerScreenSmall(),
          large: _imageViewerScreenLarge(),
        ),
      ),
    );
  }
}
