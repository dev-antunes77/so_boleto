import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:so_boleto/core/components/buttons/action_button.dart';
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
            ? MenuAnchor(
                builder: (
                  BuildContext context,
                  MenuController controller,
                  Widget? child,
                ) {
                  return ActionButton(
                    icon: AppIcons.filterApplied,
                    onTap: () => controller.isOpen
                        ? controller.close()
                        : controller.open(),
                  );
                },
                menuChildren: [
                  MenuItemButton(
                    onPressed: () => _onFilterPressed(context),
                    child: const Text('Ver filtros'),
                  ),
                  MenuItemButton(
                    onPressed: () {
                      context.read<HomeBillsCubit>().removeFilterParams();
                      context.read<FilterCubit>().removeFilters();
                    },
                    child: const Text('Remover filtros'),
                  )
                ],
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
