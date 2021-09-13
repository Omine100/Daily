import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:intl/intl.dart';
import 'dart:async';
import 'dart:io';
import 'package:daily/standards/userIStandards.dart';

class FirebaseCRUD {
  //VARIABLE INITIALIZATION
  FirebaseAuth auth = FirebaseAuth.instance;
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  FirebaseStorage storage = FirebaseStorage.instance;

  //MECHANICS
  Future<void> createImageData(
      BuildContext context, String fileName, File imageFile) async {
    var userId = auth.currentUser.uid;
    String date = DateFormat('yyyy-MM-dd-HH:mm:ss').format(DateTime.now());
    try {
      await storage
          .ref(fileName)
          .putFile(imageFile, SettableMetadata(customMetadata: {'date': date}));
      storage.ref(fileName).getDownloadURL().then((_imageURL) => {
            firestore
                .collection(userId)
                .doc("images")
                .collection("complete")
                .doc(date)
                .set({"imageURL": _imageURL})
          });
    } on FirebaseException {
      UserIStandards().showToastMessage(context, "errorImageFailedToUpload");
    }
  }

  Future<List<DocumentSnapshot>> getImageDocuments() async {
    var userId = auth.currentUser.uid;
    final QuerySnapshot querySnapshot = await firestore
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
      await storage.refFromURL(imageURL).putFile(imageFile);
    } on FirebaseException {
      UserIStandards().showToastMessage(context, "errorImageFailedToUpload");
    }
  }

  Future<void> deleteImageData(DocumentSnapshot doc, String imageURL) async {
    //MECHANICS: Firebase deletion
    Reference reference = FirebaseStorage.instance.refFromURL(imageURL);
    reference.delete();

    //MECHANICS: Firestore deletion
    var userID = auth.currentUser.uid;
    await firestore
        .collection(userID)
        .doc("images")
        .collection("complete")
        .doc(doc.id)
        .delete();
  }
}
