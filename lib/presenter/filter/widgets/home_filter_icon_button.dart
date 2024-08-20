import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:so_boleto/core/components/buttons/action_button.dart';
import 'package:so_boleto/core/components/custom_menu_anchor/custom_menu_anchor.dart';
import 'package:so_boleto/core/components/custom_menu_anchor/custom_menu_item_button.dart';
import 'package:so_boleto/core/l10n/generated/l10n.dart';
import 'package:so_boleto/core/theme/settings/app_icons.dart';
import 'package:so_boleto/core/theme/settings/theme_colors.dart';
import 'package:so_boleto/core/utils/bottom_sheet_utils.dart';
import 'package:so_boleto/presenter/filter/cubit/filter_cubit.dart';
import 'package:so_boleto/presenter/home/cubit/home_bills_cubit.dart';

class HomeFilterIconButton extends StatelessWidget {
  const HomeFilterIconButton(this.themeColors, {super.key});
  final ThemeColors themeColors;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBillsCubit, HomeBillsState>(
      builder: (context, state) {
        return state.paramsApplied
            ? CustomMenuAnchor(
                builder: (context, controller, child) {
                  return ActionButton(
                    icon: AppIcons.filterApplied,
                    onTap: () => controller.isOpen
                        ? controller.close()
                        : controller.open(),
                  );
                },
                menuChildren: [
                  CustomMenuItemButton(
                    svg: AppIcons.filterApplied,
                    label: AppLocalizations.current.filterSee,
                    onPressed: () => _onFilterPressed(context),
                  ),
                  CustomMenuItemButton(
                    svg: AppIcons.close,
                    label: AppLocalizations.current.filterRemove,
                    onPressed: () => _onCloseButtonPressed(context),
                  ),
                ],
              )
            : ActionButton(
                icon: AppIcons.filter,
                onTap: () => _onFilterPressed(context),
              );
      },
    );
  }

  void _onCloseButtonPressed(BuildContext context) {
    context.read<HomeBillsCubit>().removeFilterParams();
    context.read<FilterCubit>().removeFilters();
  }

  void _onFilterPressed(BuildContext context) => showFilterBottomSheet(context);
}
