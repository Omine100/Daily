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
      color: Theme.of(context).colorScheme.textViewerBackground,
      child: Scaffold(
        backgroundColor: Theme.of(context).colorScheme.textViewerBackground,
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            height: 3500,
            width: MediaQuery.of(context).size.width,
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
