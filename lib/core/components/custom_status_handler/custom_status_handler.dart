import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:so_boleto/core/components/buttons/rectangular_button.dart';
import 'package:so_boleto/core/components/svg_asset/svg_asset.dart';
import 'package:so_boleto/core/l10n/generated/l10n.dart';
import 'package:so_boleto/core/theme/cubit/theme_cubit.dart';
import 'package:so_boleto/core/theme/extensions/size_extensions.dart';
import 'package:so_boleto/core/theme/extensions/typography_extensions.dart';
import 'package:so_boleto/core/theme/settings/app_theme_values.dart';
import 'package:so_boleto/domain/models/enums/page_response_handler.dart';

class CustomStatusHandler extends StatelessWidget {
  const CustomStatusHandler(
    this.message, {
    super.key,
  });

  final PageResponseHandler message;

  @override
  Widget build(BuildContext context) {
    final color = context.read<ThemeCubit>().state.selectedColors.text;
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
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: AppThemeValues.spaceXLarge,
                ),
                child: Text(
                  message.getTextResponse(),
                  textAlign: TextAlign.center,
                  style: context.textLarge.copyWith(
                    color: color,
                  ),
                ),
              ),
              AppThemeValues.spaceVerticalLarge,
              SvgAsset(
                svg: message.value,
                height: context.height * 0.2,
                isMulticolor: true,
              ),
              AppThemeValues.spaceVerticalLarge,
              if (message == PageResponseHandler.error)
                RectangularButton(
                  label: AppLocalizations.current.tryAgain,
                  isValid: true,
                  onTap: () {},
                ),
            ],
          ),
        ),
      ),
    );
  }
}
