import 'package:flutter/material.dart';
import 'package:so_boleto/core/components/custom_app_bar/custom_app_bar.dart';
import 'package:so_boleto/core/components/custom_pop_scope/custom_pop_scope.dart';
import 'package:so_boleto/core/theme/settings/app_colors.dart';

class BillShell extends StatelessWidget {
  const BillShell({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return CustomPopScope(
      leaveBillCreation: true,
      child: Scaffold(
        backgroundColor: AppColors.primary.withOpacity(0.5),
        appBar: customAppBar(
          context: context,
          title: 'Example 2',
          hasBackButton: true,
        ),
        body: child,
      ),
    );
  }
}
