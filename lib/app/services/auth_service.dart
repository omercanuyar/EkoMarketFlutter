import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

//firebase auth işlemleri için dependency injection yapılan class
class AuthService extends GetxService {
  // final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  static var email = "".obs;
  static var password = "".obs;

  static Future<bool> register(
      String email, String password, String name) async {
    try {
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      FirebaseAuth.instance.currentUser!.updateDisplayName(name);
      return true;
    } on FirebaseAuthException catch (e) {
      Get.snackbar("Error", e.message.toString(),
          backgroundColor: Colors.orangeAccent,
          snackPosition: SnackPosition.BOTTOM,
          duration: const Duration(seconds: 2));
      return false;
    }
  }

  static Future<bool> login(String email, String password) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return true;
    } on FirebaseAuthException catch (e) {
      Get.snackbar("error", e.message!);
      return false;
    } catch (e) {
      Get.snackbar("Error", e.toString(),
          backgroundColor: Colors.white,
          overlayColor: Colors.white,
          snackPosition: SnackPosition.TOP,
          colorText: Colors.black,
          duration: const Duration(seconds: 2));
      return false;
    }
  }

  static void logout() async {
    await FirebaseAuth.instance.signOut();
  }
}
