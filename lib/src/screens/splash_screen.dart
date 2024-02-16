import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_todo_app/src/config/route/route_location.dart';
import 'package:flutter_riverpod_todo_app/src/provider/auth/auth_provider.dart';
import 'package:flutter_riverpod_todo_app/src/utils/extensions.dart';
import 'package:flutter_riverpod_todo_app/src/widgets/app_background.dart';
import 'package:flutter_riverpod_todo_app/src/widgets/display_white_text.dart';
import 'package:go_router/go_router.dart';

class SplashScreen extends ConsumerWidget {
  String get _tag {
    return runtimeType.toString();
  }

  static SplashScreen builder(
    BuildContext context,
    GoRouterState state,
  ) =>
      const SplashScreen();

  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final deviceSize = context.deviceSize;
    final loggedIn = ref.watch(authProvider);
    watchLoggedIn(loggedIn.loggedIn, context);
    return AppBackground(
      headerHeight: deviceSize.height,
      header: const SingleChildScrollView(
        physics: AlwaysScrollableScrollPhysics(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            DisplayWhiteText(text: 'Splash', size: 40),
          ],
        ),
      ),
    );
  }

  void watchLoggedIn(bool? loggedIn, BuildContext context) {
    debugPrint('$_tag:watchLoggedIn : before 2 seconds : $loggedIn');
    if (loggedIn == null) {
      return;
    }
    if (loggedIn) {
      Future.delayed(const Duration(seconds: 2)).then((value) {
        context.push(RouteLocation.dashboard);
      });
    } else {
      Future.delayed(const Duration(seconds: 2)).then((value) {
        context.push(RouteLocation.login);
      });
    }
  }
}
