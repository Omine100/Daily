import 'package:daily/servicesLocal/adaptive.dart';
import 'package:flutter/material.dart';
import 'package:daily/themesLocal/colors.dart';
import 'package:daily/themesLocal/fontSizes.dart';
import 'package:daily/themesLocal/fontWeights.dart';

Widget textViewerWebText(BuildContext context, String filePath) {
  return SafeArea(
    child: Padding(
      padding: const EdgeInsets.only(top: 30.0, left: 15, right: 15),
      child: FutureBuilder(
          future: DefaultAssetBundle.of(context).loadString(filePath),
          builder: (context, snapshot) {
            return AdaptiveText(
              snapshot.data.toString(),
              style: TextStyle(
                color: Theme.of(context).colorScheme.textViewerWebText,
                fontSize: Theme.of(context).textTheme.textViewerWebText,
                fontWeight: Theme.of(context).typography.textViewerWebText,
              ),
            );
          }),
    ),
  );
}
