import 'package:flutter/material.dart';
import 'package:daily/servicesLocal/responsive.dart';
import 'package:daily/themesLocal/colors.dart';
import 'package:daily/userInterface/imageViewerComponents.dart';

class ImageViewerScreen extends StatefulWidget {
  final String filePath;
  final double scale;
  final bool isMirrored;
  ImageViewerScreen({this.filePath, this.scale, this.isMirrored});

  @override
  _ImageViewerScreenState createState() => _ImageViewerScreenState();
}

class _ImageViewerScreenState extends State<ImageViewerScreen> {
  imageViewerScreenDesktop() {
    return imageViewerImage(
        context, widget.filePath, widget.scale, widget.isMirrored);
  }

  imageViewerScreenTablet() {
    return imageViewerImage(
        context, widget.filePath, widget.scale, widget.isMirrored);
  }

  imageViewerScreenMobile() {
    return imageViewerImage(
        context, widget.filePath, widget.scale, widget.isMirrored);
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
