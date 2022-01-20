import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:async';
import 'dart:io';
import 'package:daily/servicesLocal/settingsDeclaration.dart';
import 'package:daily/servicesLocal/settingsManagement.dart';
import 'package:daily/standards/userIStandards.dart';
import 'package:daily/utilities/managementUtil/validation.dart';

class FirebaseAccounts {
  FirebaseAuth auth = FirebaseAuth.instance;
  FirebaseStorage storage = FirebaseStorage.instance;
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  bool getSignedInStatus() {
    if (auth.currentUser?.uid == null) return false;
    return true;
  }

  String getCurrentUserId() {
    return auth.currentUser.uid;
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

  Future<void> setCurrentUserProfilePicImage(File image, State state) async {
    var storageRef = storage.ref(auth.currentUser.uid + '/profilePicture');
    await storageRef.putFile(image);
    setCurrentUserProfilePicURL(await storageRef.getDownloadURL(), state);
  }

  Future<void> setCurrentUserProfilePicURL(String photoURL, State state) async {
    auth.currentUser.updatePhotoURL(photoURL);
    profileURL.value = photoURL;
    settingsToPrefs(settingsList);
    state.setState(() {});
  }

  String getCurrentUserProfilePic() {
    return auth.currentUser.photoURL;
  }

  Future<void> sendEmailVerification() async {
    auth.currentUser.sendEmailVerification();
  }

  Future<bool> getEmailVerified() async {
    return auth.currentUser.emailVerified;
  }

  Future<bool> sendPasswordReset(BuildContext context, String email) async {
    if (email == "" || email == null || !isEmail(email)) {
      showToastMessage(context, "errorInvalidEmail");
      return false;
    }
    auth.sendPasswordResetEmail(email: email);
    showToastMessage(context, "settingsResetPasswordSent");
    return true;
  }

  Future<bool> signUpEmailAndPassword(BuildContext context, String email,
      String password, String passwordVerify, String name) async {
    if (email == null ||
        email == "" ||
        password == null ||
        password == "" ||
        passwordVerify == null ||
        passwordVerify == "" ||
        name == null ||
        name == "") {
      showToastMessage(context, "errorBlankField");
      return false;
    }
    if (!isName(name)) {
      showToastMessage(context, "errorInvalidName");
      return false;
    }
    if (!isEmail(email)) {
      showToastMessage(context, "errorInvalidEmail");
      return false;
    }
    if (!isPassword(password)) {
      showToastMessage(context, "errorPasswordRequirements");
      return false;
    }
    if (password != passwordVerify) {
      showToastMessage(context, "errorPasswordMatch");
      return false;
    }
    try {
      await auth.createUserWithEmailAndPassword(
          email: email, password: password);
      await setCurrentUserDisplayName(name);
      sendEmailVerification();
      return true;
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
      showToastMessage(context, key);
    }
    return false;
  }

  Future<bool> signInEmailAndPassword(
      BuildContext context, String email, String password) async {
    if (email == "" || password == "") {
      showToastMessage(context, "errorBlankField");
      return false;
    }
    try {
      await auth.signInWithEmailAndPassword(email: email, password: password);
      return true;
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
      showToastMessage(context, key);
      return false;
    }
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
