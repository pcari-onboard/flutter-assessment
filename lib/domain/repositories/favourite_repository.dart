import 'package:assessment/domain/entities/contact_entities/contact_entity.dart';
import 'package:assessment/domain/entities/favourite_entities/favourite_entity.dart';

abstract class FavouriteRepository {
  Future<FavouriteEntity> getFavourite();
  Future<FavouriteEntity> getFavouriteByUserId(String id);
  Future<FavouriteEntity> addUserById(ContactEntity contact);
  Future<FavouriteEntity> deleteUserById(ContactEntity contact);
}
