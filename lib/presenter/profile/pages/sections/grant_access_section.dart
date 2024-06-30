import 'package:flutter/material.dart';
import 'package:so_boleto/core/components/buttons/rectangular_button.dart';
import 'package:so_boleto/core/components/custom_text_form_filed/custom_text_form_filed.dart';
import 'package:so_boleto/core/components/svg_asset/svg_asset.dart';
import 'package:so_boleto/core/theme/extensions/typography_extensions.dart';
import 'package:so_boleto/core/theme/settings/app_icons.dart';
import 'package:so_boleto/core/theme/settings/app_theme_values.dart';
import 'package:so_boleto/core/theme/settings/theme_colors.dart';
import 'package:so_boleto/core/utils/form_validator.dart';

class GrantAccessSection extends StatefulWidget {
  const GrantAccessSection({
    super.key,
    required this.themeColors,
    required this.onConfirm,
  });

  final ThemeColors themeColors;
  final Function(String?) onConfirm;

  @override
  State<GrantAccessSection> createState() => _GrantAccessSectionState();
}

class _GrantAccessSectionState extends State<GrantAccessSection> {
  bool _isPasswordVisible = false;
  final TextEditingController _controller = TextEditingController();

  void _togglePasswordVisibility() =>
      setState(() => _isPasswordVisible = !_isPasswordVisible);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent.withOpacity(0.5),
      child: Padding(
        padding: const EdgeInsets.all(AppThemeValues.spaceMedium),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            AppThemeValues.spaceVerticalColossal,
            Card(
              elevation: 12,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AppThemeValues.spaceVerticalMassive,
                  Text(
                    'Use sua senha para continuar',
                    style: context.textRobotoSubtitleMedium,
                  ),
                  AppThemeValues.spaceVerticalMedium,
                  Padding(
                    padding: const EdgeInsets.all(AppThemeValues.spaceMedium),
                    child: CustomTextFormField(
                      controller: _controller,
                      labelText: 'Senha',
                      obscureText: !_isPasswordVisible,
                      textInputAction: TextInputAction.done,
                      validator: FormValidator.validatePassword,
                      icon: SvgAsset(
                        svg: AppIcons.password,
                        height: 22,
                        color: widget.themeColors.icon,
                      ),
                      suffixIcon: IconButton(
                        icon: _isPasswordVisible
                            ? Icon(
                                Icons.visibility_off,
                                color: widget.themeColors.icon,
                              )
                            : Icon(
                                Icons.visibility,
                                color: widget.themeColors.icon,
                              ),
                        onPressed: _togglePasswordVisibility,
                      ),
                      onFieldSubmitted: widget.onConfirm,
                    ),
                  ),
                  RectangularButton(
                    onTap: () => widget.onConfirm(_controller.text),
                    isValid: true,
                    label: 'Confirmar',
                  ),
                  AppThemeValues.spaceVerticalMedium,
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
