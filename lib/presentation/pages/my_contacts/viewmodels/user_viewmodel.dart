import 'package:assessment/domain/entities/contact_entities/contact_entity.dart';
import 'package:assessment/domain/entities/favourite_entities/favourite_entity.dart';
import 'package:assessment/domain/usecases/favourite_usecase.dart';
import 'package:assessment/domain/usecases/user_usecases.dart';
import 'package:assessment/presentation/pages/my_contacts/viewmodels/user_widget_viewmodel.dart';
import 'package:flutter/material.dart';

class UserViewmodel extends ChangeNotifier {
  List<ContactEntity>? users;
  late FavouriteEntity favourite;

  final GetAllUsersUseCase getAllUsersUseCase;
  final UpdateUserByIdUseCase updateUserByIdUseCase;
  final DeleteUserByIdFromFavouriteUseCase deleteUserByIdFromFavouriteUseCase;
  final GetFavouriteUseCase getFavouriteUseCase;
  final AddUserByIdToFavouriteUseCase addUserByIdToFavouriteUseCase;
  final UserWidgetViewmodel userWidgetViewmodel;

  UserViewmodel({
    required this.getFavouriteUseCase,
    required this.addUserByIdToFavouriteUseCase,
    required this.deleteUserByIdFromFavouriteUseCase,
    required this.userWidgetViewmodel,
    required this.getAllUsersUseCase,
    required this.updateUserByIdUseCase,
  });

  Future<void> getAllUsers() async {
    // userWidgetViewmodel.loading = true;
    users = await getAllUsersUseCase.execute();
    // userWidgetViewmodel.loading = false;
  }

  Future<void> getFavourite() async {
    // userWidgetViewmodel.loading = true;
    favourite = await getFavouriteUseCase.execute();
    userWidgetViewmodel.loading = false;
  }

  Future<void> addToFavourite(ContactEntity contact) async {
    favourite = await addUserByIdToFavouriteUseCase.execute(contact);
    notifyListeners();
  }

  Future<void> deleteFromFavourite(ContactEntity contact) async {
    favourite = await deleteUserByIdFromFavouriteUseCase.execute(contact);
    notifyListeners();
  }
}
