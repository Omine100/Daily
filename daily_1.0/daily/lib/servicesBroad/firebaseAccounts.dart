import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'dart:async';
import 'dart:io';
import 'package:daily/standards/userIStandards.dart';
import 'package:daily/utilities/managementUtil/validation.dart';

class FirebaseAccounts {
  //VARIABLE INITIALIZATION
  FirebaseAuth auth = FirebaseAuth.instance;
  FirebaseStorage storage = FirebaseStorage.instance;
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  //MECHANICS
  String getCurrentUserId() {
    return auth.currentUser.uid;
  }

  bool getSignedInStatus() {
    if (auth.currentUser?.uid == null) return false;
    return true;
  }

  Future<void> setCurrentUserDisplayName(String displayName) async {
    auth.currentUser.updateDisplayName(displayName);
  }

  String getCurrentUserDisplayName() {
    return auth.currentUser.displayName;
  }

  String getCurrentUserEmail() {
    return auth.currentUser.email;
  }

  Future<void> setCurrentUserProfilePicImage(File image) async {
    var storageRef = storage.ref(auth.currentUser.uid + '/profilePicture');
    await storageRef.putFile(image);
    setCurrentUserProfilePicURL(await storageRef.getDownloadURL());
  }

  Future<void> setCurrentUserProfilePicURL(String photoURL) async {
    storage.ref(auth.currentUser.uid + '/profilePicture/$photoURL');
  }

  Future<void> updateProfilePic() async {
    auth.currentUser.updatePhotoURL(await storage
        .ref(auth.currentUser.uid + '/profilePicture')
        .getDownloadURL());
  }

  Future<String> getCurrentUserProfilePic() async {
    return auth.currentUser.photoURL;
  }

  Future<void> sendEmailVerification() async {
    auth.currentUser.sendEmailVerification();
  }

  Future<bool> getEmailVerified() async {
    return auth.currentUser.emailVerified;
  }

  Future<void> sendPasswordReset(BuildContext context, String email) async {
    if (email == "" || email == null || !isEmail(email)) {
      UserIStandards().showToastMessage(context, "errorInvalidEmail");
      return;
    }
    auth.sendPasswordResetEmail(email: email);
  }

  Future<void> signUpEmailAndPassword(
      BuildContext context, String email, String password, String name) async {
    if (email == null ||
        email == "" ||
        password == null ||
        password == "" ||
        name == null ||
        name == "") {
      UserIStandards().showToastMessage(context, "errorBlankField");
      return;
    }
    if (!isName(name)) {
      UserIStandards().showToastMessage(context, "errorInvalidName");
      return;
    }
    if (!isEmail(email)) {
      UserIStandards().showToastMessage(context, "errorInvalidEmail");
      return;
    }
    if (!isPassword(password)) {
      UserIStandards().showToastMessage(context, "errorPasswordRequirements");
      return;
    }
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
        case "email-already-in-use":
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
    if (email == "" || password == "") {
      UserIStandards().showToastMessage(context, "errorBlankField");
      return;
    }
    try {
      await auth.signInWithEmailAndPassword(email: email, password: password);
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
        case "unknown":
          key = "errorUserNotFound";
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
    if (userCredential.additionalUserInfo.isNewUser) {
      await setCurrentUserDisplayName(googleUser.displayName);
      await setCurrentUserProfilePicURL(googleUser.photoUrl);
    }
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
