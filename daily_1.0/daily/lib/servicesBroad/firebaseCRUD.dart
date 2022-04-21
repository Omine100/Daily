import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:intl/intl.dart';
import 'dart:async';
import 'dart:io';
import 'package:daily/standards/userIStandards.dart';

class FirebaseCRUD {
  FirebaseAuth _auth = FirebaseAuth.instance;
  FirebaseFirestore _firestore = FirebaseFirestore.instance;
  FirebaseStorage _storage = FirebaseStorage.instance;

  Future<void> createImageData(
      BuildContext context, String fileName, File imageFile) async {
    var userId = _auth.currentUser.uid;
    try {
      await _storage
          .ref(fileName)
          .putFile(imageFile, SettableMetadata(contentType: 'image/jpeg'));
      _storage.ref(fileName).getDownloadURL().then((_imageURL) => {
            _firestore
                .collection(userId)
                .doc("images")
                .collection("complete")
                .doc(fileName)
                .set({"imageURL": _imageURL})
          });
    } on FirebaseException {
      showToastMessage(context, "_errorImageFailedToUpload", true);
    }
  }

  Future<List<DocumentSnapshot>> getImageDocuments() async {
    var userId = _auth.currentUser.uid;
    final QuerySnapshot querySnapshot = await _firestore
        .collection(userId)
        .doc("images")
        .collection("complete")
        .get();
    final List<DocumentSnapshot> documentSnapshots = querySnapshot.docs;
    List<DocumentSnapshot> documentSnapshotsReversed = [];
    for (int i = documentSnapshots.length - 1; i >= 0; i--) {
      documentSnapshotsReversed.add(documentSnapshots.elementAt(i));
    }
    return documentSnapshotsReversed;
  }

  Future<void> updateImageData(
      BuildContext context, String imageURL, File imageFile) async {
    try {
      await _storage.refFromURL(imageURL).putFile(imageFile);
    } on FirebaseException {
      showToastMessage(context, "_errorImageFailedToUpload", true);
    }
  }

  Future<void> deleteImageData(DocumentSnapshot doc, String imageURL) async {
    Reference reference = FirebaseStorage.instance.refFromURL(imageURL);
    reference.delete();

    var userID = _auth.currentUser.uid;
    await _firestore
        .collection(userID)
        .doc("images")
        .collection("complete")
        .doc(doc.id)
        .delete();
  }
}
