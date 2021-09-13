import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'dart:async';
import 'package:daily/standards/userIStandards.dart';

class FirebaseAccounts {
  //VARIABLE INITIALIZATION
  FirebaseAuth auth = FirebaseAuth.instance;
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  //MECHANICS
  Future<String> getCurrentUserId() async {
    return auth.currentUser.uid;
  }

  Future<bool> getSignedInStatus() async {
    if (auth.currentUser?.uid == null) return false;
    return true;
  }

  Future<void> setCurrentUserDisplayName(String displayName) async {
    auth.currentUser.updateDisplayName(displayName);
  }

  Future<String> getCurrentUserDisplayName() async {
    return auth.currentUser.displayName;
  }

  Future<void> sendEmailVerification() async {
    auth.currentUser.sendEmailVerification();
  }

  Future<bool> getEmailVerified() async {
    return auth.currentUser.emailVerified;
  }

  Future<void> sendPasswordReset(String email) async {
    auth.sendPasswordResetEmail(email: email);
  }

  Future<void> signUpEmailAndPassword(
      BuildContext context, String email, String password, String name) async {
    try {
      await auth.createUserWithEmailAndPassword(
          email: email, password: password);
      await setCurrentUserDisplayName(name);
      sendEmailVerification();
    } on FirebaseAuthException catch (e) {
      String key;
      switch (e.code) {
        case "invalid-password":
          key = "errorInvalidPassword";
          break;
        case "invalid-email":
          key = "errorInvalidEmail";
          break;
        case "email-already-exists":
          key = "errorEmailAlreadyExists";
          break;
        case "invalid-credential":
          key = "errorInvalidEmail";
          break;
        default:
          key = "errorDefault";
      }
      UserIStandards().showToastMessage(context, key);
    }
  }

  Future<void> signInEmailAndPassword(
      BuildContext context, String email, String password) async {
    try {
      await auth.signInWithEmailAndPassword(
          email: email, password: password);
    } on FirebaseAuthException catch (e) {
      String key;
      switch (e.code) {
        case "invalid-email":
          key = "errorInvalidEmail";
          break;
        case "wrong-password":
          key = "errorWrongPassword";
          break;
        case "user-not-found":
          key = "errorUserNotFound";
          break;
        case "user-disabled":
          key = "errorUserDisabled";
          break;
        default:
          key = "errorDefault";
      }
      UserIStandards().showToastMessage(context, key);
    }
  }

  Future<bool> signInGoogle() async {
    final GoogleSignInAccount googleUser = await GoogleSignIn().signIn();
    final GoogleSignInAuthentication result = await googleUser.authentication;
    final GoogleAuthCredential googleCredential = GoogleAuthProvider.credential(
        accessToken: result.accessToken, idToken: result.idToken);
    final UserCredential userCredential =
        await auth.signInWithCredential(googleCredential);
    if (userCredential.additionalUserInfo.isNewUser)
      await setCurrentUserDisplayName(googleUser.displayName);
    return userCredential.additionalUserInfo.isNewUser;
  }

  Future<void> signOut() async {
    return auth.signOut();
  }

  Future<void> deleteUserData() async {
    var userId = auth.currentUser.uid;
    await firestore.collection(userId).get().then((snapshot) {
      for (DocumentSnapshot ds in snapshot.docs) {
        ds.reference.delete();
      }
    });
  }

  Future<void> deleteUser() async {
    deleteUserData();
    auth.currentUser.delete();
  }
}
