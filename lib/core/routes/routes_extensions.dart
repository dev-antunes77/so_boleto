import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
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

  void pop() {
    Log.navigation('Route poped');
    GoRouter.of(this).pop();
  }

  void showSnackBar(
    String title, {
    bool hasBottomPlayer = true,
  }) {
    Log.navigation('''Showing snack bar: 
    title: $title,
    hasBottomPlayer: $hasBottomPlayer,
    ''');
    // getCustomSnackBar(
    //   this,
    //   title: title,
    //   hasBottomPlayer: hasBottomPlayer,
    // );
  }

  void showDialog({
    double? width,
    required String title,
    required String description,
  }) {
    Log.navigation('''Showing dialog: 
    child: $title : $description,
    ''');
    // showBaseDialog(
    //   context: this,
    //   width: width,
    //   title: title,
    //   description: description,
    // );
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
