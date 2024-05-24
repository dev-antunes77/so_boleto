import 'package:flutter/material.dart';
import 'package:so_boleto/core/components/bottom_sheet/rounded_bottom_sheet.dart';

Future<T?> showCustomBottomSheet<T>({
  required BuildContext context,
  required String title,
  required String description,
  required String confirmText,
  required String denyText,
  required VoidCallback onConfirm,
}) =>
    showModalBottomSheet<T>(
      context: context,
      useRootNavigator: true,
      builder: (context) => RoundedBottomSheet(
        title: title,
        description: description,
        confirmText: confirmText,
        denyText: denyText,
        onConfirm: onConfirm,
      ),
    );
