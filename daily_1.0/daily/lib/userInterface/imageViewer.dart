import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:image/image.dart' as img;
import 'package:daily/servicesLocal/responsive.dart';
import 'package:daily/userInterface/imageViewerComponents.dart';

class ImageViewerScreen extends StatefulWidget {
  final Image image;
  ImageViewerScreen({this.image});

  @override
  _ImageViewerScreenState createState() => _ImageViewerScreenState();
}

class _ImageViewerScreenState extends State<ImageViewerScreen> {
  imageViewerScreenDesktop() {
    return imageViewerImage(context, widget.image);
  }

  imageViewerScreenTablet() {
    return imageViewerImage(context, widget.image);
  }

  imageViewerScreenMobile() {
    return imageViewerImage(context, widget.image);
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
