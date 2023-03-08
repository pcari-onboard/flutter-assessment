import 'package:assessment/base/app/config/environment_config.dart';
import 'package:assessment/data/repositories/rest_repository.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

class AppDependencies {
  AppDependencies._(this.context, this.config);

  factory AppDependencies.of(
          BuildContext context, EnvironmentConfig envConfig) =>
      _instance != null
          ? _instance!
          : _instance = AppDependencies._(context, envConfig);

  static AppDependencies? _instance;

  final BuildContext context;
  final EnvironmentConfig config;

  /// List of all providers used throughout the app
  List<SingleChildWidget> get providers => [
        ..._analytics,
        ..._httpClients,
        ..._dataStorages,
        ..._dataSources,
        ..._repositories,
        ..._useCases,
        ..._viewmodels,
        ..._interceptors,
      ];

  List<Provider> get _analytics => [];

  List<Provider> get _httpClients => [
        Provider<Dio>(create: (context) => Dio()),
        Provider<RestService>(
          create: (context) => RestService(baseUrl: config.baseApiUrl),
        ),
      ];

  List<SingleChildWidget> get _dataStorages => [];

  /// Use different data source regarding of if it is running in web ot not
  List<Provider> get _dataSources => [];

  List<Provider> get _repositories => [];

  List<Provider> get _useCases => [];

  List<SingleChildWidget> get _viewmodels => [];

  List<Provider> get _interceptors => [];
}
