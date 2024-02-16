import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_todo_app/src/config/route/my_routes.dart';
import 'package:flutter_riverpod_todo_app/src/config/route/route_location.dart';
import 'package:flutter_riverpod_todo_app/src/provider/auth/auth_provider.dart';
import 'package:flutter_riverpod_todo_app/src/utils/extensions.dart';

class LogoutView extends ConsumerStatefulWidget {
  const LogoutView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _LogoutViewState();
}

class _LogoutViewState extends ConsumerState<LogoutView> {
  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: logout,
      icon: const Icon(Icons.logout),
    );
  }

  void logout() {
    ref.read(authProvider.notifier).logOut().then((value) {
      context.navigator
          .pushReplacement(MyRoute.generateRoute(RouteLocation.login));
    });
  }
}
