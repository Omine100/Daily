import 'package:flutter/material.dart';
import 'package:daily/themesLocal/colors.dart';
import 'package:daily/themesLocal/fontProperties.dart';

Widget textViewerBody(BuildContext context, String filePath) {
  return FutureBuilder(
      future: DefaultAssetBundle.of(context).loadString(filePath),
      builder: (context, snapshot) {
        return Text(
          snapshot.data ?? '',
          softWrap: true,
          style: TextStyle(
            color: Theme.of(context).colorScheme.textViewerBody,
            fontSize: Theme.of(context).textTheme.textViewerBody,
            fontWeight: Theme.of(context).typography.textViewerBody,
          ),
        );
      });
}
