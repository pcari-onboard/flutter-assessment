import 'package:assessment/data/models/contact_models/contact_model.dart';
import 'package:assessment/data/models/favourite_models/favourite_model.dart';
import 'package:assessment/data/repositories/rest_repository.dart';
import 'package:assessment/domain/entities/contact_entities/contact_entity.dart';
import 'package:assessment/domain/entities/favourite_entities/favourite_entity.dart';
import 'package:assessment/domain/repositories/favourite_repository.dart';

class FavouriteRepositoryImpl implements FavouriteRepository {
  final RestService restService;
  late FavouriteEntity favourite =
      const FavouriteEntity(id: 'id', favourite: []);

  FavouriteRepositoryImpl({required this.restService});
  @override
  Future<FavouriteEntity> addUserById(ContactEntity contact) async {
    try {
      favourite =
          favourite.copyWith.favourite([...favourite.favourite, contact]);
      return favourite;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<FavouriteEntity> deleteUserById(ContactEntity contact) async {
    try {
      favourite = favourite.copyWith.favourite(
          favourite.favourite.where((element) => element != contact).toList());
      return favourite;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<FavouriteEntity> getFavouriteById(String id) {
    throw UnimplementedError();
  }

  @override
  Future<FavouriteEntity> getFavouriteByUserId(String id) {
    throw UnimplementedError();
  }

  @override
  Future<FavouriteEntity> getFavourite() {
    try {
      return Future.delayed(
        const Duration(milliseconds: 100),
        () => favourite,
      );
    } catch (e) {
      rethrow;
    }
  }

  FavouriteModel _mapEntityToModel(FavouriteEntity favourite) {
    return FavouriteModel(
      id: favourite.id,
      favouriteList: favourite.favourite
          .map((e) => ContactModel(
                id: e.id,
                first_name: e.first_name,
                avatar: e.avatar,
                last_name: e.last_name,
                email: e.email,
              ))
          .toList(),
    );
  }

  FavouriteEntity _mapModelToEntity(FavouriteModel favourite) {
    return FavouriteEntity(
      id: favourite.id,
      favourite: favourite.favouriteList!
          .map(
            (e) => ContactEntity(
              id: e.id,
              email: e.email,
              first_name: e.first_name,
              last_name: e.last_name,
              avatar: e.avatar,
            ),
          )
          .toList(),
    );
  }
}
