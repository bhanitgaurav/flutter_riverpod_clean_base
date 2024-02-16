import 'package:flutter/material.dart';
import 'package:flutter_riverpod_todo_app/src/data/datasource/auth_datasource.dart';
import 'package:flutter_riverpod_todo_app/src/data/models/user.dart';
import 'package:flutter_riverpod_todo_app/src/utils/constants.dart';

import 'auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthDatasource _datasource;

  AuthRepositoryImpl(this._datasource);

  String get _tag {
    return runtimeType.toString();
  }

  @override
  Future<void> clear() {
    // TODO: implement clear
    throw UnimplementedError();
  }

  @override
  Future<void> logOut() async {
    try {
      final loggedOut = await _datasource.loggedOut();
      debugPrint('$_tag: logOut : $loggedOut');
    } catch (e) {
      debugPrint('$_tag: logOut : $e');
    }
  }

  @override
  Future<bool> loggedIn() async {
    try {
      var loggedIn = await _datasource.loggedIn();
      debugPrint('$_tag: loggedIn:loggedIn $loggedIn');
      return loggedIn;
    } catch (e) {
      debugPrint('$_tag: loggedIn : $e');
      return false;
    }
  }

  @override
  Future<String> verifyLogin(String username, String password) async {
    try {
      final verified = await _datasource.verifyLogin(username, password);
      if (verified.isNotEmpty) {
        return verified;
      }
      final markedLogin = await _datasource.markLogin(username, password);
      debugPrint(
          '$_tag: verifyLogin:verified $verified markedLogin $markedLogin');
      return markedLogin > 0 ? "" : Constants.wentWrong;
    } catch (e) {
      debugPrint('$_tag: verifyLogin : $e');
      return Constants.wentWrong;
    }
  }

  @override
  Future<bool> signUp(User user) async {
    try {
      final userAdded = await _datasource.addUser(user);
      debugPrint('$_tag: signUp:userAdded $userAdded');
      return userAdded > 0;
    } catch (e) {
      debugPrint('$_tag: signUp : $e');
      return false;
    }
  }
}
