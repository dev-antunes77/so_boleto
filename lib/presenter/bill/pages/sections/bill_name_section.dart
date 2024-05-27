import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:so_boleto/core/components/expanded_space/expanded_space.dart';
import 'package:so_boleto/core/theme/settings/app_icons.dart';
import 'package:so_boleto/core/theme/settings/app_theme_values.dart';
import 'package:so_boleto/presenter/bill/cubit/bill_cubit.dart';
import 'package:so_boleto/presenter/bill/widgets/bill_section_button_row.dart';
import 'package:so_boleto/presenter/bill/widgets/bill_section_top_icon.dart';
import 'package:so_boleto/presenter/bill/widgets/bill_text_field.dart';

class BillNameSection extends StatefulWidget {
  const BillNameSection(
    this.pageCtrl, {
    super.key,
  });

  final PageController pageCtrl;

  @override
  State<BillNameSection> createState() => _BillNameSectionState();
}

class _BillNameSectionState extends State<BillNameSection> {
  final TextEditingController billNameController = TextEditingController();

  @override
  void initState() {
    billNameController.text = context.read<BillCubit>().state.bill.name;
    super.initState();
  }

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
            const ExpandedSpace(),
            BillSectionButtonRow(
              pageCtrl: widget.pageCtrl,
              isNotFirstSection: false,
            ),
            AppThemeValues.spaceVerticalLarge,
          ],
        );
      },
    );
  }
}
