import 'dart:math';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:so_boleto/domain/models/enums/page_transitions.dart';
import 'package:so_boleto/domain/models/image_model.dart';
import 'package:so_boleto/presenter/bill/pages/sections/bill_category_section.dart';
import 'package:so_boleto/presenter/bill/pages/sections/bill_check_section.dart';
import 'package:so_boleto/presenter/bill/pages/sections/bill_due_day_of_the_month_section.dart';
import 'package:so_boleto/presenter/bill/pages/sections/bill_name_section.dart';
import 'package:so_boleto/presenter/bill/pages/sections/bill_parcel_section.dart';
import 'package:so_boleto/presenter/bill/pages/sections/bill_value_section.dart';
import 'package:so_boleto/presenter/expenses/pages/expenses_page.dart';
import 'package:so_boleto/presenter/filter/pages/filter_page.dart';
import 'package:so_boleto/presenter/home/pages/home_page_current.dart';
import 'package:so_boleto/presenter/home/pages/home_page_future.dart';
import 'package:so_boleto/presenter/home/pages/home_page_past.dart';
import 'package:so_boleto/presenter/initial/app_shell.dart';
import 'package:so_boleto/presenter/initial/pages/login_page.dart';
import 'package:so_boleto/presenter/initial/pages/onboarding_page.dart';
import 'package:so_boleto/presenter/initial/pages/splash_page.dart';
import 'package:so_boleto/presenter/profile/pages/profile_page.dart';
import 'package:so_boleto/presenter/profile/pages/sections/due_day_choice.dart';
import 'package:so_boleto/presenter/profile/pages/sections/payed_tag_choice.dart';
import 'package:so_boleto/presenter/profile/pages/sections/theme_choice.dart';
import 'package:so_boleto/presenter/profile/pages/security_page.dart';
import 'package:so_boleto/presenter/profile/widgets/view_picture.dart';
import 'package:so_boleto/presenter/prompt_bills/pages/prompt_bills_edition_page.dart';
import 'package:so_boleto/presenter/prompt_bills/pages/prompt_bills_page.dart';

import 'routes.dart';

abstract class RoutesConfig {
  static final _rootKey = GlobalKey<NavigatorState>(debugLabel: 'Root Key');
  static final _shellKey = GlobalKey<NavigatorState>(debugLabel: 'Shell Key');

  static const Duration duration100 = Duration(milliseconds: 100);
  static const Duration duration200 = Duration(milliseconds: 200);
  static const Duration duration400 = Duration(milliseconds: 400);

  static final router = GoRouter(
    initialLocation: RelativePaths.app,
    navigatorKey: _rootKey,
    routes: [
      GoRoute(
        path: RelativePaths.app,
        parentNavigatorKey: _rootKey,
        builder: (_, __) => const SplashPage(),
      ),
      GoRoute(
        path: RelativePaths.login,
        parentNavigatorKey: _rootKey,
        builder: (_, __) => const LoginPage(),
      ),
      GoRoute(
        path: RelativePaths.onboarding,
        parentNavigatorKey: _rootKey,
        builder: (_, __) => const OnboardingPage(),
      ),
      ShellRoute(
        builder: (context, state, child) => AppShell(child: child),
        navigatorKey: _shellKey,
        routes: [
          GoRoute(
            path: RelativePaths.home,
            parentNavigatorKey: _shellKey,
            pageBuilder: (_, state) => _getTransitionPage(
              state,
              const HomePageCurrent(),
            ),
          ),
          GoRoute(
            path: RelativePaths.homePast,
            parentNavigatorKey: _shellKey,
            pageBuilder: (_, state) => _getTransitionPage(
              state,
              duration: duration200,
              type: PageTransitions.transitionSlide,
              const HomePagePast(),
            ),
          ),
          GoRoute(
            path: RelativePaths.homeFuture,
            parentNavigatorKey: _shellKey,
            pageBuilder: (_, state) => _getTransitionPage(
              state,
              type: PageTransitions.transitionSlide,
              duration: duration200,
              const HomePageFuture(),
            ),
          ),
          GoRoute(
            path: RelativePaths.billName,
            parentNavigatorKey: _shellKey,
            pageBuilder: (_, state) {
              final type = state.extra != null
                  ? state.extra as PageTransitions
                  : PageTransitions.transitionMatrix;
              return _getTransitionPage(
                state,
                duration: duration400,
                const BillNameSection(),
                type: type,
              );
            },
          ),
          GoRoute(
            path: RelativePaths.billParcels,
            parentNavigatorKey: _shellKey,
            pageBuilder: (_, state) => _getTransitionPage(
              state,
              const BillParcelSection(),
              duration: duration400,
              type: PageTransitions.transitionMatrix,
            ),
          ),
          GoRoute(
            path: RelativePaths.billValue,
            parentNavigatorKey: _shellKey,
            pageBuilder: (_, state) => _getTransitionPage(
              state,
              const BillValueSection(),
              duration: duration400,
              type: PageTransitions.transitionMatrix,
            ),
          ),
          GoRoute(
            path: RelativePaths.billDueDay,
            parentNavigatorKey: _shellKey,
            pageBuilder: (_, state) => _getTransitionPage(
              state,
              const BillDueDayOfTheMonthSection(),
              duration: duration400,
              type: PageTransitions.transitionMatrix,
            ),
          ),
          GoRoute(
            path: RelativePaths.billCategory,
            parentNavigatorKey: _shellKey,
            pageBuilder: (_, state) => _getTransitionPage(
              state,
              const BillCategorySection(),
              duration: duration400,
              type: PageTransitions.transitionMatrix,
            ),
          ),
          GoRoute(
            path: RelativePaths.billCheck,
            parentNavigatorKey: _shellKey,
            pageBuilder: (_, state) {
              final type = state.extra != null
                  ? state.extra as PageTransitions
                  : PageTransitions.transitionMatrix;
              return _getTransitionPage(
                state,
                const BillCheckSection(),
                type: type,
                duration: duration400,
              );
            },
          ),
          GoRoute(
            path: RelativePaths.filter,
            parentNavigatorKey: _shellKey,
            pageBuilder: (_, state) => _getTransitionPage(
              state,
              const FilterPage(),
              type: PageTransitions.transitionFade,
            ),
          ),
          GoRoute(
            path: RelativePaths.promptBills,
            parentNavigatorKey: _shellKey,
            pageBuilder: (_, state) => _getTransitionPage(
              state,
              const PromptBillsPage(),
              type: PageTransitions.transitionScale,
            ),
          ),
          GoRoute(
            path: RelativePaths.promptBillsEdition,
            parentNavigatorKey: _shellKey,
            pageBuilder: (_, state) => _getTransitionPage(
              state,
              const PromptBillsEditionPage(),
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
          GoRoute(
              path: RelativePaths.profileViewPicture,
              parentNavigatorKey: _shellKey,
              pageBuilder: (_, state) {
                final image =
                    state.extra != null ? state.extra as ImageModel : null;
                return _getTransitionPage(
                  state,
                  ViewPicture(image!),
                  duration: duration400,
                );
              }),
          GoRoute(
            path: RelativePaths.profileTheme,
            parentNavigatorKey: _shellKey,
            pageBuilder: (_, state) => _getTransitionPage(
              state,
              const ThemeChoice(),
            ),
          ),
          GoRoute(
            path: RelativePaths.profileDueDay,
            parentNavigatorKey: _shellKey,
            pageBuilder: (_, state) => _getTransitionPage(
              state,
              const DueDayChoice(),
            ),
          ),
          GoRoute(
            path: RelativePaths.profilePayedTag,
            parentNavigatorKey: _shellKey,
            pageBuilder: (_, state) => _getTransitionPage(
              state,
              const PayedTagChoice(),
            ),
          ),
          GoRoute(
            path: RelativePaths.profileSecurity,
            parentNavigatorKey: _shellKey,
            pageBuilder: (_, state) => _getTransitionPage(
              state,
              const SecurityPage(),
            ),
          ),
        ],
      ),
    ],
  );

  static CustomTransitionPage _getTransitionPage(
    GoRouterState state,
    Widget child, {
    PageTransitions type = PageTransitions.transitionFade,
    Duration duration = duration100,
  }) {
    return CustomTransitionPage(
      key: state.pageKey,
      transitionDuration: duration,
      reverseTransitionDuration: duration,
      child: child,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        switch (type) {
          case PageTransitions.transitionFade:
            return FadeTransition(opacity: animation, child: child);
          case PageTransitions.transitionRotation:
            return RotationTransition(turns: animation, child: child);
          case PageTransitions.transitionScale:
            return ScaleTransition(scale: animation, child: child);
          case PageTransitions.transitionSlide:
            return SlideTransition(position: _onSlie(animation), child: child);
          case PageTransitions.transitionMatrix:
            return MatrixTransition(
                onTransform: _onTransform, animation: animation, child: child);
          default:
            return FadeTransition(opacity: animation, child: child);
        }
      },
    );
  }

  static Matrix4 _onTransform(double value) => Matrix4.identity()
    ..setEntry(3, 2, 0.0004)
    ..rotateY(pi * 2.0 * value);

  static Animation<Offset> _onSlie(Animation<double> animation) =>
      animation.drive(Tween(begin: const Offset(1.0, 0.0), end: Offset.zero));
}
