import 'package:flutter/material.dart';
import 'package:daily/servicesLocal/adaptive.dart';
import 'package:daily/servicesLocal/responsive.dart';
import 'package:daily/themesLocal/colors.dart';
import 'package:daily/userInterface/textViewer/textViewerWebComponents.dart';
import 'package:daily/userInterface/textViewer/textViewerMobileComponents.dart';

class TextViewerScreen extends StatefulWidget {
  final String filePath;
  TextViewerScreen({this.filePath});

  @override
  _TextViewerScreenState createState() => _TextViewerScreenState();
}

class _TextViewerScreenState extends State<TextViewerScreen> {
  textViewerScreenSmall() {
    return Adaptive(
        iOS: textViewerScreenMobileSmall(false),
        android: textViewerScreenMobileSmall(true),
        web: textViewerScreenWebSmall());
  }

  textViewerScreenLarge() {
    return Adaptive(
        iOS: textViewerScreenMobileLarge(false),
        android: textViewerScreenMobileLarge(true),
        web: textViewerScreenWebLarge());
  }

  textViewerScreenWebSmall() {
    return textViewerText(context, widget.filePath);
  }

  textViewerScreenWebLarge() {
    return textViewerText(context, widget.filePath);
  }

  textViewerScreenMobileSmall(bool isAndroid) {
    return textViewerText(context, widget.filePath);
  }

  textViewerScreenMobileLarge(bool isAndroid) {
    return textViewerText(context, widget.filePath);
  }

  @override
  Widget build(BuildContext context) {
    return new WillPopScope(
      onWillPop: () async => true,
      child: Material(
        child: Scaffold(
          backgroundColor: Theme.of(context).colorScheme.textViewerBackground,
          body: SingleChildScrollView(
            child: Expanded(
              child: Responsive(
                small: textViewerScreenSmall(),
                large: textViewerScreenLarge(),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
