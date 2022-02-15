import 'package:flutter/material.dart';
import 'package:daily/servicesLocal/responsive.dart';
import 'package:daily/userInterface/imageViewerComponents.dart';

class ImageViewerScreen extends StatefulWidget {
  final Widget image;
  ImageViewerScreen({this.image});

  @override
  _ImageViewerScreenState createState() => _ImageViewerScreenState();
}

class _ImageViewerScreenState extends State<ImageViewerScreen> {
  imageViewerScreenDesktop() {
    return Stack(
      alignment: Alignment.center,
      children: [
        imageViewerImage(context, widget.image),
        Positioned(bottom: 50, child: imageViewerProgressButton(context)),
      ],
    );
  }

  imageViewerScreenTablet() {
    return Stack(
      alignment: Alignment.center,
      children: [
        imageViewerImage(context, widget.image),
        Positioned(bottom: 50, child: imageViewerProgressButton(context)),
      ],
    );
  }

  imageViewerScreenMobile() {
    return Stack(
      alignment: Alignment.center,
      children: [
        imageViewerImage(context, widget.image),
        Positioned(bottom: 50, child: imageViewerProgressButton(context)),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
        body: Responsive(
          desktop: imageViewerScreenDesktop(),
          tablet: imageViewerScreenTablet(),
          mobile: imageViewerScreenMobile(),
        ),
      ),
    );
  }
}
