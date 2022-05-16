import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:sutraq_app/routes/routes.dart';

class AuthLogic {
  Future resgitration(String emailAddress, String password, context) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
              email: emailAddress, password: password);
      var authCreadential = userCredential.user;
      if (authCreadential!.uid.isNotEmpty) {
        Fluttertoast.showToast(msg: "Registration Successfull");
        Get.toNamed(signIn);
      } else {
        print("Sign up failed");
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == "weak-password") {
        Fluttertoast.showToast(msg: "The password provided is too weak");
      }
      if (e.code == "email-already-in-use") {
        Fluttertoast.showToast(
            msg: "The account already exists for that email");
      }
    } catch (e) {
      Fluttertoast.showToast(msg: "Error is: $e");
    }
  }

  Future Login(String emailAddress, String password, context) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: emailAddress, password: password);
      var authCredential = userCredential.user;

      if (authCredential!.uid.isNotEmpty) {
        Get.toNamed(home);
      } else {
        Fluttertoast.showToast(msg: "Someting is worng");
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        Fluttertoast.showToast(msg: "No user found for that email.");
      } else if (e.code == 'wrong-password') {
        Fluttertoast.showToast(msg: "Wrong password provided for that user.");
      }
    } catch (e) {
      print(e);
    }
  }

  Future signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    UserCredential userCredential =
        await FirebaseAuth.instance.signInWithCredential(credential);
    User? _user = userCredential.user;

    if (_user!.uid.isNotEmpty) {
      Get.toNamed(home);
    } else {
      Fluttertoast.showToast(msg: "Worng");
    }
  }
}
