import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:so_boleto/presenter/bill/pages/bill_page.dart';
import 'package:so_boleto/presenter/bill/widgets/bill_shell.dart';
import 'package:so_boleto/presenter/expenses/pages/expenses_page.dart';
import 'package:so_boleto/presenter/home/pages/home_page.dart';
import 'package:so_boleto/presenter/initial/app_shell.dart';
import 'package:so_boleto/presenter/initial/pages/splash_page.dart';
import 'package:so_boleto/presenter/profile/pages/profile_page.dart';

import 'routes.dart';

abstract class RoutesConfig {
  static final _rootKey = GlobalKey<NavigatorState>(debugLabel: 'Root Key');
  static final _shellKey = GlobalKey<NavigatorState>(debugLabel: 'Shell Key');
  static final _billKey = GlobalKey<NavigatorState>(debugLabel: 'Bill Key');

  static final router = GoRouter(
    initialLocation: RelativePaths.app,
    navigatorKey: _rootKey,
    routes: [
      GoRoute(
        path: RelativePaths.app,
        parentNavigatorKey: _rootKey,
        builder: (_, __) => const SplashPage(),
      ),

      ShellRoute(
        navigatorKey: _billKey,
        builder: (context, state, child) => BillShell(
          child: child,
        ),
        routes: [
          GoRoute(
            path: RelativePaths.bill,
            parentNavigatorKey: _billKey,
            builder: (_, state) => const BillPage(),
          ),
        ],
      ),
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
        builder: (context, state, child) => AppShell(child: child),
        navigatorKey: _shellKey,
        routes: [
          GoRoute(
            path: RelativePaths.home,
            parentNavigatorKey: _shellKey,
            pageBuilder: (_, state) => _getTransitionPage(
              state,
              const HomePage(),
            ),
          ),
          GoRoute(
            path: RelativePaths.expenses,
            parentNavigatorKey: _shellKey,
            pageBuilder: (_, state) => _getTransitionPage(
              state,
              const ExpensesPage(),
            ),
          ),
          GoRoute(
            path: RelativePaths.profile,
            parentNavigatorKey: _shellKey,
            pageBuilder: (_, state) => _getTransitionPage(
              state,
              const ProfilePage(),
            ),
          ),
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

//   static CustomTransitionPage<Widget> _fadeTransition(
//     GoRouterState state,
//     Widget child,
//   ) {
//     final tween = Tween(begin: 0.0, end: 1.0).chain(
//       CurveTween(curve: Curves.ease),
//     );

//     return CustomTransitionPage(
//       key: state.pageKey,
//       child: child,
//       transitionDuration: const Duration(milliseconds: 200),
//       transitionsBuilder: (context, animation, secondaryAnimation, child) {
//         return FadeTransition(
//           opacity: animation.drive(tween),
//           child: child,
//         );
//       },
//     );
//   }
// }

  static CustomTransitionPage _getTransitionPage(
    GoRouterState state,
    Widget child, {
    String type = 'fade',
  }) {
    return CustomTransitionPage(
        key: state.pageKey,
        child: child,
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          switch (type) {
            case 'fade':
              return FadeTransition(opacity: animation, child: child);
            case 'rotation':
              return RotationTransition(turns: animation, child: child);
            case 'size':
              return SizeTransition(sizeFactor: animation, child: child);
            case 'scale':
              return ScaleTransition(scale: animation, child: child);
            default:
              return FadeTransition(opacity: animation, child: child);
          }
        });
  }
}
