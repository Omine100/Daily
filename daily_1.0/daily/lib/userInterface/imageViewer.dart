import 'package:flutter/material.dart';
import 'package:daily/servicesLocal/responsive.dart';
import 'package:daily/userInterface/imageViewerComponents.dart';

class ImageViewerScreen extends StatefulWidget {
  final Widget image;
  final String imagePath;
  ImageViewerScreen({this.image, this.imagePath});

  @override
  _ImageViewerScreenState createState() => _ImageViewerScreenState();
}

class _ImageViewerScreenState extends State<ImageViewerScreen> {
  imageViewerScreenWeb() {
    return Stack(
      alignment: Alignment.center,
      children: [
        imageViewerImage(context, widget.image),
        Positioned(
            bottom: 50,
            child: imageViewerProgressButton(context, widget.imagePath)),
      ],
    );
  }

  imageViewerScreenTablet() {
    return Stack(
      alignment: Alignment.center,
      children: [
        imageViewerImage(context, widget.image),
        Positioned(
            bottom: 50,
            child: imageViewerProgressButton(context, widget.imagePath)),
      ],
    );
  }

  imageViewerScreenMobile() {
    return Stack(
      alignment: Alignment.center,
      children: [
        imageViewerImage(context, widget.image),
        Positioned(
            bottom: 50,
            child: imageViewerProgressButton(context, widget.imagePath)),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
        body: Responsive(
          web: imageViewerScreenWeb(),
          tablet: imageViewerScreenTablet(),
          mobile: imageViewerScreenMobile(),
        ),
      ),
    );
  }
}
