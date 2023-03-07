import 'package:assessment/domain/entities/contact_entities/contact_entity.dart';

abstract class UserRepository {
  Future<ContactEntity> getUserById(String id);
  Future<ContactEntity> updateUserById(ContactEntity id);
  Future<ContactEntity> deleteUserById(ContactEntity contact);
  Future<List<ContactEntity>> getAllUsers();
}
