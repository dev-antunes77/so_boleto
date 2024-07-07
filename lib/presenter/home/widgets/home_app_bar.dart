import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:so_boleto/core/components/buttons/action_button.dart';
import 'package:so_boleto/core/components/custom_app_bar/custom_app_bar.dart';
import 'package:so_boleto/core/components/custom_menu_anchor/custom_menu_anchor.dart';
import 'package:so_boleto/core/components/custom_menu_anchor/custom_menu_item_button.dart';
import 'package:so_boleto/core/components/expanded_section/expanded_section.dart';
import 'package:so_boleto/core/l10n/generated/l10n.dart';
import 'package:so_boleto/core/routes/routes.dart';
import 'package:so_boleto/core/theme/cubit/theme_cubit.dart';
import 'package:so_boleto/core/theme/settings/app_icons.dart';
import 'package:so_boleto/core/theme/settings/app_theme_values.dart';
import 'package:so_boleto/domain/models/enums/bill_sorting.dart';
import 'package:so_boleto/presenter/bill/cubit/bill_cubit.dart';
import 'package:so_boleto/presenter/filter/widgets/home_filter_icon_button.dart';
import 'package:so_boleto/presenter/home/cubit/home_bills_cubit.dart';
import 'package:so_boleto/presenter/home/widgets/bill_search_bar.dart';
import 'package:so_boleto/presenter/initial/cubit/initial_cubit.dart';

class HomeAppBar extends StatefulWidget {
  const HomeAppBar({super.key});

  @override
  State<HomeAppBar> createState() => _HomeAppBarState();
}

class _HomeAppBarState extends State<HomeAppBar> {
  bool _expendOrderOption = false;
  late final HomeBillsCubit _homeBillsCubit;
  late final InitialCubit _initialCubit;
  _onToggleOrderOption() =>
      setState(() => _expendOrderOption = !_expendOrderOption);

  @override
  void initState() {
    _homeBillsCubit = context.read<HomeBillsCubit>();
    _initialCubit = context.read<InitialCubit>();
    super.initState();
  }

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
            if (context.watch<HomeBillsCubit>().state.bills.isNotEmpty)
              CustomMenuItemButton(
                closeOnActivate: false,
                svg: AppIcons.sort,
                label: AppLocalizations.current.homeAppBarOrder,
                onPressed: _onToggleOrderOption,
              ),
            ExpandedSection(
              expand: _expendOrderOption,
              child: Padding(
                padding: const EdgeInsets.only(
                  left: AppThemeValues.spaceSmall,
                ),
                child: Opacity(
                  opacity: 0.7,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomMenuItemButton(
                        svg: AppIcons.sortByName,
                        label: AppLocalizations.current.homeAppBarOrderByName,
                        onPressed: () =>
                            _onUpdateOrderPressed(BillSorting.name),
                      ),
                      CustomMenuItemButton(
                        svg: AppIcons.sortByDueDay,
                        label: AppLocalizations.current.homeAppBarOrderByDueDay,
                        onPressed: () =>
                            _onUpdateOrderPressed(BillSorting.dueDay),
                      ),
                      CustomMenuItemButton(
                        svg: AppIcons.sortByValue,
                        label: AppLocalizations.current.homeAppBarOrderByValue,
                        onPressed: () =>
                            _onUpdateOrderPressed(BillSorting.value),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  _onUpdateOrderPressed(BillSorting billSorting) {
    _homeBillsCubit.onSortBills(
      billSorting,
      onUpdate: () => _initialCubit.onUpdateBillSorting(billSorting),
    );
    _onToggleOrderOption();
  }

  void _onCreateBillPressed(BuildContext context) {
    _homeBillsCubit.setSearchByNameValue('');
    context.read<BillCubit>().initiateCreationFlow(
          _homeBillsCubit.state.userId,
        );
    context.pushTo(Routes.billName);
  }
}
