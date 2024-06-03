import 'package:flutter/material.dart';
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
