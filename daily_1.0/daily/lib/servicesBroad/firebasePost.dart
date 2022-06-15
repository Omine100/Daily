import 'dart:typed_data';
import 'package:firebase_storage/firebase_storage.dart';
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
  FirebaseStorage _storage = FirebaseStorage.instance;

  Future<bool> getHasUserPosted(BuildContext context, String uid) async {
    bool hasPosted = false;
    Stream<QuerySnapshot> stream = await readUserPosts(context, uid);
    stream.forEach((element) {
      for (int i = 0; i < element.docs.length; i++) {
        DateTime postDate =
            (Post.fromMap(element.docs[i].data()).timePosted as Timestamp)
                .toDate();
        if (postDate.year == DateTime.now().year &&
            postDate.month == DateTime.now().month &&
            postDate.day == DateTime.now().day) {
          hasPosted = true;
          break;
        }
      }
    });
    return hasPosted;
  }

  String postIdGenerator() {
    return Uuid().v1();
  }

  void createUserPost(BuildContext context, Post post, Uint8List image) async {
    try {
      await _firestore.collection("Posts").doc(post.postId).set(post.toMap());
      Reference ref = _storage.ref().child("Posts").child(post.postId);
      UploadTask uploadTask = ref.putData(image);
      TaskSnapshot snapshot = await uploadTask;
      await _firestore
          .collection("Posts")
          .doc(post.postId)
          .update({'imageUrl': snapshot.ref.getDownloadURL()});
    } on FirebaseException {
      showToastMessage(context, "_errorImageFailedToUpload", true);
    }
  }

  Future<Post> readPost(BuildContext context, String postId) async {
    Post post;
    try {
      await _firestore
          .collection("Posts")
          .doc(postId)
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

  Stream<QuerySnapshot> readUserPosts(BuildContext context, String uid) {
    return _firestore
        .collection("Posts")
        .where("uid", isEqualTo: uid)
        .snapshots();
  }

  Stream<QuerySnapshot> readPosts(BuildContext context) {
    final Timestamp now = Timestamp.fromDate(DateTime.now());
    final Timestamp yesterday = Timestamp.fromDate(
      DateTime.now().subtract(const Duration(days: 1)),
    );
    return _firestore
        .collection("Posts")
        .where("timePosted", isLessThan: now, isGreaterThan: yesterday)
        .snapshots();
  }

  void updateUserPost(BuildContext context, Post originalPost, Post newPost,
      Uint8List image) async {
    deleteUserPost(context, originalPost);
    createUserPost(context, newPost, image);
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
