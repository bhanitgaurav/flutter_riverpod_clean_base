import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_todo_app/src/data/datasource/auth_datasource.dart';

final authDatasourceProvider = Provider<AuthDatasource>((ref) {
  return AuthDatasource();
});
