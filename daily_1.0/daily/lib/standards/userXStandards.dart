import 'package:flutter/material.dart';

Widget showProgress(BuildContext context) {
  return CircularProgressIndicator(
    valueColor: new AlwaysStoppedAnimation<Color>(
      Theme.of(context).colorScheme.secondary,
    ),
    backgroundColor: Colors.transparent,
  );
}
