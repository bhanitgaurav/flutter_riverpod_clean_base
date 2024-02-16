import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_todo_app/src/data/datasource/auth_datasource_provider.dart';
import 'package:flutter_riverpod_todo_app/src/data/repository/auth_repository.dart';
import 'package:flutter_riverpod_todo_app/src/data/repository/auth_repository_impl.dart';

final authRepositoryProvider = Provider<AuthRepository>((ref) {
  final datasource = ref.read(authDatasourceProvider);
  return AuthRepositoryImpl(datasource);
});
