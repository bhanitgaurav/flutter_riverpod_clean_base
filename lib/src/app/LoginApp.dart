import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_todo_app/src/config/theme/app_theme.dart';
import 'package:flutter_riverpod_todo_app/src/screens/splash_screen.dart';
import 'package:flutter_riverpod_todo_app/src/utils/app_keys.dart';

class FlutterRiverpodLoginApp extends ConsumerWidget {
  const FlutterRiverpodLoginApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
      title: AppKeys.appName,
      theme: AppTheme.light,
      home: const SplashScreen(),
    );
  }
}
