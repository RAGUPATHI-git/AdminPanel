import 'package:adminpanel/features/test/bussiness_logic/entities/test_entity.dart';

abstract class TestReopository {
  //write all the abstract functions
  Future<void> addTestUSer(TestEntity user);
  Future<List<TestEntity>> getTestUser();
  Future<void> updateTestUser(TestEntity user);
  Future<void> deleteTestUser(String id);
}
