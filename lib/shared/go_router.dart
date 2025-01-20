import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:silvers_scaffold/pages/home_page.dart';
import 'package:silvers_scaffold/pages/main_scaffold_page.dart';
import 'package:silvers_scaffold/pages/notification_page.dart';
import 'package:silvers_scaffold/pages/search_page.dart';

final goRouterProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    initialLocation: '/home',
    routes: [
      ShellRoute(

          builder: (context, state, child) => MainScaffoldPage(child: child,),
          routes: [

        GoRoute(
          path: '/home',
          name: 'home',
          builder: (context, state) {
            final  scrollController = state.extra as ScrollController?;
            return HomePage(scrollController: scrollController, );
          },
        ),
        GoRoute(
          path: '/search',
          name: 'search',
          builder: (context, state) {
            final  scrollController = state.extra as ScrollController?;
            return SearchPage(scrollController: scrollController, );
          },
        ),
        GoRoute(
          path: '/notification',
          name: 'notification',
          builder: (context, state) {
            return const NotificationPage( );
          },
        ),
      ]),
      // GoRoute(
      //     path: '/home',
      //   name: 'home',
      //   builder: (context, state) {
      //       final  scrollController = state.extra as ScrollController;
      //     return HomePage(scrollController: scrollController, );
      //   },
      // ),
      //
      // GoRoute(
      //   path: '/home',
      //   name: 'home',
      //   builder: (context, state) {
      //     final  scrollController = state.extra as ScrollController;
      //     return HomePage(scrollController: scrollController, );
      //   },
      // ),
      // GoRoute(
      //   path: '/search',
      //   name: 'search',
      //   builder: (context, state) {
      //     final  scrollController = state.extra as ScrollController;
      //     return SearchPage(scrollController: scrollController, );
      //   },
      // ),
      // GoRoute(
      //   path: '/notification',
      //   name: 'notification',
      //   builder: (context, state) {
      //     return const NotificationPage( );
      //   },
      // ),

    ]
  );
});
