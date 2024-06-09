import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:so_boleto/core/components/buttons/action_button.dart';
import 'package:so_boleto/core/components/custom_menu_anchor/custom_menu_anchor.dart';
import 'package:so_boleto/core/l10n/generated/l10n.dart';
import 'package:so_boleto/core/theme/settings/app_icons.dart';
import 'package:so_boleto/core/utils/bottom_sheet_utils.dart';
import 'package:so_boleto/presenter/filter/cubit/filter_cubit.dart';
import 'package:so_boleto/presenter/home/cubit/home_bills_cubit.dart';

class HomeFilterIconButton extends StatelessWidget {
  const HomeFilterIconButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBillsCubit, HomeBillsState>(
      builder: (context, state) {
        return state.paramsApplied
            ? CustomMenuAnchor(
                mainIcon: AppIcons.filterApplied,
                firstChildIcon: AppIcons.filterApplied,
                firstChildLabel: AppLocalizations.current.filterSee,
                onfirstChildPressed: () => _onFilterPressed(context),
                secondChildIcon: AppIcons.close,
                secondChildLabel: AppLocalizations.current.filterRemove,
                onsecondChildPressed: () {
                  context.read<HomeBillsCubit>().removeFilterParams();
                  context.read<FilterCubit>().removeFilters();
                },
              )
            : ActionButton(
                icon: AppIcons.filter,
                onTap: () => _onFilterPressed(context),
              );
      },
    );
  }

  void _onFilterPressed(BuildContext context) {
    showFilterBottomSheet(context);
    context.read<HomeBillsCubit>().setSearchByNameValue('');
  }
}
