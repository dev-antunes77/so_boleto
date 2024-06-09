import 'package:flutter/material.dart';
import 'package:so_boleto/core/theme/extensions/size_extensions.dart';
import 'package:so_boleto/core/theme/settings/app_theme_values.dart';

class BillShell extends StatelessWidget {
  const BillShell({
    super.key,
    required this.child,
    this.height,
  });

  final Widget child;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(
          left: AppThemeValues.spaceXLarge,
          right: AppThemeValues.spaceXLarge,
          top: AppThemeValues.spaceXLarge,
        ),
        child: Align(
          alignment: Alignment.topCenter,
          child: Card(
            elevation: 6,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(12),
              ),
            ),
            child: SizedBox(
              width: context.width * 0.95,
              height: height ?? context.height * 0.45,
              child: child,
            ),
          ),
        ),
      ),
    );
  }
}
