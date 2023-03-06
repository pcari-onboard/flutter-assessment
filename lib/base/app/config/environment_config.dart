// Copyright (c) 2021, Prime Holding JSC
// https://www.primeholding.com
//
// Use of this source code is governed by an MIT-style
// license that can be found in the LICENSE file or at
// https://opensource.org/licenses/MIT.

enum EnvironmentType { dev, staging, prod }

/// Environment configuration that enables you to get define and reuse
/// environment specific properties (such as API endpoints, server secrets, ...)
class EnvironmentConfig {
  const EnvironmentConfig._({
    required this.baseApiUrl,
    required this.websocketUrl,
    this.environment = EnvironmentType.dev,
  });

  final EnvironmentType environment;
  final String baseApiUrl;
  final String websocketUrl;

  /// region Environments
  ///
  /// Don't forget to change vapid key in app_constants for web production

  static const EnvironmentConfig dev = EnvironmentConfig._(
      environment: EnvironmentType.dev,
      // baseApiUrl: 'https://recrave-aries.herokuapp.com',
      //baseApiUrl: 'http://10.0.2.2:3000',
      // baseApiUrl: 'http://0.0.0.0:3000',
      baseApiUrl: 'https://reqres.in/api',
      // baseApiUrl:
      //    'http://ec2-13-229-125-40.ap-southeast-1.compute.amazonaws.com:3000'
      websocketUrl: 'wss://'
      // websocketUrl: 'ws://localhost:3000'
      );

  static const EnvironmentConfig staging = EnvironmentConfig._(
    environment: EnvironmentType.staging,
    baseApiUrl: 'https://reqres.in/api/',
    websocketUrl: 'wss://',
  );

  /// Don't forget to change vapid key in app_constants for web production
  static const EnvironmentConfig prod = EnvironmentConfig._(
    environment: EnvironmentType.prod,
    baseApiUrl: 'https://reqres.in/api/',
    websocketUrl: 'wss://',
  );

  ///endregion
}
