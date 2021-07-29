import 'package:firebase_auth/firebase_auth.dart';

class AuthServices {
  late final FirebaseAuth auth;
  AuthServices({
    required this.auth,
  });

  Future<UserCredential> createUser(String email, String password) async {
    return await auth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  Future<void> persistence() async {
    await auth.setPersistence(Persistence.LOCAL);
  }

  Future<bool> islogedIn() async {
    if (await auth.currentUser == null) {
      return false;
    } else {
      return true;
    }
  }

  Future<UserCredential> loginUser(String email, String password) async {
    return await auth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  Future<void> singOut() async {
    await auth.signOut();
  }

  
}
