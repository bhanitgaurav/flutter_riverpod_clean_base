import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_todo_app/src/data/repository/auth_repository_provider.dart';
import 'package:flutter_riverpod_todo_app/src/provider/auth/auth_notifier.dart';
import 'package:flutter_riverpod_todo_app/src/provider/auth/auth_state.dart';

final authProvider = StateNotifierProvider<AuthNotifier, AuthState>((ref) {
  final repository = ref.watch(authRepositoryProvider);
  return AuthNotifier(repository);
});
