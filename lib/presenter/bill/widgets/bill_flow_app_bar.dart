import 'package:flutter/material.dart';
import 'package:so_boleto/core/components/buttons/back_button.dart';
import 'package:so_boleto/core/components/custom_app_bar/custom_app_bar.dart';
import 'package:so_boleto/core/components/dialogs/app_dialogs.dart';
import 'package:so_boleto/core/theme/extensions/typography_extensions.dart';
import 'package:so_boleto/core/theme/settings/app_colors.dart';
import 'package:so_boleto/core/theme/settings/app_theme_values.dart';

class BillFlowAppBar extends StatefulWidget {
  const BillFlowAppBar({super.key});

  @override
  State<BillFlowAppBar> createState() => _BillFlowAppBarState();
}

class _BillFlowAppBarState extends State<BillFlowAppBar> {
  bool isReadyToDisplay = false;

  Future<void> delayAppBarActions() async {
    await Future.delayed(
      const Duration(milliseconds: 650),
      () => setState(() => isReadyToDisplay = true),
    );
  }

  @override
  void initState() {
    delayAppBarActions();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CustomAppBar(
      title: Text(
        'Nova conta',
        style: context.textRobotoSubtitleMediumToLarge,
      ),
      leadingBackButton: Visibility(
        visible: isReadyToDisplay,
        child: const CustomBackButton(),
      ),
      actions: [
        Visibility(
          visible: isReadyToDisplay,
          child: Padding(
            padding: const EdgeInsets.only(
              right: AppThemeValues.spaceSmall,
            ),
            child: DecoratedBox(
              decoration: BoxDecoration(
                border: Border.all(
                  width: 1,
                  color: AppColors.grey,
                ),
                borderRadius: BorderRadius.circular(
                  AppThemeValues.spaceSmall,
                ),
              ),
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(
                    AppThemeValues.spaceSmall,
                  ),
                ),
                child: GestureDetector(
                  onTap: () => AppDialogs.leaveBillCreation(context),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: AppThemeValues.spaceSmall,
                      vertical: AppThemeValues.spaceTiny,
                    ),
                    child: Text(
                      'Parar',
                      style: context.textSmall,
                    ),
                  ),
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
