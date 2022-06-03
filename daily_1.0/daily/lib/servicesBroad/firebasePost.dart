import 'package:daily/datastructures/post.dart';
import 'package:daily/standards/userIStandards.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

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
          .doc(post.postId) //Maybe change to current date?
          .set(post.toMap());
    } on FirebaseException {
      showToastMessage(context, "_errorImageFailedToUpload", true);
    }
  }

  Post readPost(BuildContext context, String uid) async {
    try {
      await _firestore.collection(uid).doc("Posts");
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
        .collection(_auth.currentUser.uid)
        .doc("Posts")
        .collection(post.timePosted.toIso8601String())
        .snapshots()
        .first
        .then((value) => {
              _firestore
                  .collection(_auth.currentUser.uid)
                  .doc("Posts")
                  .collection(post.timePosted.toIso8601String())
                  .doc(value.docs.first.id)
                  .delete()
            });
  }
}
