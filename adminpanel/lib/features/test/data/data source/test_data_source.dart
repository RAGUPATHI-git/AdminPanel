import 'package:adminpanel/features/test/data/models/test_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class TestDataSource {
  // 1. create the instance
  final FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

  // Adding the single user
  Future<void> addUser(TestModel user) async {
    await firebaseFirestore.collection('test').doc(user.id).set(user.toMap());
  }

  // Get the List of user
  Future<List<TestModel>> getUsers() async {
    //1 . get the collection as snapshot
    final snapshot = await firebaseFirestore.collection('test').get();
    return snapshot.docs.map((doc) => TestModel.fromJson(doc.data())).toList();
  }

  //update the user's data
  Future<void> updateUser(TestModel user) async {
    await firebaseFirestore
        .collection('test')
        .doc(user.id)
        .update(user.toMap());
  }

  //delete the user's data
  Future<void> deleteUser(String id) async {
    await firebaseFirestore.collection('test').doc(id).delete();
  }
}
