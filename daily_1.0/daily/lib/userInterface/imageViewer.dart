import 'package:flutter/material.dart';
import 'package:daily/servicesLocal/responsive.dart';
import 'package:daily/themesLocal/colors.dart';
import 'package:daily/userInterface/imageViewerComponents.dart';

class imageViewerScreen extends StatefulWidget {
  final String filePath;
  final double aspectRatio;
  imageViewerScreen({this.filePath, this.aspectRatio});

  @override
  _imageViewerScreenState createState() => _imageViewerScreenState();
}

class _imageViewerScreenState extends State<imageViewerScreen> {
  imageViewerScreenDesktop() {
    return imageViewerImage(context, widget.filePath, widget.aspectRatio);
  }

  imageViewerScreenTablet() {
    return imageViewerImage(context, widget.filePath, widget.aspectRatio);
  }

  imageViewerScreenMobile() {
    return imageViewerImage(context, widget.filePath, widget.aspectRatio);
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
