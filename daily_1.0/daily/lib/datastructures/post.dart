import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import 'package:daily/datastructures/comment.dart';

class Post {
  String postId;
  String uid;
  String imageBytes;
  String description;
  String prompt;
  DateTime timePosted;
  List<String> likes;
  List<Comment> comments;

  Post(
      {@required this.postId,
      @required this.uid,
      @required this.imageBytes,
      @required this.description,
      @required this.prompt,
      @required this.timePosted,
      @required this.likes,
      @required this.comments});

  Map<String, dynamic> toMap() {
    return {
      "postId": postId,
      "uid": uid,
      "imageBytes": imageBytes,
      "description": description,
      "prompt": prompt,
      "timePosted": timePosted,
      "likes": likes,
      "comments": comments
    };
  }

  static Post fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return Post(
        postId: map["postId"],
        uid: map["uid"],
        imageBytes: map["imageBytes"],
        description: map["description"],
        prompt: map["prompt"],
        timePosted: map["timePosted"],
        likes: map["likes"],
        comments: map["comments"]);
  }

  String postIdGenerator() {
    return Uuid().v1();
  }
}
