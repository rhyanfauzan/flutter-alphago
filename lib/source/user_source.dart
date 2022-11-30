import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:alphago/config/session.dart';

import '../model/user.dart';

CollectionReference tblUser = FirebaseFirestore.instance.collection('User');

class UserSource {
  static Future<Map<String, dynamic>> signIn(
    String email,
    String password,
  ) async {
    Map<String, dynamic> response = {};
    try {
      final credential = await auth.FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      response['success'] = true;
      response['message'] = 'Sign In Success';
      String? emailId = credential.user!.email;
      UserModel user = await getWhereEmail(emailId!);
      Session.saveUser(user);
    } on auth.FirebaseAuthException catch (e) {
      response['success'] = false;

      if (e.code == 'user-not-found') {
        response['message'] = 'No user found for that email';
      } else if (e.code == 'wrong-password') {
        response['message'] = 'Wrong password provided for that user';
      } else {
        response['message'] = 'Sign in failed';
      }
    }
    return response;
  }

  // register
  @override
  Future<UserSource?> createUserWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    Map<String, dynamic> response = {};
    try {
      final userCredential =
          await auth.FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      response['success'] = true;
      response['message'] = 'Register Success';
    } on auth.FirebaseAuthException catch (e) {
      response['success'] = false;

      response['message'] = 'Register in failed';
    }
  }
  // end register

  // get user where email
  static Future<UserModel> getWhereEmail(String email) async {
    DocumentReference<Map<String, dynamic>> ref =
        FirebaseFirestore.instance.collection('User').doc(email);
    DocumentSnapshot<Map<String, dynamic>> doc = await ref.get();
    return UserModel.fromJson(doc.data()!);
  }

  // add user to firestore
  static Future<void> registerUser({required UserModel item}) async {
    DocumentReference ref = tblUser.doc(item.email);
    await ref.set(item.toJson()).whenComplete(() {
      print("User berhasil ditambahkan keFirestore");
    }).catchError((e) => print('User gagal ditambahkan keFirestore'));
    print('menambahkan user ke firestore');
  }
}
