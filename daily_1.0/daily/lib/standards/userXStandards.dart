import 'package:flutter/material.dart';
import 'package:daily/themesLocal/colors.dart';

Widget showProgress(BuildContext context) {
  return CircularProgressIndicator(
    valueColor: new AlwaysStoppedAnimation<Color>(
        Theme.of(context).colorScheme.userXStandardsProgressIndicator),
    backgroundColor: Colors.greenAccent,
  );
}
