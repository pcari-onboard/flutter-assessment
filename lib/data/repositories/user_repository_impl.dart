import 'package:assessment/data/models/contact_models/contact_model.dart';
import 'package:assessment/data/repositories/rest_repository.dart';
import 'package:assessment/domain/entities/contact_entities/contact_entity.dart';
import 'package:assessment/domain/repositories/user_repository.dart';

class UserRepositoryImpl implements UserRepository {
  RestService restService;
  UserRepositoryImpl({required this.restService});

  @override
  Future<ContactEntity> getUserById(String id) async {
    // Assume that we fetch user data from an API or local database
    // final user =
    //     ContactModel(id: id, firstName: 'John Doe', email: 'john.doe@example.com');
    // return ContactEntity(id: user.id!, name: user.name!, email: user.email!);
    throw UnimplementedError();
  }

  @override
  Future<ContactEntity> deleteUserById(String id) {
    throw UnimplementedError();
  }

  @override
  Future<List<ContactEntity>> getAllUsers() async {
    try {
      final response = await restService.dio.get('/users?page=1')
        ..data['data'];

      final listContactModel =
          List<Map<String, dynamic>>.from(response.data['data'])
              .map((e) => ContactModel.fromJson(e))
              .toList();
      final listContactEntity =
          listContactModel.map((e) => _mapModelToEntity(e)).toList();

      return listContactEntity;
    } catch (e) {
      throw e.toString();
    }
  }

  @override
  Future<ContactEntity> updateUserById(String id) {
    throw UnimplementedError();
  }

  ContactModel _mapEntityToModel(ContactEntity user) {
    return ContactModel(
      id: user.id,
      email: user.email,
      first_name: user.first_name,
      last_name: user.last_name,
      avatar: user.avatar,
    );
  }

  ContactEntity _mapModelToEntity(ContactModel user) {
    return ContactEntity(
      id: user.id,
      first_name: user.first_name,
      last_name: user.last_name,
      avatar: user.avatar,
      email: user.email,
    );
  }
}
