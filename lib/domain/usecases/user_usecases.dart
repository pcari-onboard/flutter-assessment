import 'package:assessment/domain/entities/contact_entities/contact_entity.dart';
import 'package:assessment/domain/repositories/user_repository.dart';

class GetUseByIdUseCase {
  final UserRepository repository;

  GetUseByIdUseCase({required this.repository});

  Future<ContactEntity> execute(String id) async {
    return repository.getUserById(id);
  }
}

class GetAllUsersUseCase {
  final UserRepository repository;

  GetAllUsersUseCase({required this.repository});

  Future<List<ContactEntity>> execute() async {
    return repository.getAllUsers();
  }
}

class UpdateUserByIdUseCase {
  final UserRepository repository;

  UpdateUserByIdUseCase({required this.repository});

  Future<ContactEntity> execute(String id) async {
    return repository.updateUserById(id);
  }
}

class DeleteUserByIdUseCase {
  final UserRepository repository;

  DeleteUserByIdUseCase({required this.repository});

  Future<ContactEntity> execute(String id) async {
    return repository.deleteUserById(id);
  }
}
