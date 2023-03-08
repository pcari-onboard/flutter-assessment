import 'package:assessment/domain/entities/contact_entities/contact_entity.dart';
import 'package:assessment/domain/repositories/user_repository.dart';

class GetContactUseCase {
  final UserRepository repository;

  GetContactUseCase({required this.repository});

  Future<ContactEntity> execute({String? id}) async {
    return repository.getUserById(id!);
  }
}

class EditContactUseCase {
  final UserRepository repository;

  EditContactUseCase({required this.repository});

  Future<ContactEntity> execute({ContactEntity? contact}) async {
    return repository.updateUserById(contact!);
  }
}
