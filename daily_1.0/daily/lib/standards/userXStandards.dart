import 'package:flutter/material.dart';
import 'package:daily/themesLocal/colors.dart';

Widget showProgress(BuildContext context) {
  return CircularProgressIndicator(
    backgroundColor:
        Theme.of(context).colorScheme.userXStandardsProgressIndicator,
  );
}
