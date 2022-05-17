import 'package:flutter/material.dart';

class Post {
  String postID;
  String username;
  String downloadURL;
  String description;
  DateTime timePosted;

  Post(
      {required this.postID,
      required this.username,
      required this.downloadURL,
      required this.description,
      required this.timePosted});
}

//What if for postID we dont do this cause there would only be one post per person per day
class PostID {
  String username;
  String downloadURL;
  DateTime timePosted;

  PostID(
      {required this.username,
      required this.downloadURL,
      required this.timePosted});

  String _PostIDGeneration() {
    return "";
  }
}
