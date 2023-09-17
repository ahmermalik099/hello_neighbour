

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

class FirestoreService{
  //merge bio
  Future<void> mergeBio( String bio, String age, String city, String gender) async {
    String uid = FirebaseAuth.instance.currentUser!.uid;
    return await FirebaseFirestore.instance.
    collection('users').doc(uid).set({
      'bio': bio,
      'age': age,
      'city': city,
      'gender': gender,
    }, SetOptions(merge: true));
  }


}


