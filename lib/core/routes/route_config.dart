import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:so_boleto/presenter/home/pages/home_page.dart';
import 'package:so_boleto/presenter/initial/app_shell.dart';
import 'package:so_boleto/presenter/initial/pages/splash_page.dart';

import 'routes.dart';

abstract class RoutesConfig {
  static final _rootKey = GlobalKey<NavigatorState>(debugLabel: 'Root Key');
  static final _shellKey = GlobalKey<NavigatorState>(debugLabel: 'Shell Key');
  // static final _loginKey = GlobalKey<NavigatorState>(debugLabel: 'Login Key');

  static final router = GoRouter(
    initialLocation: RelativePaths.app,
    navigatorKey: _rootKey,
    routes: [
      GoRoute(
        path: RelativePaths.app,
        parentNavigatorKey: _rootKey,
        builder: (_, __) => const SplashPage(),
      ),
      // GoRoute(
      //   path: RelativePaths.update,
      //   parentNavigatorKey: _rootKey,
      //   pageBuilder: (_, state) => _fadeTransition(state, const AppShell()),
      // ),
      // ShellRoute(
      //   navigatorKey: _loginKey,
      //   builder: (context, state, child) => LoginShell(
      //     hasBackButton: state.fullPath == RelativePaths.login ? false : true,
      //     child: child,
      //   ),
      //   routes: [
      //     GoRoute(
      //       path: RelativePaths.login,
      //       parentNavigatorKey: _loginKey,
      //       pageBuilder: (_, state) =>
      //           _fadeTransition(state, const LoginPage()),
      //     ),
      //     GoRoute(
      //       path: RelativePaths.msisdn,
      //       parentNavigatorKey: _loginKey,
      //       pageBuilder: (_, state) =>
      //           _fadeTransition(state, const LoginFormMsisdn()),
      //     ),
      //     GoRoute(
      //       path: RelativePaths.pinCode,
      //       parentNavigatorKey: _loginKey,
      //       pageBuilder: (_, state) => _fadeTransition(
      //         state,
      //         LoginFormPinCode(
      //           loginCubit: state.extra as LoginCubit,
      //         ),
      //       ),
      //     ),
      //   ],
      // ),
      ShellRoute(
        builder: (context, state, child) => const AppShell(),
        navigatorKey: _shellKey,
        routes: [
          GoRoute(
            path: RelativePaths.radios,
            parentNavigatorKey: _shellKey,
            pageBuilder: (_, state) => _fadeTransition(
              state,
              const HomePage(),
            ),
          ),
          // GoRoute(
          //   path: RelativePaths.favorites,
          //   parentNavigatorKey: _shellKey,
          //   pageBuilder: (_, state) =>
          //       _fadeTransition(state, const FavoriteRadiosPage()),
          // ),
          // GoRoute(
          //   path: RelativePaths.profile,
          //   parentNavigatorKey: _shellKey,
          //   pageBuilder: (_, state) =>
          //       _fadeTransition(state, const ProfilePage()),
          //   routes: [
          //     GoRoute(
          //       path: RelativePaths.account,
          //       parentNavigatorKey: _shellKey,
          //       pageBuilder: (_, state) => _fadeTransition(
          //           state, MyAccountPage(user: state.extra as User?)),
          //     ),
          //     GoRoute(
          //       path: RelativePaths.help,
          //       parentNavigatorKey: _shellKey,
          //       pageBuilder: (_, state) =>
          //           _fadeTransition(state, const HelpPage()),
          //     ),
          //     GoRoute(
          //       path: RelativePaths.about,
          //       parentNavigatorKey: _shellKey,
          //       pageBuilder: (_, state) =>
          //           _fadeTransition(state, const AboutPage()),
          //     ),
          //     GoRoute(
          //       path: RelativePaths.editorial,
          //       parentNavigatorKey: _shellKey,
          //       pageBuilder: (_, state) => _fadeTransition(
          //           state, EditorialPage(type: state.extra as EditorialType)),
          //     ),
          //     GoRoute(
          //       path: RelativePaths.policies,
          //       parentNavigatorKey: _shellKey,
          //       pageBuilder: (_, state) =>
          //           _fadeTransition(state, const PoliciesPage()),
          //     ),
          //     GoRoute(
          //       path: RelativePaths.requestData,
          //       parentNavigatorKey: _shellKey,
          //       pageBuilder: (_, state) =>
          //           _fadeTransition(state, RequestDataPage()),
          //     ),
          //   ],
          // ),
        ],
      ),
    ],
  );

  static CustomTransitionPage<Widget> _fadeTransition(
    GoRouterState state,
    Widget child,
  ) {
    final tween = Tween(begin: 0.0, end: 1.0).chain(
      CurveTween(curve: Curves.ease),
    );

    return CustomTransitionPage(
      key: state.pageKey,
      child: child,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return FadeTransition(
          opacity: animation.drive(tween),
          child: child,
        );
      },
    );
  }
}
