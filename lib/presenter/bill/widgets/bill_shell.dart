import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:so_boleto/core/components/custom_app_bar/custom_app_bar.dart';
import 'package:so_boleto/core/components/custom_pop_scope/custom_pop_scope.dart';
import 'package:so_boleto/core/components/dialogs/app_dialogs.dart';
import 'package:so_boleto/core/routes/routes.dart';
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
      canPop: false,
      child: Scaffold(
        backgroundColor: AppColors.primary.withOpacity(0.5),
        appBar: customAppBar(
          context: context,
          title: 'Example 2',
          leadingBackButton: context.currentRoute == Routes.billCheck
              ? const SizedBox.shrink()
              : IconButton(
                  onPressed: () => _onLeadingButtonPressed(context),
                  icon: const Icon(Icons.arrow_back),
                ),
        ),
        body: child,
      ),
    );
  }

  void _onLeadingButtonPressed(BuildContext context) {
    if (context.canPop()) {
      GoRouter.of(context).pop();
    } else {
      AppDialogs.leaveBillCreation(context);
    }
  }
}
