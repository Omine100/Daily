import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';
import 'package:daily/standards/userIStandards.dart';

class MediaPickerManagement {
  void imagePicker(BuildContext context, bool isCamera, State state,
      Function function) async {
    try {
      // Picker.pickImage(
      //         source: isCamera ? ImageSource.camera : ImageSource.gallery,
      //         imageQuality: 100)
      //     .then((image) {
      //   function(image, state);
      // });
    } catch (e) {
      showToastMessage(context, "_errorImage", true);
    }
    return null;
  }

  getImage(String imageURL) async {
    File imageFile;
    if (Platform.isAndroid) {
      var response = await get(Uri.parse(imageURL));
      final documentDirectory = (await getExternalStorageDirectory())?.path;
      imageFile = new File('$documentDirectory/flutter.png');
      imageFile.writeAsBytesSync(response.bodyBytes);
      return imageFile;
    }
  }
}
