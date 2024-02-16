import 'package:flutter/material.dart';
import 'package:flutter_riverpod_todo_app/src/data/models/user.dart';
import 'package:flutter_riverpod_todo_app/src/utils/app_keys.dart';
import 'package:flutter_riverpod_todo_app/src/utils/auth_table_keys.dart';
import 'package:flutter_riverpod_todo_app/src/utils/constants.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class AuthDatasource {
  String get _tag {
    return runtimeType.toString();
  }

  static final AuthDatasource _instance = AuthDatasource._();

  factory AuthDatasource() => _instance;

  AuthDatasource._() {
    _initDb();
  }

  static Database? _database;

  Future<Database> get database async {
    _database ??= await _initDb();
    return _database!;
  }

  Future<Database> _initDb() async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, 'user.db');

    return await openDatabase(
      path,
      version: 1,
      onCreate: _onCreate,
    );
  }

  void _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE ${AppKeys.userTable} (
        ${AuthTableKeys.id} INTEGER PRIMARY KEY AUTOINCREMENT,
        ${AuthTableKeys.username} TEXT,
        ${AuthTableKeys.password} TEXT,
        ${AuthTableKeys.loggedIn} BOOLEAN,
        ${AuthTableKeys.date} TEXT,
        ${AuthTableKeys.time} TEXT
      )
    ''');
  }

  Future<int> addUser(User user) async {
    final db = await database;
    return db.transaction((txn) async {
      return await txn.insert(
        AppKeys.userTable,
        user.toJson(),
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
    });
  }

  Future<bool> loggedIn() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query(AppKeys.userTable,
        where: '${AuthTableKeys.loggedIn} = ?', whereArgs: ['1'], limit: 1);
    debugPrint('$_tag: maps:loggedIn $maps');
    return maps.isNotEmpty;
  }

  Future<String> verifyLogin(String username, String password) async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query(AppKeys.userTable,
        where:
            '${AuthTableKeys.username} = ? AND ${AuthTableKeys.password} = ?',
        whereArgs: [username, password],
        limit: 1);
    debugPrint('$_tag: maps:loggedIn $maps');
    return maps.isNotEmpty ? "" : Constants.invalidCredentials;
  }

  Future<int> markLogin(String username, String password) async {
    final db = await database;
    return db.transaction((txn) async {
      final update = await txn.update(
        AppKeys.userTable,
        {AuthTableKeys.loggedIn: 1},
        where:
            '${AuthTableKeys.username} = ? AND ${AuthTableKeys.password} = ?',
        whereArgs: [username, password],
      );
      debugPrint('$_tag: update:markLogin $update');
      return update;
    });
  }

  Future<int> loggedOut() async {
    final db = await database;
    return db.transaction((txn) async {
      final logout = await txn.update(
        AppKeys.userTable,
        {AuthTableKeys.loggedIn: 0},
      );
      debugPrint('$_tag: update:loggedOut $logout)');
      return logout;
    });
  }
}
