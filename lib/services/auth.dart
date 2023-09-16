import 'package:firebase_auth/firebase_auth.dart';

class AuthService{
  final userStream = FirebaseAuth.instance.authStateChanges();
  final user = FirebaseAuth.instance.currentUser;
  final _auth = FirebaseAuth.instance;

  Future<User ?> emailLogin(String email, String password) async {
    try {
      var user = await _auth.signInWithEmailAndPassword(email: email, password: password);
      if(user != null){
        return user.user;
      }
    } on FirebaseAuthException catch (_) {
      // handle error
      return null;
    }
    return null;
  }
  /// Anonymous Firebase login
  Future<void> anonLogin() async {
    try {
      await FirebaseAuth.instance.signInAnonymously();
    } on FirebaseAuthException {
      // handle error
    }
  }
  Future<User?> registerUser(String email, String password)async {
    try{
      final new_user = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      return new_user.user;
    }
    catch(e){

    }
    return null;
  }
  Future<void> signOut() async {
    await FirebaseAuth.instance.signOut();
  }

}