import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:so_boleto/core/components/buttons/action_button.dart';
import 'package:so_boleto/core/components/custom_app_bar/custom_app_bar.dart';
import 'package:so_boleto/core/components/custom_menu_anchor/custom_menu_anchor.dart';
import 'package:so_boleto/core/components/custom_menu_anchor/custom_menu_item_button.dart';
import 'package:so_boleto/core/l10n/generated/l10n.dart';
import 'package:so_boleto/core/routes/routes.dart';
import 'package:so_boleto/core/theme/cubit/theme_cubit.dart';
import 'package:so_boleto/core/theme/settings/app_icons.dart';
import 'package:so_boleto/core/theme/settings/app_theme_values.dart';
import 'package:so_boleto/presenter/bill/cubit/bill_cubit.dart';
import 'package:so_boleto/presenter/filter/widgets/home_filter_icon_button.dart';
import 'package:so_boleto/presenter/home/cubit/home_bills_cubit.dart';
import 'package:so_boleto/presenter/home/widgets/bill_search_bar.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    final themeColors = context.read<ThemeCubit>().state.selectedColors;
    return CustomAppBar(
      title: AppLocalizations.current.homeAppBarTitle,
      actions: [
        BillSearchBar(themeColors),
        AppThemeValues.spaceHorizontalXXXSmall,
        HomeFilterIconButton(themeColors),
        CustomMenuAnchor(
          builder: (context, controller, child) {
            return ActionButton(
              icon: AppIcons.more,
              height: 30,
              onTap: () =>
                  controller.isOpen ? controller.close() : controller.open(),
            );
          },
          menuChildren: [
            CustomMenuItemButton(
              svg: AppIcons.add,
              label: AppLocalizations.current.homeAppBarAddNewBill,
              onPressed: () => _onCreateBillPressed(context),
            ),
            CustomMenuItemButton(
              svg: AppIcons.addReady,
              label: AppLocalizations.current.homeAppBarAddPromptBills,
              onPressed: () => context.pushTo(Routes.promptBills),
            ),
          ],
        ),
      ],
    );
  }

  void _onCreateBillPressed(BuildContext context) {
    final cubit = context.read<HomeBillsCubit>();
    cubit.setSearchByNameValue('');
    context.read<BillCubit>().initiateCreationFlow(cubit.state.userId);
    context.pushTo(Routes.billName);
  }
}
