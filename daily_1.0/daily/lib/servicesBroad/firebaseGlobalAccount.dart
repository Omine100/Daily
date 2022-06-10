import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/provider.dart';

class FirebaseGlobalAccount {
  FirebaseAuth _auth = FirebaseAuth.instance;
  FirebaseFirestore _firestore = FirebaseFirestore.instance;
  User _user;

  String getUserDisplayName(String uid) {}

  bool getUserProfilePic(String uid) {
    return false;
  }

  Future<bool> isFollowing(String currentUid, String uid) async {
    DocumentSnapshot snap =
        await _firestore.collection("Users").doc(currentUid).get();
    return ((snap.data() as dynamic)['following'] as List).contains(uid);
  }

  void followUser(String currentUid, String uid) async {
    if (await isFollowing(currentUid, uid)) {
      await _firestore.collection("Users").doc(currentUid).update({
        'following': FieldValue.arrayRemove([uid])
      });
    } else {
      await _firestore.collection("Users").doc(currentUid).update({
        'following': FieldValue.arrayUnion([uid])
      });
    }
  }
}
