import 'package:flutter/material.dart';
import 'package:path/path.dart' as path;
import 'package:http/http.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share/share.dart';
import 'package:picker/picker.dart';
import 'dart:io';
import 'package:daily/servicesBroad/firebaseCRUD.dart';

class MediaManagement {
  //CLASS INITIALIZATION
  Picker picker = new Picker();
  FirebaseCRUD firebaseCRUD = new FirebaseCRUD();

  //MECHANICS
  Future<File> imagePicker(
      BuildContext context, bool isCamera, State state) async {
    try {
      final pickedFile = await Picker.pickImage(
          source: isCamera ? ImageSource.camera : ImageSource.gallery,
          imageQuality: 100);
      final String fileName = path.basename(pickedFile.path);
      return File(pickedFile.path);
    } catch (e) {
      print(e);
      //Show dialog for failed to load camera
    }
  }

  Future<File> getImage(String imageURL) async {
    File imageFile;
    if (Platform.isAndroid) {
      var response = await get(Uri.parse(imageURL));
      final documentDirectory = (await getExternalStorageDirectory()).path;
      imageFile = new File('$documentDirectory/flutter.png');
      imageFile.writeAsBytesSync(response.bodyBytes);
    }

    return imageFile ?? imageFile;
  }

  Future<Null> shareImage(String imageURL) async {
    File imageFile;
    try {
      imageFile = await getImage(imageURL);
      Share.shareFile(imageFile,
          subject: "Thought you might like!", text: "What do you think?");
    } catch (e) {
      print(e);
      //Show dialog for failed to save and share image
    }
  }
}
