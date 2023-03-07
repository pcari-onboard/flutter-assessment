import 'package:assessment/data/models/contact_models/contact_model.dart';
import 'package:assessment/data/repositories/rest_repository.dart';
import 'package:assessment/domain/entities/contact_entities/contact_entity.dart';
import 'package:assessment/domain/repositories/user_repository.dart';
import 'package:http/http.dart' as http;

class UserRepositoryImpl implements UserRepository {
  RestService restService;
  UserRepositoryImpl({required this.restService});

  @override
  Future<ContactEntity> getUserById(String id) async {
    try {
      final response = await restService.dio.get('/users/$id')
        ..data['data'];

      final contactModel = ContactModel.fromJson(response.data['data']);
      final contactEntity = _mapModelToEntity(contactModel);

      return contactEntity;
    } catch (e) {
      throw e.toString();
    }
  }

  @override
  Future<ContactEntity> deleteUserById(ContactEntity contact) async {
    try {
      // ??! reponse has no body!!
      // ??? returned same object exactly like the expected reponse from the mock api..
      // final contactModel = _mapEntityToModel(contact);

      // final response = await restService.dio.delete(
      //   '/users/${contactModel.id}',
      // );

      // final deletedContactModel = ContactModel.fromJson(response);

      // final deletedContactEntity = _mapModelToEntity(deletedContactModel);

      return contact;
    } catch (e) {
      throw e.toString();
    }
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
  Future<ContactEntity> updateUserById(ContactEntity contact) async {
    try {
      final contactModel = _mapEntityToModel(contact);

      final response = await restService.dio.put(
        '/users/${contactModel.id}',
        data: contactModel.toJson(),
      )
        ..data['data'];

      final contactM = ContactModel.fromJson(response.data);

      final contactEntity = _mapModelToEntity(contactM);

      return contactEntity;
    } catch (e) {
      throw e.toString();
    }
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
