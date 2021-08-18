import 'package:flutter/material.dart';

class UserXStandards {
  //MECHANICS
  Widget showProgress(BuildContext context) {
    return CircularProgressIndicator(
        backgroundColor: themes.getColor(
            context, "interfaceStandardsProgressIndicatorColor"),
      );
  }
}