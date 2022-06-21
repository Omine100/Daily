import 'package:daily/servicesLocal/adaptive.dart';
import 'package:flutter/material.dart';

Widget textViewerMobileText(BuildContext context, String filePath) {
  return SafeArea(
    child: Padding(
      padding: const EdgeInsets.only(top: 30.0, left: 15, right: 15),
      child: FutureBuilder(
          future: DefaultAssetBundle.of(context).loadString(filePath),
          builder: (context, snapshot) {
            return AdaptiveText(
              snapshot.data ?? '',
              style: TextStyle(
                color: Theme.of(context).colorScheme.textViewerMobileText,
                fontSize: Theme.of(context).textTheme.textViewerMobileText,
                fontWeight: Theme.of(context).typography.textViewerMobileText,
              ),
            );
          }),
    ),
  );
}
