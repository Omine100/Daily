import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import 'package:daily/datastructures/comment.dart';

class Post {
  String postId;
  String uid;
  String imageUrl;
  String description;
  String prompt;
  dynamic timePosted;
  List<dynamic> likes;
  List<dynamic> comments;

  Post(
      {@required this.postId,
      @required this.uid,
      @required this.imageUrl,
      @required this.description,
      @required this.prompt,
      @required this.timePosted,
      @required this.likes,
      @required this.comments});

  Map<String, dynamic> toMap() {
    return {
      "postId": postId,
      "uid": uid,
      "imageUrl": imageUrl,
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
        imageUrl: map["imageUrl"],
        description: map["description"],
        prompt: map["prompt"],
        timePosted: (map["timePosted"]),
        likes: map["likes"],
        comments: map["comments"]);
  }
}
