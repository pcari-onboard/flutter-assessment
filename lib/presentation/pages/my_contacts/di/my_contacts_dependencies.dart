import 'package:assessment/data/repositories/favourite_repository_impl.dart';
import 'package:assessment/data/repositories/user_repository_impl.dart';
import 'package:assessment/domain/repositories/favourite_repository.dart';
import 'package:assessment/domain/repositories/user_repository.dart';
import 'package:assessment/domain/usecases/favourite_usecase.dart';
import 'package:assessment/domain/usecases/user_usecases.dart';
import 'package:assessment/presentation/pages/my_contacts/viewmodels/user_viewmodel.dart';
import 'package:assessment/presentation/pages/my_contacts/viewmodels/user_widget_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

class MyContactsDependencies {
  MyContactsDependencies._(this.context);

  factory MyContactsDependencies.of(BuildContext context) {
    return _instance != null
        ? _instance!
        : _instance = MyContactsDependencies._(context);
  }

  static MyContactsDependencies? _instance;

  final BuildContext context;

  late List<SingleChildWidget> providers = [
    ..._repositories,
    ..._usecases,
    ..._viewmodels,
  ];

  late final List<Provider> _repositories = [
    // RestfulCollectionService provided in app_dependencies.dart
    // RestfulCartService provided in app_dependecies.dart
    Provider<UserRepository>(
      create: (context) => UserRepositoryImpl(
        restService: context.read(),
      ),
    ),
    Provider<FavouriteRepository>(
      create: (context) => FavouriteRepositoryImpl(
        restService: context.read(),
      ),
    ),
  ];

  late final List<Provider> _usecases = [
    // RestfulCollectionService provided in app_dependencies.dart
    // RestfulCartService provided in app_dependecies.dart
    Provider<DeleteUserByIdUseCase>(
      create: (context) => DeleteUserByIdUseCase(
        repository: context.read(),
      ),
    ),
    Provider<UpdateUserByIdUseCase>(
      create: (context) => UpdateUserByIdUseCase(
        repository: context.read(),
      ),
    ),
    Provider<GetAllUsersUseCase>(
      create: (context) => GetAllUsersUseCase(
        repository: context.read(),
      ),
    ),
    Provider<GetUseByIdUseCase>(
      create: (context) => GetUseByIdUseCase(
        repository: context.read(),
      ),
    ),
    Provider<GetFavouriteUseCase>(
      create: (context) => GetFavouriteUseCase(
        repository: context.read(),
      ),
    ),
    Provider<AddUserByIdToFavouriteUseCase>(
      create: (context) => AddUserByIdToFavouriteUseCase(
        repository: context.read(),
      ),
    ),
    Provider<DeleteUserByIdFromFavouriteUseCase>(
      create: (context) => DeleteUserByIdFromFavouriteUseCase(
        repository: context.read(),
      ),
    ),
  ];

  late final List<ChangeNotifierProvider> _viewmodels = [
    ChangeNotifierProvider<UserWidgetViewmodel>(
      create: (context) => UserWidgetViewmodel(),
    ),
    ChangeNotifierProvider<UserViewmodel>(
      create: (context) => UserViewmodel(
        deleteUserByIdUseCase: context.read(),
        addUserByIdToFavouriteUseCase: context.read(),
        deleteUserByIdFromFavouriteUseCase: context.read(),
        getFavouriteUseCase: context.read(),
        userWidgetViewmodel: context.read(),
        getAllUsersUseCase: context.read(),
        updateUserByIdUseCase: context.read(),
      ),
    ),
  ];
}
