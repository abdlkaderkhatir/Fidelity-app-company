import 'package:fidelity_app/views/complete_inscription_screen.dart';
import 'package:fidelity_app/views/confirmation_phone_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthController extends GetxController{
  TextEditingController phoneController = TextEditingController();
  TextEditingController codePinController = TextEditingController();
  TextEditingController nomControllerUpdated = TextEditingController();
  TextEditingController prenomControllerUpdated = TextEditingController();
  FirebaseAuth auth = FirebaseAuth.instance;

  String phone = "";
  String nom = "";
  String? lastName = "";
  String? name = "";
  String nameEmploye = "";
  String phoneEmploye = "";
  String? imgEmploye;


  var isLoading = false.obs;

  Future<void> verifyUserPhoneNumber() async {
    try {
      isLoading(true);
      await auth.verifyPhoneNumber(
        phoneNumber: "+213${phoneController.value.text}",
        timeout: const Duration(seconds: 60),
        verificationCompleted: (PhoneAuthCredential credential) async{
          // ANDROID ONLY!

          // Sign the user in (or link) with the auto-generated credential
          await auth.signInWithCredential(credential);
        },
        verificationFailed: (FirebaseAuthException e) {
          if (e.code == 'invalid-phone-number') {
            print('The provided phone number is not valid.');
          }
        },
        codeSent: (String verificationId, int? resendToken) {
          // print(verificationId);
          isLoading(false);
          Get.to(ConfirmationPhoneScreen(
              phone: phoneController.value.text,
              verficationId: verificationId));
        },
        codeAutoRetrievalTimeout: (String verificationId) {},
      );
    } catch (e) {
      isLoading(false);
    }
  }

  Future<void> confiramationPhoneNumber(String verficationId) async {
    String smsCode = codePinController.text;

    // print(smsCode);

    final cred = PhoneAuthProvider.credential(
        verificationId: verficationId, smsCode: smsCode);

    try {
      isLoading(true);
      await auth.signInWithCredential(cred);

      var currentFirebaseUser = auth.currentUser!;

      if (currentFirebaseUser.photoURL == null) {
        isLoading(false);
        // Get.toNamed(Routes.typeScreen);
        Get.to(()=>const CompleteInscriptionScreen());
      } else {
        isLoading(false);
        checkifUserIsAuthenticate();
      } 
    } catch (e) {
      isLoading(false);
      // Fluttertoast.showToast(msg: e.toString());
      // print("Error");
    }
  }

 void checkifUserIsAuthenticate() async {
    // FirebaseAuth auth = FirebaseAuth.instance;

    // User user = auth.currentUser!;

    // String? A = user.photoURL;

    // if (A == null || A.length == 4) {
    //   Get.toNamed(Routes.typeScreen);
    // } else if (A == "1") {
    //   Get.offAllNamed(Routes.mainScreen);
    // } else {
    //   // Employee
    //   Get.offAllNamed(Routes.mainEmployeeScreen);
    // }
  }
}