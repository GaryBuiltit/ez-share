import "package:cloud_firestore/cloud_firestore.dart";
import "package:firebase_auth/firebase_auth.dart";

class Firestore {
  final users = FirebaseFirestore.instance.collection('users');

  addUser(User? user) {
    Map<String, dynamic> newUser = {
      'Uid': user!.uid,
      'email': user.email,
      'file_shares': [],
    };
    users.doc(user.uid).set(newUser);
  }
}
