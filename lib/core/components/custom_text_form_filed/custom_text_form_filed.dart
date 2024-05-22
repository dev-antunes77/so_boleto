import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:so_boleto/core/theme/extensions/typography_extensions.dart';
import 'package:so_boleto/core/theme/settings/app_colors.dart';
import 'package:so_boleto/core/theme/settings/app_theme_values.dart';

class CustomTextFormField extends StatefulWidget {
  const CustomTextFormField({
    super.key,
    this.keyboardType = TextInputType.text,
    this.textInputAction = TextInputAction.next,
    this.textCapitalization = TextCapitalization.sentences,
    this.labelText,
    this.hintText = '',
    this.initialValue,
    this.validator,
    this.controller,
    this.onChanged,
    this.inputFormatters,
    this.onTap,
    this.onEditingComplete,
    this.readOnly = false,
    this.maxLines = 1,
    this.obscureText = false,
    this.focusNode,
    this.onFieldSubmitted,
  });

  final TextInputType keyboardType;
  final TextInputAction textInputAction;
  final String? labelText;
  final String? hintText;
  final int maxLines;
  final String? initialValue;
  final bool readOnly;
  final bool obscureText;
  final List<TextInputFormatter>? inputFormatters;
  final String? Function(String?)? validator;
  final TextEditingController? controller;
  final TextCapitalization textCapitalization;
  final FocusNode? focusNode;
  final void Function(String value)? onChanged;
  final void Function()? onTap;
  final void Function()? onEditingComplete;
  final void Function(String)? onFieldSubmitted;

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  final FocusNode focusNode = FocusNode();
  late final TextEditingController controller;
  var borderColor = AppColors.black;
  String? error;

  @override
  void initState() {
    super.initState();
    controller = widget.controller ?? TextEditingController();

    controller.addListener(() {
      setState(() {
        error = widget.validator?.call(controller.value.text);
        borderColor = error != null ? AppColors.error : AppColors.black;
      });
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 60,
          padding: const EdgeInsets.symmetric(
            vertical: AppThemeValues.spaceXSmall,
            horizontal: AppThemeValues.spaceMedium,
          ),
          decoration: BoxDecoration(
            border: Border.all(color: borderColor),
            borderRadius:
                BorderRadius.circular(AppThemeValues.borderRadiusSmallRadius),
          ),
          child: TextFormField(
            focusNode: focusNode,
            controller: controller,
            initialValue: widget.initialValue,
            validator: widget.validator,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            textCapitalization: widget.textCapitalization,
            keyboardType: widget.keyboardType,
            textInputAction: widget.textInputAction,
            obscureText: widget.obscureText,
            readOnly: widget.readOnly,
            onChanged: widget.onChanged,
            onTap: widget.onTap,
            onEditingComplete: widget.onEditingComplete,
            onFieldSubmitted: widget.onFieldSubmitted,
            maxLines: widget.maxLines,
            inputFormatters: widget.inputFormatters,
            scribbleEnabled: false,
            // validator: widget.validator,
            decoration: InputDecoration(
              floatingLabelBehavior: FloatingLabelBehavior.auto,
              disabledBorder: InputBorder.none,
              enabledBorder: InputBorder.none,
              errorBorder: InputBorder.none,
              focusedErrorBorder: InputBorder.none,
              focusedBorder: InputBorder.none,
              border: InputBorder.none,
              contentPadding: EdgeInsets.zero,
              counterText: '',
              labelText: widget.labelText,
              labelStyle: context.textRobotoXSmall,
              hintText: widget.hintText,
              hintStyle: context.textRobotoSubtitleMedium,
              // ignore: avoid_redundant_argument_values
              errorMaxLines: null,
              errorStyle: const TextStyle(
                color: Colors.transparent,
                height: 0.001,
                fontSize: 0,
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(
            top: AppThemeValues.spaceTiny,
            left: AppThemeValues.spaceMedium,
          ),
          child: Text(
            error ?? '',
            style: context.textRobotoSubtitleXSmall
                .copyWith(color: AppColors.error),
          ),
        ),
      ],
    );
  }
}
