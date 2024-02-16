import 'package:flutter/foundation.dart' show immutable;

@immutable
class AuthTableKeys {
  const AuthTableKeys._();

  static const String id = 'id';
  static const String username = 'username';
  static const String password = 'password';
  static const String loggedIn = 'loggedIn';
  static const String date = 'date';
  static const String time = 'time';
}
