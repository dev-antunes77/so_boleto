import 'package:flutter/material.dart';
import 'package:so_boleto/core/components/dialogs/base_dialog.dart';

Future<T?> showBaseDialog<T>({
  required BuildContext context,
  required String title,
  required String description,
  VoidCallback? onAcept,
  VoidCallback? onDeny,
  String? onConfirmText,
  String? onDenyText,
}) =>
    showDialog<T>(
      context: context,
      builder: (context) => BaseDialog(
        title: title,
        description: description,
        onAcept: onAcept,
        onDeny: onDeny,
        onConfirmText: onConfirmText,
        onDenyText: onDenyText,
      ),
    );
