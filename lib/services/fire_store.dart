import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

class FirestoreService {
  //merge bio
  Future<void> mergeBio(String bio) async {
    String uid = FirebaseAuth.instance.currentUser!.uid;
    return await FirebaseFirestore.instance.collection('users').doc(uid).set({
      'bio': bio,
      // 'age': age,
      // 'city': city,
      // 'gender': gender,
    }, SetOptions(merge: true));
  }

  Future<void> mergeDetails(String age, String city, String gender) async{
    String uid = FirebaseAuth.instance.currentUser!.uid;
    return await FirebaseFirestore.instance.collection('users').doc(uid).set({
      'age': age,
      'city': city,
      'gender': gender,
    }, SetOptions(merge: true));
  }

  Future<void> addPFP(String img) async {
    String uid = FirebaseAuth.instance.currentUser!.uid;

    final ref = FirebaseFirestore.instance.doc("users/${uid}");
    var data = {
      "pfp_url": img,
    };

    return ref.set(data, SetOptions(merge: true));
  }

  Future<void> addShowcaseImages(List<String> img) async {
    String uid = FirebaseAuth.instance.currentUser!.uid;

    final ref = FirebaseFirestore.instance.doc("users/${uid}");
    var data = {
      "images": img,
    };

    return ref.set(data, SetOptions(merge: true));
  }

  Stream<DocumentSnapshot<Map<String, dynamic>>> getDetails() {
    String uid = FirebaseAuth.instance.currentUser!.uid;
    return FirebaseFirestore.instance.collection('users').doc(uid).snapshots();
    
  }
}
