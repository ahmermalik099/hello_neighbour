import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

class FirestoreService {
  // create a document for the user
  Future<void> createUser(String email, String lat, String long, String userName) async {
    String uid = FirebaseAuth.instance.currentUser!.uid;
    return await FirebaseFirestore.instance.collection('users').doc(uid).set({
      'email': email,
      'lat': lat,
      'long': long,
      'userName': userName,
    });
  }
  //merge bio
  Future<void> mergeBio(String bio) async {
    String uid = FirebaseAuth.instance.currentUser!.uid;
    return await FirebaseFirestore.instance.collection('users').doc(uid).set({
      'bio': bio,
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

  Future<List<dynamic>> getUsers() async {
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance.collection('users').get();

    List<Map<String, dynamic>> usersList = [];

    querySnapshot.docs.forEach((doc) {
      Map<String, dynamic> userData = doc.data() as Map<String, dynamic>;
      userData['uid'] = doc.id; // Add the UID to the map
      usersList.add(userData);
    });

    return usersList;
  }

}
