import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_todo_app/src/screens/views/logout_view.dart';
import 'package:flutter_riverpod_todo_app/src/utils/app_keys.dart';
import 'package:go_router/go_router.dart';

class DashboardScreen extends ConsumerWidget {
  static DashboardScreen builder(
    BuildContext context,
    GoRouterState state,
  ) =>
      const DashboardScreen();

  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(AppKeys.appName),
        actions: const [LogoutView()],
      ),
      body: const Center(
        child: Text('Dashboard'),
      ),
    );
  }
}
