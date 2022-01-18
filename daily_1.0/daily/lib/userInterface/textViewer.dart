import 'package:flutter/material.dart';
import 'package:daily/servicesLocal/responsive.dart';
import 'package:daily/themesLocal/colors.dart';
import 'package:daily/userInterface/textViewerComponents.dart';

class textViewerScreen extends StatefulWidget {
  final String filePath;
  textViewerScreen({this.filePath});

  @override
  _textViewerScreenState createState() => _textViewerScreenState();
}

class _textViewerScreenState extends State<textViewerScreen> {
  textViewerScreenDesktop() {
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
              desktop: textViewerScreenDesktop(),
              tablet: textViewerScreenTablet(),
              mobile: textViewerScreenMobile(),
            ),
          ),
        ),
      ),
    );
  }
}
