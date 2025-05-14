import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../features/home/ui/home_page.dart';

final navigatorKey = GlobalKey<NavigatorState>();

class AppRouter {
  final GoRouter setRouter = GoRouter(
    errorBuilder: (context, state) {
      // todo : make error page
      return Container();
    },
    initialLocation: '/',
    navigatorKey: navigatorKey,
    routes: <RouteBase>[
      GoRoute(
          path: '/',
          builder: (BuildContext context, GoRouterState state) {
            return HomePage();
          },
          routes: []),
    ],
  );
}
