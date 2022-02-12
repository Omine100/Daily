import 'package:flutter/material.dart';
import 'package:daily/servicesLocal/responsive.dart';
import 'package:daily/themesLocal/colors.dart';
import 'package:daily/userInterface/imageViewerComponents.dart';

class ImageViewerScreen extends StatefulWidget {
  final String filePath;
  final double scale;
  ImageViewerScreen({this.filePath, this.scale});

  @override
  _ImageViewerScreenState createState() => _ImageViewerScreenState();
}

class _ImageViewerScreenState extends State<ImageViewerScreen> {
  imageViewerScreenDesktop() {
    return imageViewerImage(context, widget.filePath, widget.scale);
  }

  imageViewerScreenTablet() {
    return imageViewerImage(context, widget.filePath, widget.scale);
  }

  imageViewerScreenMobile() {
    return imageViewerImage(context, widget.filePath, widget.scale);
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
