import 'package:assessment/data/repositories/user_repository_impl.dart';
import 'package:assessment/domain/repositories/user_repository.dart';
import 'package:assessment/domain/usecases/profile_usecases.dart';
import 'package:assessment/presentation/pages/profile/profile_viewmodels/profile_viewmodel.dart';
import 'package:assessment/presentation/pages/profile/profile_viewmodels/profile_widget_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

class ProfileDependencies {
  ProfileDependencies._(this.context);

  factory ProfileDependencies.of(BuildContext context) {
    return _instance != null
        ? _instance!
        : _instance = ProfileDependencies._(context);
  }

  static ProfileDependencies? _instance;

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
  ];

  late final List<Provider> _usecases = [
    // RestfulCollectionService provided in app_dependencies.dart
    // RestfulCartService provided in app_dependecies.dart
    Provider<GetContactUseCase>(
      create: (context) => GetContactUseCase(
        repository: context.read(),
      ),
    ),
    Provider<EditContactUseCase>(
      create: (context) => EditContactUseCase(
        repository: context.read(),
      ),
    ),
  ];

  late final List<ChangeNotifierProvider> _viewmodels = [
    ChangeNotifierProvider<ProfileWidgetViewModel>(
      create: (context) => ProfileWidgetViewModel(),
    ),
    ChangeNotifierProvider<ProfileViewModel>(
      create: (context) => ProfileViewModel(
        editContactUseCase: context.read(),
        getContactUseCase: context.read(),
        profileWidgetViewModel: context.read(),
      ),
    ),
  ];
}
