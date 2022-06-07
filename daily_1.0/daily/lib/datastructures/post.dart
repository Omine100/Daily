import 'dart:typed_data';

import 'package:flutter/material.dart';

class Post {
  String postId;
  String username;
  String imageBytes;
  String description;
  String prompt;
  DateTime timePosted;

  Post(
      {@required this.postId,
      @required this.username,
      @required this.imageBytes,
      @required this.description,
      @required this.prompt,
      @required this.timePosted});

  Map<String, dynamic> toMap() {
    return {
      "postId": postId,
      "username": username,
      "imageBytes": imageBytes,
      "description": description,
      "prompt": prompt,
      "timePosted": timePosted
    };
  }

  static Post fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return Post(
        postId: map["postId"],
        username: map["username"],
        imageBytes: map["imageBytes"],
        description: map["description"],
        prompt: map["prompt"],
        timePosted: map['timePosted']);
  }
}
