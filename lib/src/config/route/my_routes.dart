import 'package:flutter/material.dart';
import 'package:flutter_riverpod_todo_app/src/config/route/route_location.dart';
import 'package:flutter_riverpod_todo_app/src/screens/dashboard_screen.dart';
import 'package:flutter_riverpod_todo_app/src/screens/login_screen.dart';
import 'package:flutter_riverpod_todo_app/src/screens/signup_screen.dart';
import 'package:flutter_riverpod_todo_app/src/screens/splash_screen.dart';

class MyRoute {
  static MaterialPageRoute generateRoute(String route) {
    if (route == RouteLocation.splash) {
      return MaterialPageRoute(builder: (_) => const SplashScreen());
    }
    if (route == RouteLocation.login) {
      return MaterialPageRoute(builder: (_) => const LoginScreen());
    }
    if (route == RouteLocation.signup) {
      return MaterialPageRoute(builder: (_) => const SignUpScreen());
    }
    if (route == RouteLocation.dashboard) {
      return MaterialPageRoute(builder: (_) => const DashboardScreen());
    }
    return _errorRoute(route);
  }

  static MaterialPageRoute _errorRoute(String? route) {
    return MaterialPageRoute(
        builder: (_) => Scaffold(
              body: Center(
                  child: Text(
                'No route defined for $route',
              )),
            ));
  }
}
