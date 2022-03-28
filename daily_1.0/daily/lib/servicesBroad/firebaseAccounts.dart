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
    auth.currentUser
        .updatePhotoURL(await storageRef.getDownloadURL())
        .then((value) {
      setCurrentUserProfilePicURL(state);
    });
  }

  void setCurrentUserProfilePicURL(State state) async {
    profileURL.value = auth.currentUser.photoURL;
    settingsToPrefs(settingsList);
    state.setState(() {});
  }

  String getCurrentUserProfilePic() {
    return auth.currentUser.photoURL;
  }

  var acs = ActionCodeSettings(
      url: 'https://www.dailyme.one/#home',
      handleCodeInApp: true,
      androidPackageName: 'com.phoenix.daily',
      androidInstallApp: true,
      androidMinimumVersion: '12');

  Future<bool> sendEmailVerification(BuildContext context, String email) async {
    FirebaseAuth.instance
        .sendSignInLinkToEmail(email: email, actionCodeSettings: acs)
        .catchError((onError) =>
            showToastMessage(context, "_errorSendingVerification", true));
  }

  Future<bool> getEmailVerified() async {
    return auth.currentUser.emailVerified;
  }

  Future<bool> sendPasswordReset(BuildContext context, String email) async {
    if (email == "" || email == null || !isEmail(email)) {
      showToastMessage(context, "_errorInvalidEmail", true);
      return false;
    }
    auth.sendPasswordResetEmail(email: email);
    showToastMessage(context, "settingsResetPasswordSent", false);
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
      showToastMessage(context, "_errorBlankField", true);
      return false;
    }
    if (!isName(name)) {
      showToastMessage(context, "_errorInvalidName", true);
      return false;
    }
    if (!isEmail(email)) {
      showToastMessage(context, "_errorInvalidEmail", true);
      return false;
    }
    if (!isPassword(password)) {
      showToastMessage(context, "_errorPasswordRequirements", true);
      return false;
    }
    if (password != passwordVerify) {
      showToastMessage(context, "_errorPasswordMatch", true);
      return false;
    }
    try {
      await auth.createUserWithEmailAndPassword(
          email: email, password: password);
      await setCurrentUserDisplayName(name);
      sendEmailVerification(context, email);
      return true;
    } on FirebaseAuthException catch (e) {
      String key;
      switch (e.code) {
        case "invalid-password":
          key = "_errorInvalidPassword";
          break;
        case "invalid-email":
          key = "_errorInvalidEmail";
          break;
        case "email-already-in-use":
          key = "_errorEmailAlreadyExists";
          break;
        case "invalid-credential":
          key = "_errorInvalidEmail";
          break;
        default:
          key = "_errorDefault";
      }
      showToastMessage(context, key, true);
    }
    return false;
  }

  Future<bool> signInEmailAndPassword(
      BuildContext context, String email, String password) async {
    if (email == "" || password == "") {
      showToastMessage(context, "_errorBlankField", true);
      return false;
    }
    try {
      await auth.signInWithEmailAndPassword(email: email, password: password);
      return true;
    } on FirebaseAuthException catch (e) {
      String key;
      switch (e.code) {
        case "invalid-email":
          key = "_errorInvalidEmail";
          break;
        case "wrong-password":
          key = "_errorWrongPassword";
          break;
        case "user-not-found":
          key = "_errorUserNotFound";
          break;
        case "user-disabled":
          key = "_errorUserDisabled";
          break;
        case "unknown":
          key = "_errorUserNotFound";
          break;
        default:
          key = "_errorDefault";
      }
      showToastMessage(context, key, true);
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
