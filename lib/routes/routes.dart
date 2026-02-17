import 'package:flutter/material.dart';

import 'routes_constants.dart';

class Routes {
  static Route onGenerateRoute(RouteSettings? settings) {
    // final Object? args;
    // args = settings?.arguments;

    switch (settings?.name) {
      case AppRoutes.splashRoutes:
        return MaterialPageRoute(builder: (_) => const SizedBox());

      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(child: Text('No route defined for ${settings?.name}')),
          ),
        );
    }
  }
}
