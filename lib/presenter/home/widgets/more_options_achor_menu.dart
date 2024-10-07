import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:so_boleto/core/components/buttons/action_button.dart';
import 'package:so_boleto/core/components/custom_menu_anchor/custom_menu_anchor.dart';
import 'package:so_boleto/core/components/custom_menu_anchor/custom_menu_item_button.dart';
import 'package:so_boleto/core/components/expanded_section/expanded_section.dart';
import 'package:so_boleto/core/l10n/generated/l10n.dart';
import 'package:so_boleto/core/routes/routes.dart';
import 'package:so_boleto/core/theme/settings/app_icons.dart';
import 'package:so_boleto/core/theme/settings/app_theme_values.dart';
import 'package:so_boleto/domain/models/enums/bill_sorting.dart';
import 'package:so_boleto/presenter/home/cubit/home_bills_cubit.dart';
import 'package:so_boleto/presenter/initial/cubit/initial_cubit.dart';

class MoreOptionsAnchorMenu extends StatefulWidget {
  const MoreOptionsAnchorMenu({super.key});

  @override
  State<MoreOptionsAnchorMenu> createState() => _MoreOptionsAnchorMenuState();
}

class _MoreOptionsAnchorMenuState extends State<MoreOptionsAnchorMenu> {
  bool _expendOrderOption = false;

  _onToggleOrderOption() =>
      setState(() => _expendOrderOption = !_expendOrderOption);

  late final HomeBillsCubit _homeBillsCubit;
  late final InitialCubit _initialCubit;

  @override
  void initState() {
    _homeBillsCubit = context.read<HomeBillsCubit>();
    _initialCubit = context.read<InitialCubit>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CustomMenuAnchor(
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
                    onPressed: () => _onUpdateOrderPressed(BillSorting.name),
                  ),
                  CustomMenuItemButton(
                    svg: AppIcons.sortByDueDay,
                    label: AppLocalizations.current.homeAppBarOrderByDueDay,
                    onPressed: () => _onUpdateOrderPressed(BillSorting.dueDay),
                  ),
                  CustomMenuItemButton(
                    svg: AppIcons.sortByValue,
                    label: AppLocalizations.current.homeAppBarOrderByValue,
                    onPressed: () => _onUpdateOrderPressed(BillSorting.value),
                  ),
                ],
              ),
            ),
          ),
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
}
