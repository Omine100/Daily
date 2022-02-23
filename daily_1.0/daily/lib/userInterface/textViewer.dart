import 'package:flutter/material.dart';
import 'package:daily/servicesLocal/responsive.dart';
import 'package:daily/themesLocal/colors.dart';
import 'package:daily/userInterface/textViewerComponents.dart';

class TextViewerScreen extends StatefulWidget {
  final String filePath;
  TextViewerScreen({this.filePath});

  @override
  _TextViewerScreenState createState() => _TextViewerScreenState();
}

class _TextViewerScreenState extends State<TextViewerScreen> {
  textViewerScreenWeb() {
    return textViewerText(context, widget.filePath);
  }

  textViewerScreenTablet() {
    return textViewerText(context, widget.filePath);
  }

  textViewerScreenMobile() {
    return textViewerText(context, widget.filePath);
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
        backgroundColor: Theme.of(context).colorScheme.textViewerBackground,
        body: SingleChildScrollView(
          child: Expanded(
            child: Responsive(
              web: textViewerScreenWeb(),
              tablet: textViewerScreenTablet(),
              mobile: textViewerScreenMobile(),
            ),
          ),
        ),
      ),
    );
  }
}
