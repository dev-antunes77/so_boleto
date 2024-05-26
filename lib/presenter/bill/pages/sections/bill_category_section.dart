import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:so_boleto/core/extensions/enum_extension.dart';
import 'package:so_boleto/core/extensions/string_extensions.dart';
import 'package:so_boleto/core/theme/extensions/size_extensions.dart';
import 'package:so_boleto/core/theme/settings/app_colors.dart';
import 'package:so_boleto/core/theme/settings/app_theme_values.dart';
import 'package:so_boleto/domain/models/enums/category.dart';
import 'package:so_boleto/presenter/bill/cubit/bill_cubit.dart';
import 'package:so_boleto/presenter/bill/widgets/bill_section_button_row.dart';
import 'package:so_boleto/presenter/bill/widgets/bill_section_top_icon.dart';

class BillCategorySection extends StatelessWidget {
  const BillCategorySection(
    this.pageCtrl, {
    super.key,
  });

  final PageController pageCtrl;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BillCubit, BillState>(
      buildWhen: (previous, current) => previous.status != current.status,
      builder: (context, state) {
        return Column(
          children: [
            BillSectionTopIcon(state.bill.category.enumToIcon()),
            AppThemeValues.spaceVerticalHuge,
            SizedBox(
              width: context.width * 0.5,
              child: DecoratedBox(
                decoration: BoxDecoration(
                  border: Border.all(
                    width: 1,
                    color: AppColors.primary.withOpacity(0.8),
                  ),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Center(
                  child: DropdownButton(
                    underline: const SizedBox(),
                    hint: const Text('Categpries'),
                    menuMaxHeight: context.height * 0.4,
                    value: state.bill.category.enumToText(),
                    items: categoryList
                        .map(
                          (e) => DropdownMenuItem(value: e, child: Text(e)),
                        )
                        .toList(),
                    onChanged: (newValue) =>
                        context.read<BillCubit>().onBillCategoryChange(
                              newValue!.textToEnum(),
                            ),
                  ),
                ),
              ),
            ),
            const Expanded(child: AppThemeValues.spaceHorizontalXTiny),
            BillSectionButtonRow(pageCtrl: pageCtrl),
          ],
        );
      },
    );
  }
}
