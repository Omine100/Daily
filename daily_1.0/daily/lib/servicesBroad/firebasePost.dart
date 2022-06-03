import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';
import 'package:daily/datastructures/post.dart';
import 'package:daily/standards/userIStandards.dart';

class FirebasePose {
  FirebaseAuth _auth = FirebaseAuth.instance;
  FirebaseStorage _storage = FirebaseStorage.instance;
  FirebaseFirestore _firestore = FirebaseFirestore.instance;

  bool getHasUserPosted() {
    if (_auth.currentUser?.uid == null) return false;
    return true;
  }

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

  DocumentSnapshot readPosts(BuildContext context, String uid) async {
    try {
      await _firestore
          .collection("Users")
          .doc(uid)
          .collection("Posts")
          .snapshots();
    } on FirebaseException {
      showToastMessage(context, "_errorImageFailedToUpload", true);
    }
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
