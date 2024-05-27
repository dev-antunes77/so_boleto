import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:so_boleto/core/components/custom_app_bar/custom_app_bar.dart';
import 'package:so_boleto/core/components/custom_pop_scope/custom_pop_scope.dart';
import 'package:so_boleto/core/components/custom_safe_area/custom_safe_area.dart';
import 'package:so_boleto/core/components/dialogs/app_dialogs.dart';
import 'package:so_boleto/core/routes/go_router_extensions.dart';
import 'package:so_boleto/core/routes/routes.dart';
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
      leaveBillCreation: true,
      canPop: false,
      child: Scaffold(
        backgroundColor: AppColors.primary.withOpacity(0.5),
        appBar: customAppBar(
            context: context,
            title: 'Example 2',
            leadingBackButton:
                GoRouter.of(context).location() == Routes.billCheck
                    ? const SizedBox.shrink()
                    : IconButton(
                        onPressed: () {
                          if (context.canPop()) {
                            GoRouter.of(context).pop();
                          } else {
                            AppDialogs.leaveBillCreation(context);
                          }
                        },
                        icon: const Icon(Icons.arrow_back),
                      )),
        body: CustomSafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 22),
            child: Center(
              child: Card(
                elevation: 6,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(12),
                  ),
                ),
                child: SizedBox(
                  width: context.width * 0.95,
                  height: context.height * 0.5,
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
