import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import 'package:daily/datastructures/comment.dart';

class Post {
  String postId;
  String uid;
  List<String> likes;
  String imageBytes;
  String description;
  String prompt;
  DateTime timePosted;
  List<Comment> comments;

  Post(
      {@required this.postId,
      @required this.uid,
      @required this.likes,
      @required this.imageBytes,
      @required this.description,
      @required this.prompt,
      @required this.timePosted,
      @required this.comments});

  Map<String, dynamic> toMap() {
    return {
      "postId": postId,
      "uid": uid,
      "likes": likes,
      "imageBytes": imageBytes,
      "description": description,
      "prompt": prompt,
      "timePosted": timePosted,
      "comments": comments
    };
  }

  static Post fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return Post(
        postId: map["postId"],
        uid: map["uid"],
        likes: map["likes"],
        imageBytes: map["imageBytes"],
        description: map["description"],
        prompt: map["prompt"],
        timePosted: map["timePosted"],
        comments: map["comments"]);
  }

  String postIdGenerator() {
    return Uuid().v1();
  }
}
