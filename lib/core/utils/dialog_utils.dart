import 'package:flutter/material.dart';
import 'package:so_boleto/core/components/bottom_sheet/rounded_bottom_sheet.dart';
import 'package:so_boleto/core/components/dialogs/base_dialog.dart';

Future<T?> showBaseDialog<T>({
  required BuildContext context,
  required String title,
  required String description,
  required VoidCallback onAcept,
  VoidCallback? onDeny,
}) =>
    showDialog<T>(
      context: context,
      builder: (context) => BaseDialog(
        title: title,
        description: description,
        onAcept: onAcept,
        onDeny: onDeny,
      ),
    );

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
