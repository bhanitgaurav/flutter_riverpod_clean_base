import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_todo_app/src/data/models/user.dart';
import 'package:flutter_riverpod_todo_app/src/data/repository/auth_repository.dart';
import 'package:flutter_riverpod_todo_app/src/provider/auth/auth_state.dart';
import 'package:flutter_riverpod_todo_app/src/utils/constants.dart';

class AuthNotifier extends StateNotifier<AuthState> {
  String get _tag {
    return runtimeType.toString();
  }

  final AuthRepository _repository;

  AuthNotifier(this._repository) : super(const AuthState.initial()) {
    checkLoggedIn();
  }

  Future<void> checkLoggedIn() async {
    debugPrint('$_tag: checkLoggedIn ');
    try {
      final loggedIn = await _repository.loggedIn();
      debugPrint('$_tag: checkLoggedIn loggedIn $loggedIn');
      state = state.updateLoggedIn(loggedIn);
    } catch (e) {
      debugPrint('$_tag: checkLoggedIn e: $e');
      debugPrint(e.toString());
      state = state.updateLoggedIn(false);
    }
  }

  Future<bool> signUp(User user) async {
    try {
      return await _repository.signUp(user);
    } catch (e) {
      return false;
    }
  }

  Future<String> verifyLogin(String username, String password) async {
    try {
      return await _repository.verifyLogin(username, password);
    } catch (e) {
      return Constants.wentWrong;
    }
  }

  Future<void> logOut() async {
    try {
      await _repository.logOut();
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
