import 'package:flutter/material.dart';
import 'package:daily/servicesLocal/responsive.dart';
import 'package:daily/themesLocal/colors.dart';
import 'package:daily/themesLocal/positions.dart';
import 'package:daily/userInterface/textViewerComponents.dart';

class textViewerScreen extends StatefulWidget {
  final String filePath;
  textViewerScreen({this.filePath});

  @override
  _textViewerScreenState createState() => _textViewerScreenState();
}

class _textViewerScreenState extends State<textViewerScreen> {
  textViewerScreenDesktop() {
    return Stack(
      alignment: Alignment.center,
      children: [
        Positioned(
          top: 50,
          child: textViewerBody(context, widget.filePath),
        ),
      ],
    );
  }

  textViewerScreenTablet() {
    return Stack(
      alignment: Alignment.center,
      children: [
        Positioned(
          top: 50,
          child: textViewerBody(context, widget.filePath),
        ),
      ],
    );
  }

  textViewerScreenMobile() {
    return Stack(
      alignment: Alignment.center,
      children: [
        Positioned(
          top: 50,
          child: textViewerBody(context, widget.filePath),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
        body: Container(
          color: Colors.grey.shade200,
          constraints: BoxConstraints.expand(height: double.maxFinite),
          child: Responsive(
            desktop: textViewerScreenDesktop(),
            tablet: textViewerScreenTablet(),
            mobile: textViewerScreenMobile(),
          ),
        ),
      ),
    );
  }
}
