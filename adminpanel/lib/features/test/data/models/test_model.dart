import 'package:adminpanel/features/test/bussiness_logic/entities/test_entity.dart';

class TestModel extends TestEntity {
  TestModel({required String name, required String id, required int age})
      : super(age: age, name: name, id: id);

  factory TestModel.fromJson(Map<String, dynamic> map) =>
      TestModel(name: map['name'], id: map['id'], age: map['age']);

  Map<String, dynamic> toMap() => {'id': id, 'name': name, 'age': age};
}
