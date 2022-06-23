import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';
import 'package:daily/standards/userIStandards.dart';

class FirebasePrompt {
  FirebaseAuth _auth = FirebaseAuth.instance;
  FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<String> getPrompt(BuildContext context, DateTime date) async {
    try {
      var doc = await _firestore
          .collection("Prompts")
          .doc(DateFormat("yyyy-MM-dd").format(date))
          .get();
      return doc.data().entries.first.value;
    } on FirebaseException {
      showToastMessage(context, "_errorImageFailedToUpload", true);
    }
    return "";
  }
}
