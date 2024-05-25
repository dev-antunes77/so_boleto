import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:so_boleto/core/theme/settings/app_icons.dart';
import 'package:so_boleto/core/theme/settings/app_theme_values.dart';
import 'package:so_boleto/presenter/bill/widgets/bill_section_button_row.dart';
import 'package:so_boleto/presenter/bill/widgets/bill_section_top_icon.dart';
import 'package:so_boleto/presenter/bill/widgets/bill_text_field.dart';
import 'package:so_boleto/presenter/home/cubit/bill_cubit.dart';

class BillNameSection extends StatefulWidget {
  const BillNameSection(
    this.navigateSection, {
    super.key,
  });

  final Function(bool) navigateSection;

  @override
  State<BillNameSection> createState() => _BillNameSectionState();
}

class _BillNameSectionState extends State<BillNameSection> {
  final TextEditingController billNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BillCubit, BillState>(
      buildWhen: (previous, current) => previous.status != current.status,
      builder: (context, state) {
        return Column(
          children: [
            const BillSectionTopIcon(AppIcons.description),
            BillTextField(
              hitText: 'Nome da conta',
              controller: billNameController,
              onChanged: (value) =>
                  context.read<BillCubit>().onBillNameChange(value),
            ),
            BillSectionButtonRow(
              navigateSection: widget.navigateSection,
              isNotFirstSection: false,
            ),
            AppThemeValues.spaceVerticalLarge
          ],
        );
      },
    );
  }
}
