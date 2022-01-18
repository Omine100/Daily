import 'package:flutter/material.dart';

Widget textViewerBody(BuildContext context, String filePath) {
  return FutureBuilder(
      future: DefaultAssetBundle.of(context).loadString(filePath),
      builder: (context, snapshot) {
        return new Text(snapshot.data ?? '', softWrap: true);
      });
}
