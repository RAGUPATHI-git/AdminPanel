import 'package:adminpanel/features/test/bussiness_logic/repositories/test_reopository.dart';
import 'package:adminpanel/features/test/bussiness_logic/entities/test_entity.dart';
import 'package:adminpanel/features/test/data/data%20source/test_data_source.dart';
import 'package:adminpanel/features/test/data/models/test_model.dart';

class TestRepositoryImpl implements TestReopository {
  final TestDataSource? testDataSource;

  TestRepositoryImpl({this.testDataSource});

  @override
  Future<void> addTestUSer(TestEntity user) async {
    testDataSource!
        .addUser(TestModel(name: user.name, id: user.id, age: user.age));
  }

  @override
  Future<List<TestEntity>> getTestUser() async {
    final users = await testDataSource!.getUsers();
    return users
        .map((user) => TestEntity(name: user.name, id: user.id, age: user.age))
        .toList();
  }

  @override
  Future<void> deleteTestUser(String id) async {
    await testDataSource!.deleteUser(id);
  }

  @override
  Future<void> updateTestUser(TestEntity user) async {
  await  testDataSource!
        .updateUser(TestModel(name: user.name, id: user.id, age: user.age));
  }
}
