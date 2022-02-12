import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:image/image.dart' as img;
import 'dart:io';

Widget imageViewerImage(BuildContext context, Image image) {
  return Center(
    child: Align(alignment: Alignment.center, child: image),
  );
}
