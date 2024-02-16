import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_todo_app/src/config/route/route_provider.dart';
import 'package:flutter_riverpod_todo_app/src/config/theme/app_theme.dart';

class FlutterRiverpodLoginApp extends ConsumerWidget {
  const FlutterRiverpodLoginApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final route = ref.watch(routesProvider);

    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light,
      routerConfig: route,
    );
  }
}
