import 'package:assessment/domain/entities/contact_entities/contact_entity.dart';

abstract class UserRepository {
  Future<ContactEntity> getUserById(String id);
  Future<ContactEntity> updateUserById(String id);
  Future<ContactEntity> deleteUserById(String id);
  Future<List<ContactEntity>> getAllUsers();
}
