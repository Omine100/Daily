import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

class Comment {
  String commentId;
  String uid;
  String comment;
  List<String> likes;

  Comment(
      {@required this.commentId,
      @required this.uid,
      @required this.comment,
      @required this.likes});

  Map<String, dynamic> toMap() {
    return {
      "commentId": commentId,
      "uid": uid,
      "comment": comment,
      "likes": likes
    };
  }

  static Comment fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return Comment(
        commentId: map["commentId"],
        uid: map["uid"],
        comment: map["comment"],
        likes: map["likes"]);
  }

  String commentIdGenerator() {
    return Uuid().v1();
  }
}
