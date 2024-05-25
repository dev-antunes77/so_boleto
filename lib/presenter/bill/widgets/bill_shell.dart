import 'package:flutter/material.dart';
import 'package:so_boleto/core/components/custom_app_bar/custom_app_bar.dart';
import 'package:so_boleto/core/components/custom_pop_scope/custom_pop_scope.dart';
import 'package:so_boleto/core/components/custom_safe_area/custom_safe_area.dart';
import 'package:so_boleto/core/theme/extensions/size_extensions.dart';
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
      child: Scaffold(
        backgroundColor: AppColors.primary.withOpacity(0.5),
        appBar: customAppBar(
          context: context,
          title: 'Example 2',
          hasBackButton: true,
        ),
        body: CustomSafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 22),
            child: Center(
              child: Card(
                elevation: 6,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(12),
                  ),
                ),
                child: SizedBox(
                  width: context.width * 0.95,
                  height: context.height * 0.45,
                  child: child,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
