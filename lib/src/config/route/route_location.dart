import 'package:flutter/foundation.dart';

@immutable
class RouteLocation {
  const RouteLocation._();

  static String get splash => '/splash';

  static String get signup => '/signup';

  static String get login => '/login';

  static String get dashboard => '/dashboard';

  static String get home => '/home';

  static String get createTask => '/createTask';
}
