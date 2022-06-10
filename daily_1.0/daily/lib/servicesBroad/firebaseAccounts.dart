import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:typed_data';
import 'dart:async';
import 'dart:io';
import 'package:daily/datastructures/user.dart' as dataStructure;
import 'package:daily/servicesLocal/settingsDeclaration.dart';
import 'package:daily/servicesLocal/settingsManagement.dart';
import 'package:daily/standards/userIStandards.dart';
import 'package:daily/utilities/managementUtil/validation.dart';

class FirebaseAccounts {
  FirebaseAuth _auth = FirebaseAuth.instance;
  FirebaseStorage _storage = FirebaseStorage.instance;
  FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<dataStructure.User> getUserInfo(String uid) async {
    DocumentSnapshot snap = await _firestore.collection("Users").doc(uid).get();
    return dataStructure.User.fromMap(snap.data());
  }

  bool getSignedInStatus() {
    if (_auth.currentUser?.uid == null) return false;
    return true;
  }

  String getCurrentUserId() {
    return _auth.currentUser.uid;
  }

  Future<void> setCurrentUserDisplayName(String displayName) async {
    _auth.currentUser.updateDisplayName(displayName);
  }

  String getCurrentUserDisplayName() {
    return _auth.currentUser.displayName;
  }

  String getCurrentUserEmail() {
    return _auth.currentUser.email;
  }

  Future<void> setCurrentUserProfilePicImage(File image, State state) async {
    var storageRef = _storage.ref(_auth.currentUser.uid + '/profilePicture');
    await storageRef.putFile(image);
    _auth.currentUser
        .updatePhotoURL(await storageRef.getDownloadURL())
        .then((value) {
      setCurrentUserProfilePicURL(state);
    });
  }

  Future<void> setCurrentUserProfilePicData(
      Uint8List bytes, State state) async {
    var storageRef = _storage.ref(_auth.currentUser.uid + '/profilePicture');
    await storageRef.putData(bytes);
    _auth.currentUser
        .updatePhotoURL(await storageRef.getDownloadURL())
        .then((value) {
      setCurrentUserProfilePicURL(state);
    });
  }

  void setCurrentUserProfilePicURL(State state) async {
    profileURL.value = _auth.currentUser?.photoURL;
    settingsToPrefs(settingsList);
    state.setState(() {});
  }

  String getCurrentUserProfilePic() {
    return _auth.currentUser.photoURL;
  }

  Future<void> sendEmailVerification(BuildContext context) async {
    _auth.currentUser.sendEmailVerification().catchError((onError) =>
        showToastMessage(context, "_errorVerificationSentFailed", true));
  }

  bool getEmailVerified(BuildContext context) {
    if (!_auth.currentUser.emailVerified) sendEmailVerification(context);
    return _auth.currentUser.emailVerified;
  }

  Future<bool> sendPasswordReset(BuildContext context, String email) async {
    if (email == "" || email == null || !isEmail(email)) {
      showToastMessage(context, "_errorInvalidEmail", true);
      return false;
    }
    _auth.sendPasswordResetEmail(email: email);
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
      UserCredential cred = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      await setCurrentUserDisplayName(name);
      dataStructure.User user = new dataStructure.User(
          uid: cred.user.uid,
          email: email,
          displayName: name,
          profilePicURL: "",
          followers: [],
          following: []);
      await _firestore.collection("Users").doc(cred.user.uid).set(user.toMap());
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
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      return true;
    } on FirebaseException catch (e) {
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
    return _auth.signOut();
  }

  Future<void> deleteUserData() async {
    var userId = _auth.currentUser.uid;
    await _firestore.collection(userId).get().then((snapshot) {
      for (DocumentSnapshot ds in snapshot.docs) {
        ds.reference.delete();
      }
    });
  }

  Future<void> deleteUser() async {
    deleteUserData();
    _auth.currentUser.delete();
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
