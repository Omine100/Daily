import 'package:flutter/material.dart';
import 'package:daily/userInterface/welcome.dart';
import 'package:daily/userInterface/home.dart';
import 'package:daily/userInterface/textViewer.dart';

class RouteNavigation {
  void routePop(BuildContext context) {
    Navigator.pop(context);
  }

  void routeBase(BuildContext context, Widget page) {
    Navigator.pushAndRemoveUntil(context,
        MaterialPageRoute(builder: (context) => page), (route) => false);
  }

  void routePage(BuildContext context, Widget page) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => page));
  }

  void routeTextViewer(BuildContext context, String filePath) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => TextViewerScreen(filePath: filePath)));
  }

  Widget routeInitial(BuildContext context, bool isSignedIn) {
    return isSignedIn ? HomeScreen() : WelcomeScreen();
  }
}
