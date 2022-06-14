import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';
import 'package:daily/datastructures/post.dart';
import 'package:daily/datastructures/comment.dart';
import 'package:daily/standards/userIStandards.dart';

class FirebasePost {
  FirebaseAuth _auth = FirebaseAuth.instance;
  FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<bool> getHasUserPosted(BuildContext context, String uid) async {
    try {
      var doc = await _firestore
          .collection("Post")
          .doc()
          .collection("Posts")
          .doc(DateFormat("yyyy-MM-dd").format(DateTime.now()))
          .get();
      return doc.exists;
    } on FirebaseException {
      showToastMessage(context, "_errorImageFailedToUpload", true);
    }
    return false;
  }

  String postIdGenerator() {
    return Uuid().v1();
  }

  void createUserPost(BuildContext context, Post post) async {
    try {
      await _firestore.collection("Posts").doc(post.postId).set(post.toMap());
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
          .collection("Posts")
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

  Future<QuerySnapshot> readUserPosts(BuildContext context, String uid) async {}

  Stream<QuerySnapshot> readPosts(BuildContext context) {
    var querySnapshots = _firestore.collection("Posts").snapshots();
    return querySnapshots;
  }

  void updateUserPost(
      BuildContext context, Post originalPost, Post newPost) async {
    deleteUserPost(context, originalPost);
    createUserPost(context, newPost);
  }

  void deleteUserPost(BuildContext context, Post post) async {
    _firestore
        .collection("Users")
        .doc(_auth.currentUser.uid)
        .collection("Posts")
        .doc(post.postId)
        .delete();
  }

  Future<bool> isLiked(String postId, String uid) async {
    DocumentSnapshot snap =
        await _firestore.collection("Posts").doc(postId).get();
    return (((snap.data() as dynamic))['likes'] as List).contains(uid);
  }

  void likePost(String postId, String uid) async {
    if (await isLiked(postId, uid)) {
      await _firestore.collection("Posts").doc(postId).update({
        'likes': FieldValue.arrayUnion([uid])
      });
    } else {
      _firestore.collection("Posts").doc(postId).update({
        'likes': FieldValue.arrayRemove([uid])
      });
    }
  }

  void createComment(String postId, Comment comment) {
    _firestore
        .collection("Posts")
        .doc(postId)
        .collection("Comments")
        .doc(comment.commentId)
        .set(comment.toMap());
  }

  List<Comment> readComments(
    String postId,
  ) {
    _firestore.collection("Posts").doc(postId).collection("Comments").get();
  }

  void updateComment(String postId, String commentId, Comment comment) {
    _firestore
        .collection("Posts")
        .doc(postId)
        .collection("Comments")
        .doc(commentId)
        .update(comment.toMap());
  }

  void deleteComment(String postId, String commentId) {
    _firestore
        .collection("Posts")
        .doc(postId)
        .collection("Comments")
        .doc(commentId)
        .delete();
  }
}
