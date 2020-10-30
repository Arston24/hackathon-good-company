


import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserRepository {

  final db = FirebaseFirestore.instance;
  FirebaseAuth auth = FirebaseAuth.instance;

  Future<bool> isUserExist() async {
    final user = auth.currentUser;
    final doc = await db.collection('users').doc(user.uid).get();
    return doc.exists;
  }


}