import 'package:flutter/material.dart';
import 'package:so_boleto/core/components/custom_state_handler/enum/message_handler.dart';
import 'package:so_boleto/core/components/svg_asset/svg_asset.dart';
import 'package:so_boleto/core/extensions/enum_extension.dart';
import 'package:so_boleto/core/theme/extensions/size_extensions.dart';
import 'package:so_boleto/core/theme/extensions/typography_extensions.dart';
import 'package:so_boleto/core/theme/settings/app_colors.dart';
import 'package:so_boleto/core/theme/settings/app_theme_values.dart';

class CustomStateHandler extends StatelessWidget {
  const CustomStateHandler(
    this.message, {
    super.key,
  });

  final MessageHandler message;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: ConstrainedBox(
        constraints: BoxConstraints(
          minHeight:
              context.height * 0.8 - MediaQuery.of(context).viewInsets.bottom,
        ),
        child: IntrinsicHeight(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgAsset(
                svg: message.enumToIcon(messageHandlerMap),
                height: 100,
                color: AppColors.grey,
              ),
              AppThemeValues.spaceVerticalLarge,
              Text(
                message.enumToText(messageHandlerMap),
                textAlign: TextAlign.center,
                style: context.textLarge.copyWith(
                  color: AppColors.grey,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
