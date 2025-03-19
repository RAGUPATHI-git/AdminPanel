import 'package:adminpanel/features/authentication/login/data/model/authentication_model.dart';
import 'package:adminpanel/features/authentication/login/data/repositories/authentication_repository.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class UserRepository extends GetxController {
  static UserRepository get instance => Get.find();

  final _db = FirebaseFirestore.instance;

  Future<void> createUser(UserModel user) async {
    try {
      await _db.collection('Users').doc(user.id).set(user.toJson());
    } on FirebaseAuthException catch (e) {
      throw "Something went wrong. Please try again!";
    }
  }

  //Function to fetch user details based on user ID
  Future<UserModel> fetchAdminDetails() async {
    try {

      final docSnapshot = await _db
          .collection('Users')
          .doc(AuthenticationRepository.instance.authUser!.uid)
          .get();
      if (docSnapshot.exists) {
        return UserModel.fromSnapshot(docSnapshot);
      } else {
        return UserModel.empty();
      }
    } on FirebaseAuthException  catch (e) {
      throw "Something went wrong. Please try again!";
    }
  }
}
