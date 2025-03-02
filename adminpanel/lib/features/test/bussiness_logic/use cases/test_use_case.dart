import 'package:adminpanel/features/test/bussiness_logic/entities/test_entity.dart';
import 'package:adminpanel/features/test/bussiness_logic/repositories/test_reopository.dart';
import 'package:adminpanel/features/test/data/data%20source/test_data_source.dart';
import 'package:adminpanel/features/test/data/repositories/test_repository_impl.dart';

class TestUseCase {
  final TestReopository reopository1;
  final TestReopository reopository = TestRepositoryImpl(testDataSource: TestDataSource());

  TestUseCase({required this.reopository1});

  Future<void> addTestUser(TestEntity user) => reopository.addTestUSer(user);
  Future<List<TestEntity>> getUsers() => reopository.getTestUser();
  Future<void> updateUser(TestEntity user) => reopository.updateTestUser(user);
  Future<void> deleteUSer(String id) => reopository.deleteTestUser(id);
}
