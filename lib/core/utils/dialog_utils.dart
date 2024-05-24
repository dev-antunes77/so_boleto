import 'package:flutter/material.dart';
import 'package:so_boleto/core/components/dialogs/choice_dialogs.dart';

Future<T?> showBaseDialog<T>({
  required BuildContext context,
  double? width,
  required String title,
  required String description,
  required VoidCallback onAcept,
}) =>
    showDialog<T>(
      context: context,
      builder: (context) => ChoiceDialog(
        width: width,
        title: title,
        description: description,
        onAcept: onAcept,
      ),
    );
