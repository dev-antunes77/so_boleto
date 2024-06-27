import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:so_boleto/core/components/svg_asset/svg_asset.dart';
import 'package:so_boleto/core/l10n/generated/l10n.dart';
import 'package:so_boleto/core/theme/extensions/size_extensions.dart';
import 'package:so_boleto/core/theme/extensions/typography_extensions.dart';
import 'package:so_boleto/core/theme/settings/app_colors.dart';
import 'package:so_boleto/core/theme/settings/app_icons.dart';
import 'package:so_boleto/core/theme/settings/app_theme_values.dart';
import 'package:so_boleto/presenter/home/cubit/home_bills_cubit.dart';

class BillSearchBar extends StatefulWidget {
  const BillSearchBar({super.key});

  @override
  State<BillSearchBar> createState() => _SearchBarAnimationState();
}

class _SearchBarAnimationState extends State<BillSearchBar> {
  bool isExpanded = false;
  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 500),
      width: isExpanded ? context.width * 0.65 : 36,
      height: 42,
      child: TextField(
        onTap: () => setState(() => isExpanded = true),
        cursorHeight: 25,
        maxLines: 1,
        style: context.textMedium,
        decoration: InputDecoration(
          contentPadding:
              const EdgeInsets.only(bottom: AppThemeValues.spaceXSmall),
          prefixIcon: const SvgAsset(
            svg: AppIcons.search,
            height: 28,
            color: AppColors.white,
          ),
          suffixIcon: isExpanded
              ? GestureDetector(
                  onTap: () {
                    context.read<HomeBillsCubit>().setSearchByNameValue('');
                    FocusScope.of(context).unfocus();
                    controller.text = '';
                    isExpanded = false;
                    setState(() {});
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: AppColors.primary,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(
                        left: AppThemeValues.spaceXXSmall,
                        right: AppThemeValues.spaceXXSmall,
                        top: AppThemeValues.spaceXTiny,
                      ),
                      child: Text(
                        AppLocalizations.current.close,
                        style: context.textXSmall
                            .copyWith(color: AppColors.primaryBackground),
                      ),
                    ),
                  ),
                )
              : const SizedBox.shrink(),
          suffixIconConstraints: const BoxConstraints.tightFor(height: 22),
          prefixIconConstraints: const BoxConstraints.tightFor(height: 34),
          fillColor: Colors.transparent,
          border: InputBorder.none,
          enabledBorder: InputBorder.none,
          focusedBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: AppColors.primary),
          ),
        ),
        controller: controller,
        onChanged: (value) =>
            context.read<HomeBillsCubit>().setSearchByNameValue(value),
      ),
    );
  }
}
