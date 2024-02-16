import 'package:flutter_riverpod_todo_app/src/config/route/route_location.dart';
import 'package:flutter_riverpod_todo_app/src/config/route/route_provider.dart';
import 'package:flutter_riverpod_todo_app/src/screens/dashboard_screen.dart';
import 'package:flutter_riverpod_todo_app/src/screens/login_screen.dart';
import 'package:flutter_riverpod_todo_app/src/screens/signup_screen.dart';
import 'package:flutter_riverpod_todo_app/src/screens/splash_screen.dart';
import 'package:go_router/go_router.dart';

final appRoutes = [
  GoRoute(
    path: RouteLocation.splash,
    parentNavigatorKey: navigationKey,
    builder: SplashScreen.builder,
  ),
  GoRoute(
    path: RouteLocation.signup,
    parentNavigatorKey: navigationKey,
    builder: SignUpScreen.builder,
  ),
  GoRoute(
    path: RouteLocation.login,
    parentNavigatorKey: navigationKey,
    builder: LoginScreen.builder,
  ),
  GoRoute(
    path: RouteLocation.dashboard,
    parentNavigatorKey: navigationKey,
    builder: DashboardScreen.builder,
  ),
];
