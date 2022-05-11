import 'package:flutter/material.dart';

class Post {
  String username;
  String downloadURL;
  String description;
  DateTime timePosted;

  Post(
      {@required this.username,
      @required this.downloadURL,
      @required this.description,
      @required this.timePosted});
}
