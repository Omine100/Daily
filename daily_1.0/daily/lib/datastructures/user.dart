import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class User {
  final String uid;
  final String email;
  final String displayName;
  final String profilePicURL;
  final List<String> followers;
  final List<String> following;

  User(
      {@required this.uid,
      @required this.email,
      @required this.displayName,
      @required this.profilePicURL,
      @required this.followers,
      @required this.following});

  Map<String, dynamic> toMap() {
    return {
      "uid": uid,
      "email": email,
      "displayName": displayName,
      "profilePicURL": profilePicURL,
      "followers": followers,
      "following": following
    };
  }

  static User fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return User(
        uid: map["uid"],
        email: map["email"],
        displayName: map["displayName"],
        profilePicURL: map["profilePicURL"],
        followers: map["followers"],
        following: map['following']);
  }
}
