import 'dart:math';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:so_boleto/presenter/bill/pages/sections/bill_category_section.dart';
import 'package:so_boleto/presenter/bill/pages/sections/bill_check_section.dart';
import 'package:so_boleto/presenter/bill/pages/sections/bill_due_day_of_the_month_section.dart';
import 'package:so_boleto/presenter/bill/pages/sections/bill_name_section.dart';
import 'package:so_boleto/presenter/bill/pages/sections/bill_parcel_section.dart';
import 'package:so_boleto/presenter/bill/pages/sections/bill_value_section.dart';
import 'package:so_boleto/presenter/expenses/pages/expenses_page.dart';
import 'package:so_boleto/presenter/home/pages/home_page.dart';
import 'package:so_boleto/presenter/initial/app_shell.dart';
import 'package:so_boleto/presenter/initial/pages/splash_page.dart';
import 'package:so_boleto/presenter/profile/pages/profile_page.dart';

import 'routes.dart';

abstract class RoutesConfig {
  static final _rootKey = GlobalKey<NavigatorState>(debugLabel: 'Root Key');
  static final _shellKey = GlobalKey<NavigatorState>(debugLabel: 'Shell Key');

  static const Duration duration300 = Duration(milliseconds: 300);
  static const Duration duration400 = Duration(milliseconds: 400);
  static const Duration duration600 = Duration(milliseconds: 600);

  static final router = GoRouter(
    initialLocation: RelativePaths.app,
    navigatorKey: _rootKey,
    routes: [
      GoRoute(
        path: RelativePaths.app,
        parentNavigatorKey: _rootKey,
        builder: (_, __) => const SplashPage(),
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
          // ShellRoute(
          //   builder: (context, state, child) => BillShell(child: child),
          //   navigatorKey: _shellKey,
          //   routes: [
          GoRoute(
            path: RelativePaths.billName,
            parentNavigatorKey: _shellKey,
            pageBuilder: (_, state) => _getTransitionPage(
              state,
              const BillNameSection(),
              type: 'matrix',
            ),
          ),
          GoRoute(
            path: RelativePaths.billParcels,
            parentNavigatorKey: _shellKey,
            pageBuilder: (_, state) => _getTransitionPage(
              state,
              const BillParcelSection(),
              type: 'matrix',
            ),
          ),
          GoRoute(
            path: RelativePaths.billValue,
            parentNavigatorKey: _shellKey,
            pageBuilder: (_, state) => _getTransitionPage(
              state,
              const BillValueSection(),
              type: 'matrix',
            ),
          ),
          GoRoute(
            path: RelativePaths.billDueDay,
            parentNavigatorKey: _shellKey,
            pageBuilder: (_, state) => _getTransitionPage(
              state,
              const BillDueDayOfTheMonthSection(),
              type: 'matrix',
            ),
          ),
          GoRoute(
            path: RelativePaths.billCategory,
            parentNavigatorKey: _shellKey,
            pageBuilder: (_, state) => _getTransitionPage(
              state,
              const BillCategorySection(),
              type: 'matrix',
            ),
          ),
          GoRoute(
            path: RelativePaths.billCheck,
            parentNavigatorKey: _shellKey,
            pageBuilder: (_, state) => _getTransitionPage(
              state,
              const BillCheckSection(),
              type: 'matrix',
            ),
          ),
          // ],
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
        transitionDuration: const Duration(milliseconds: 600),
        reverseTransitionDuration: const Duration(milliseconds: 600),
        child: child,
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          switch (type) {
            case 'fade':
              return FadeTransition(opacity: animation, child: child);
            case 'rotation':
              return RotationTransition(turns: animation, child: child);
            case 'scale':
              return ScaleTransition(scale: animation, child: child);
            case 'slide':
              return SlideTransition(
                  position: _onSlie(animation), child: child);
            case 'matrix':
              return MatrixTransition(
                  onTransform: _onTransform,
                  animation: animation,
                  child: child);
            default:
              return FadeTransition(opacity: animation, child: child);
          }
        });
  }

  static Matrix4 _onTransform(double value) => Matrix4.identity()
    ..setEntry(3, 2, 0.0004)
    ..rotateY(pi * 2.0 * value);

  static Animation<Offset> _onSlie(Animation<double> animation) =>
      animation.drive(Tween(begin: const Offset(1.0, 0.0), end: Offset.zero));
}
