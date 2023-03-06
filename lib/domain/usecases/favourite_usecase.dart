import 'package:assessment/domain/entities/contact_entities/contact_entity.dart';
import 'package:assessment/domain/entities/favourite_entities/favourite_entity.dart';
import 'package:assessment/domain/repositories/favourite_repository.dart';

class GetFavouriteUseCase {
  final FavouriteRepository repository;

  GetFavouriteUseCase({required this.repository});

  Future<FavouriteEntity> execute() async {
    return repository.getFavourite();
  }
}

class GetFavouriteByUserIdUseCase {
  final FavouriteRepository repository;

  GetFavouriteByUserIdUseCase({required this.repository});

  Future<FavouriteEntity> execute(String id) async {
    return repository.getFavouriteByUserId(id);
  }
}

class DeleteUserByIdFromFavouriteUseCase {
  final FavouriteRepository repository;

  DeleteUserByIdFromFavouriteUseCase({required this.repository});

  Future<FavouriteEntity> execute(ContactEntity contact) async {
    return repository.deleteUserById(contact);
  }
}

class AddUserByIdToFavouriteUseCase {
  final FavouriteRepository repository;

  AddUserByIdToFavouriteUseCase({required this.repository});

  Future<FavouriteEntity> execute(ContactEntity contact) async {
    return repository.addUserById(contact);
  }
}
