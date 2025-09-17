import 'package:eshop/config/router/router_transition.dart';
import 'package:eshop/config/router/routes.dart';
import 'package:eshop/features/auth/modules/login/login_view.dart';
import 'package:flutter/material.dart';

class AppRouter {
  Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.login:
        return RouterTransition.build(
          const LoginView(),
        );
      default:
        return RouterTransition.build(
          Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          ),
        );
    }
  }
}
