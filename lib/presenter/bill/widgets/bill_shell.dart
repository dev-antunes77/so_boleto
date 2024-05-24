import 'package:flutter/material.dart';
import 'package:so_boleto/core/components/custom_app_bar/custom_app_bar.dart';
import 'package:so_boleto/core/components/custom_pop_scope/custom_pop_scope.dart';
import 'package:so_boleto/core/components/custom_safe_area/custom_safe_area.dart';

class BillShell extends StatelessWidget {
  const BillShell({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return CustomPopScope(
      child: Scaffold(
        appBar: customAppBar(
          context: context,
          title: 'Example 2',
          hasBackButton: true,
        ),
        body: CustomSafeArea(
          child: child,
        ),
      ),
    );
  }
}
