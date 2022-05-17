import 'package:flutter/material.dart';
import 'package:daily/servicesLocal/adaptive.dart';
import 'package:daily/servicesLocal/responsive.dart';
import 'package:daily/themesLocal/colors.dart';
import 'package:daily/userInterface/textViewer/textViewerWebComponents.dart';
import 'package:daily/userInterface/textViewer/textViewerMobileComponents.dart';

class TextViewerScreen extends StatefulWidget {
  final String filePath;
  TextViewerScreen({required this.filePath});

  @override
  _TextViewerScreenState createState() => _TextViewerScreenState();
}

class _TextViewerScreenState extends State<TextViewerScreen> {
  _textViewerScreenSmall() {
    return Adaptive(
        iOS: _textViewerScreenMobileSmall(false),
        android: _textViewerScreenMobileSmall(true),
        web: _textViewerScreenWebSmall());
  }

  _textViewerScreenLarge() {
    return Adaptive(
        iOS: _textViewerScreenMobileLarge(false),
        android: _textViewerScreenMobileLarge(true),
        web: _textViewerScreenWebLarge());
  }

  _textViewerScreenWebSmall() {
    return textViewerWebText(context, widget.filePath);
  }

  _textViewerScreenWebLarge() {
    return textViewerWebText(context, widget.filePath);
  }

  _textViewerScreenMobileSmall(bool isAndroid) {
    return textViewerMobileText(context, widget.filePath);
  }

  _textViewerScreenMobileLarge(bool isAndroid) {
    return textViewerMobileText(context, widget.filePath);
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
                small: _textViewerScreenSmall(),
                large: _textViewerScreenLarge(),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
