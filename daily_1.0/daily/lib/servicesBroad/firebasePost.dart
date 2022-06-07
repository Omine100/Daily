import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';
import 'package:daily/datastructures/post.dart';
import 'package:daily/standards/userIStandards.dart';

class FirebasePost {
  FirebaseAuth _auth = FirebaseAuth.instance;
  FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<bool> getHasUserPosted(BuildContext context) async {
    try {
      var doc = await _firestore
          .collection("Users")
          .doc(_auth.currentUser.uid)
          .collection("Posts")
          .doc(DateFormat("yyyy-MM-dd").format(DateTime.now()))
          .get();
      return doc.exists;
    } on FirebaseException {
      showToastMessage(context, "_errorImageFailedToUpload", true);
    }
    return false;
  }

  //Need to see about with large files
  //May need to change to firebaseStorage
  void createUserPost(BuildContext context, Post post) async {
    try {
      await _firestore
          .collection("Users")
          .doc(_auth.currentUser.uid)
          .collection("Posts")
          .doc(post.postId)
          .set(post.toMap());
    } on FirebaseException {
      showToastMessage(context, "_errorImageFailedToUpload", true);
    }
  }

  Uint8List readImage(BuildContext context, String byteString) {
    return Uint8List.fromList(byteString.codeUnits);
  }

  Future<Post> readPost(BuildContext context, String uid) async {
    Post post;
    try {
      await _firestore
          .collection("Users")
          .doc(uid)
          .collection("Posts")
          .doc(DateFormat("yyyy-MM-dd").format(DateTime.now()))
          .get()
          .then((value) => {post = Post.fromMap(value.data())})
          .then((value) {
        return post;
      });
    } on FirebaseException {
      showToastMessage(context, "_errorImageFailedToUpload", true);
    }
    return null;
  }

  Future<QuerySnapshot> readPosts(BuildContext context, String uid) async {
    QuerySnapshot querySnapshot =
        await _firestore.collection("Users").doc(uid).collection("Posts").get();
    return querySnapshot;
  }

  void updateUserPost(
      BuildContext context, Post originalPost, Post newPost) async {
    deleteUserPost(context, originalPost);
    createUserPost(context, newPost);
  }

  void deleteUserPost(BuildContext context, Post post) async {
    await _firestore
        .collection("Users")
        .doc(_auth.currentUser.uid)
        .collection("Posts")
        .doc(post.postId)
        .delete();
  }
}
