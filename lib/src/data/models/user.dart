import 'package:equatable/equatable.dart';
import 'package:flutter_riverpod_todo_app/src/utils/auth_table_keys.dart';

class User extends Equatable {
  final int? id;
  final String username;
  final String password;
  final String time;
  final String date;
  final bool loggedIn;

  const User(
      {this.id,
      required this.username,
      required this.password,
      required this.time,
      required this.date,
      this.loggedIn = false});

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      AuthTableKeys.id: id,
      AuthTableKeys.username: username,
      AuthTableKeys.password: password,
      AuthTableKeys.time: time,
      AuthTableKeys.date: date,
      AuthTableKeys.loggedIn: loggedIn
    };
  }

  factory User.fromJson(Map<String, dynamic> map) {
    return User(
        id: map[AuthTableKeys.id],
        username: map[AuthTableKeys.username],
        password: map[AuthTableKeys.password],
        time: map[AuthTableKeys.time],
        date: map[AuthTableKeys.date],
        loggedIn: map[AuthTableKeys.loggedIn]);
  }

  @override
  List<Object> get props {
    return [username, password, time, date, loggedIn];
  }

  User copyWith({
    int? id,
    String? username,
    String? password,
    String? time,
    String? date,
    bool? loggedIn,
  }) {
    return User(
        id: id ?? this.id,
        username: username ?? this.username,
        password: password ?? this.password,
        time: time ?? this.time,
        date: date ?? this.date,
        loggedIn: loggedIn ?? this.loggedIn);
  }
}
