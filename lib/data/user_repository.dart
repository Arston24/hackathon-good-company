
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'model/user.dart';

class UserRepository {

  final db = FirebaseFirestore.instance;
  FirebaseAuth auth = FirebaseAuth.instance;

  Future<bool> isUserExist() async {
    final user = auth.currentUser;
    final doc = await db.collection('users').doc(user.uid).get();
    return doc.exists;
  }

  void createNewUser(UserModel user) async {
    var currentUser = auth.currentUser;
    user.userId = currentUser.uid;
    user.phone = currentUser.phoneNumber;
    await db.collection('users').doc(user.userId).set(user.toJson());
  }

  Future<UserModel> getCurrentUser() async {
    final currentUser = await auth.currentUser;
    var userId = currentUser.uid;
    final doc = await db.collection('users').doc(userId).get();
    return UserModel.fromJson(doc.data());
  }
}