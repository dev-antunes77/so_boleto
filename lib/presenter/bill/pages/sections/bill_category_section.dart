import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:so_boleto/core/components/buttons/pill_button.dart';
import 'package:so_boleto/core/components/custom_dropdown_menu/custom_dropdown_menu.dart';
import 'package:so_boleto/core/components/expanded_space/expanded_space.dart';
import 'package:so_boleto/core/extensions/map_extensions.dart';
import 'package:so_boleto/core/extensions/string_extensions.dart';
import 'package:so_boleto/core/l10n/generated/l10n.dart';
import 'package:so_boleto/core/routes/routes.dart';
import 'package:so_boleto/core/theme/extensions/size_extensions.dart';
import 'package:so_boleto/core/theme/settings/app_theme_values.dart';
import 'package:so_boleto/domain/models/enums/bill_category.dart';
import 'package:so_boleto/presenter/bill/cubit/bill_cubit.dart';
import 'package:so_boleto/presenter/bill/widgets/bill_section_button_row.dart';
import 'package:so_boleto/presenter/bill/widgets/bill_section_top_icon.dart';
import 'package:so_boleto/presenter/bill/widgets/bill_shell.dart';

class BillCategorySection extends StatelessWidget {
  const BillCategorySection({super.key});

  @override
  Widget build(BuildContext context) {
    return BillShell(
      child: BlocBuilder<BillCubit, BillState>(
        buildWhen: (previous, current) => previous.status != current.status,
        builder: (context, state) {
          return Column(
            children: [
              BillSectionTopIcon(state.bill.category.value.mapToIcon()),
              AppThemeValues.spaceVerticalLarge,
              Center(
                child: CustomDropdownMenu(
                  width: context.width * 0.6,
                  value: state.bill.category.value.mapToText(),
                  items: BillCategory.categoryList
                      .map(
                        (e) => DropdownMenuItem<String>(
                          value: e,
                          child: Text(
                            e,
                          ),
                        ),
                      )
                      .toList(),
                  onChanged: (newValue) =>
                      context.read<BillCubit>().onBillCategoryChange(
                            (newValue as String).categoryToEnum(),
                          ),
                ),
              ),
              const ExpandedSpace(),
              if (state.isEditionFlow)
                PillButton(
                  child: Text(AppLocalizations.current.done),
                  onTap: () => context.navigateTo(Routes.billCheck),
                )
              else
                BillSectionDoubleButtonRow(
                  onTap: () => context.navigateTo(Routes.billCheck),
                ),
              AppThemeValues.spaceVerticalLarge
            ],
          );
        },
      ),
    );
  }
}
