import 'package:daily/datastructures/post.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:typed_data';
import 'dart:async';
import 'dart:io';

class FirebasePose {
  FirebaseAuth _auth = FirebaseAuth.instance;
  FirebaseStorage _storage = FirebaseStorage.instance;
  FirebaseFirestore _firestore = FirebaseFirestore.instance;

  bool getHasUserPosted() {
    if (_auth.currentUser?.uid == null) return false;
    return true;
  }

  void setUserPost(Post post) {}

  Post getUserPost() {}

  Post getPost(String uid) {}
}
