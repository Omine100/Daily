import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/provider.dart';

class FirebaseGlobalAccount {
  FirebaseAuth _auth = FirebaseAuth.instance;
  FirebaseFirestore _firestore = FirebaseFirestore.instance;
  User _user;

  String getUserId(String displayName) {
    
  } 

  bool getUserProfilePic() {
    _auth.currentUser.
    return _user.
  }


}
