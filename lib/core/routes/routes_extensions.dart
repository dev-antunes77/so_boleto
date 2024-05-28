import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:so_boleto/core/components/custom_snack_bar/custom_snack_bar.dart';
import 'package:so_boleto/core/utils/dialog_utils.dart';
import 'package:so_boleto/core/utils/log_utils.dart';

extension RoutesExtensions on BuildContext {
  void navigateTo(String route) {
    Log.navigation('Navigating to $route');
    go(route);
  }

  void pushTo(String route, {Object? params}) {
    Log.navigation('Navigating to pushed route $route with params: $params');
    push(route, extra: params);
  }

  void pop(bool bool) {
    Log.navigation('Route poped');
    GoRouter.of(this).pop();
  }

  String get currentRoute {
    final RouteMatch lastMatch =
        GoRouter.of(this).routerDelegate.currentConfiguration.last;
    final RouteMatchList matchList = lastMatch is ImperativeRouteMatch
        ? lastMatch.matches
        : GoRouter.of(this).routerDelegate.currentConfiguration;
    return matchList.uri.toString();
  }

  void showSnackBar(
    String title, {
    VoidCallback? action,
  }) {
    Log.navigation('''Showing snack bar: 
    title: $title,
    ''');
    getCustomSnackBar(this, title: title, action: action);
  }

  Future<dynamic> showDialog({
    required String title,
    required String description,
    required VoidCallback onAcept,
    VoidCallback? onDeny,
  }) {
    Log.navigation('''Showing dialog: 
    child: $title : $description,
    ''');
    return showBaseDialog<dynamic>(
      context: this,
      onAcept: onAcept,
      onDeny: onDeny,
      title: title,
      description: description,
    );
  }

  // Future<T?> showBottomSheet<T>({
  //   required String title,
  //   required String description,
  //   required String confirmText,
  //   required String denyText,
  //   required VoidCallback onConfirm,
  // }) {
  //   Log.navigation('''Showing bottom sheet:
  //   title: $title,
  //   description: $description,
  //   ''');
  //   return showCustomBottomSheet<T>(
  //     context: this,
  //     title: title,
  //     description: description,
  //     confirmText: confirmText,
  //     denyText: denyText,
  //     onConfirm: onConfirm,
  //   );
  // }
}
