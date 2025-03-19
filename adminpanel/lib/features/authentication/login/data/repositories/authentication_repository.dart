import 'package:adminpanel/routes/routes.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class AuthenticationRepository extends GetxController {
  static AuthenticationRepository get instance => Get.find();
  Rx<User?> firebaseUser = Rx<User?>(null);

  final _auth = FirebaseAuth.instance;

  User? get authUser => _auth.currentUser;

  bool get isAuthentcation => _auth.currentUser != null;

  //Keep the login state after login
  @override
  void onReady() {
    super.onReady();
    _auth.setPersistence(Persistence.LOCAL);
  }
    @override
  void onInit() {
    super.onInit();
    firebaseUser.bindStream(_auth.authStateChanges());
  }

  void screenRedirect() async {
    final user = _auth.currentUser;

    if (user != null) {
      Get.offAllNamed(Routes.dashBoard);
    } else {
      Get.offAllNamed(Routes.login);
    }
  }

  //login
  Future<UserCredential> loginWithEmailAndPassword(
      String email, String password) async {
    try {
      return await _auth.signInWithEmailAndPassword(
          email: email, password: password);
    } catch (e) {
      throw "Something went wrong. Please try again";
    }
  }

  //register
  Future<UserCredential> registerWithEmailAndPassword(
      String email, String password) async {
    try {
      return await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
    } catch (e) {
      throw "Something went wrong. Please try again";
    }
  }

  //Logout

  Future<void> logout() async {
    try {
      print("logout");
      await _auth.signOut();
    } catch (e) {
      throw "Something went wrong. Please try again";
    }
  }

  Future<void> signOut() async {
    await _auth.signOut();
  }
}
