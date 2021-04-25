import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:firebase_storage/firebase_storage.dart';
import 'package:path/path.dart';
import 'package:stayegy_host/bloc/Repository/User_Details.dart';
import 'package:stayegy_host/bloc/Repository/hotel.dart';

class UserRepository {
  final auth.FirebaseAuth _firebaseAuth;
  FirebaseFirestore db = FirebaseFirestore.instance;
  FirebaseStorage storage = FirebaseStorage.instance;

  UserRepository({auth.FirebaseAuth firebaseAuth})
      : _firebaseAuth = firebaseAuth ?? auth.FirebaseAuth.instance;

  Future<void> sendOTP(
      String phoneNumber,
      Duration timeOut,
      auth.PhoneVerificationCompleted phoneVerificationCompleted,
      auth.PhoneVerificationFailed phoneVerificationFailed,
      auth.PhoneCodeSent phoneCodeSent,
      auth.PhoneCodeAutoRetrievalTimeout phoneCodeAutoRetrievalTimeout) async {
    _firebaseAuth.verifyPhoneNumber(
        phoneNumber: phoneNumber,
        verificationCompleted: phoneVerificationCompleted,
        verificationFailed: phoneVerificationFailed,
        codeSent: phoneCodeSent,
        codeAutoRetrievalTimeout: phoneCodeAutoRetrievalTimeout);
  }

  Future<auth.UserCredential> verifyAndLogin(
      String verificationId, String smsCode) async {
    auth.AuthCredential authCredential =
        await auth.PhoneAuthProvider.credential(
            verificationId: verificationId, smsCode: smsCode);

    return _firebaseAuth.signInWithCredential(authCredential);
  }

  Future<auth.User> getUser() async {
    auth.User user = await _firebaseAuth.currentUser;

    return user;
  }

  Future<void> uploadUserDetails(
      {UserDetails user,
      String name,
      String email,
      String phoneNumber,
      String gender,
      File image}) async {
    String picUrl;

    if (image != null) {
      picUrl = await uploadPictureAndGetUrl(image);
    } else {
      picUrl = "";
    }

    user.valueSetter(
        name: name,
        email: email,
        phoneNumber: phoneNumber,
        gender: gender,
        picUrl: picUrl);

    final documentReference =
        await db.collection("hotelOwner").doc(user.uid).get();
    await documentReference.reference.set(user.toJason());
  }

  Future<String> uploadPictureAndGetUrl(File image) async {
    var snapshot = await storage
        .ref()
        .child('userPhotos/${basename(image.path)}}')
        .putFile(image);
    return await snapshot.ref.getDownloadURL();
  }

  Future<void> logOut() async {
    return Future.wait([
      _firebaseAuth.signOut(),
    ]);
  }

  Future<Hotel> getHotelDetails() async {
    final documentReference = await db
        .collection("hotelOwner")
        .doc("${_firebaseAuth.currentUser.uid}")
        .get();
    String hotelID = documentReference.get("hid").toString();

    final hotelReference = await db.collection("hotels").doc("$hotelID").get();

    Hotel hotel = Hotel.fromMap(hotelReference.data());

    return hotel;
  }
}
