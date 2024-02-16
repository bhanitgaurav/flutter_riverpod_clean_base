import 'package:flutter_riverpod_todo_app/src/data/models/user.dart';

abstract class AuthRepository {
  Future<bool> loggedIn();

  Future<bool> signUp(User user);

  Future<String> verifyLogin(String username, String password);

  Future<void> clear();

  Future<void> logOut();

}
