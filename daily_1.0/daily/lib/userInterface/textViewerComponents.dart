import 'package:flutter/material.dart';
import 'package:daily/themesLocal/colors.dart';
import 'package:daily/themesLocal/fontProperties.dart';

Widget textViewerText(BuildContext context, String filePath) {
  return SafeArea(
    child: FutureBuilder(
        future: DefaultAssetBundle.of(context).loadString(filePath),
        builder: (context, snapshot) {
          return Text(
            snapshot.data ?? '',
            softWrap: true,
            style: TextStyle(
              color: Theme.of(context).colorScheme.textViewerText,
              fontSize: Theme.of(context).textTheme.textViewerText,
              fontWeight: Theme.of(context).typography.textViewerText,
            ),
          );
        }),
  );
}
