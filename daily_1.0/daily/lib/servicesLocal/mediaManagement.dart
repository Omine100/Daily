import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share/share.dart';
import 'package:picker/picker.dart';
import 'dart:io';
import 'package:daily/servicesBroad/firebaseCRUD.dart';
import 'package:daily/standards/userIStandards.dart';

class MediaManagement {
  Picker picker = new Picker();
  FirebaseCRUD firebaseCRUD = new FirebaseCRUD();

  Future<File> imagePicker(
      BuildContext context, bool isCamera, State state) async {
    try {
      return await Picker.pickImage(
          source: isCamera ? ImageSource.camera : ImageSource.gallery,
          imageQuality: 100);
    } catch (e) {
      UserIStandards().showToastMessage(context, "errorImage");
    }
    return null;
  }

  Future<File> getImage(String imageURL) async {
    File imageFile;
    if (Platform.isAndroid) {
      var response = await get(Uri.parse(imageURL));
      final documentDirectory = (await getExternalStorageDirectory()).path;
      imageFile = new File('$documentDirectory/flutter.png');
      imageFile.writeAsBytesSync(response.bodyBytes);
    }
    return imageFile;
  }

  Future<void> shareImage(BuildContext context, String imageURL) async {
    File imageFile;
    try {
      imageFile = await getImage(imageURL);
      Share.shareFile(imageFile,
          subject: "Thought you might like!", text: "What do you think?");
    } catch (e) {
      UserIStandards().showToastMessage(context, "errorShare");
    }
  }
}
