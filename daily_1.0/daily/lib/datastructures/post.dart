import 'package:flutter/material.dart';

class Post {
  String username;
  String downloadURL;
  String description;
  String prompt;
  DateTime timePosted;

  Post(
      {@required this.username,
      @required this.downloadURL,
      @required this.description,
      @required this.prompt,
      @required this.timePosted});

  Map<String, dynamic> toMap() {
    return {
      "username": username,
      "downloadURL": downloadURL,
      "description": description,
      "prompt": prompt,
      "timePosted": timePosted
    };
  }

  static Post fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return Post(
        username: map["username"],
        downloadURL: map["downloadURL"],
        description: map["description"],
        prompt: map["prompt"],
        timePosted: map['timePosted']);
  }
}
