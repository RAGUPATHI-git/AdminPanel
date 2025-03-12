import 'package:firebase_auth/firebase_auth.dart';

class AuthRepository {
  final FirebaseAuth instance = FirebaseAuth.instance;

  //fetching data function
  Future<User?> signIn(String email, String password) async {
    final userCredential = await instance.signInWithEmailAndPassword(
        email: email, password: password);

    return userCredential.user;
  }
}
