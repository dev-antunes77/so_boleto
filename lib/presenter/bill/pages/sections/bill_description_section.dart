import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:so_boleto/core/components/expanded_space/expanded_space.dart';
import 'package:so_boleto/core/routes/routes.dart';
import 'package:so_boleto/core/theme/settings/app_icons.dart';
import 'package:so_boleto/core/theme/settings/app_theme_values.dart';
import 'package:so_boleto/presenter/bill/cubit/bill_cubit.dart';
import 'package:so_boleto/presenter/bill/widgets/bill_section_button_row.dart';
import 'package:so_boleto/presenter/bill/widgets/bill_section_top_icon.dart';
import 'package:so_boleto/presenter/bill/widgets/bill_text_field.dart';

class BillDescriptionSection extends StatefulWidget {
  const BillDescriptionSection({super.key});

  @override
  State<BillDescriptionSection> createState() => _BillDescriptionSectionState();
}

class _BillDescriptionSectionState extends State<BillDescriptionSection> {
  final TextEditingController billDescriptionController =
      TextEditingController();

  @override
  void initState() {
    billDescriptionController.text =
        context.read<BillCubit>().state.bill.description;
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
              hitText: 'Descrição da conta',
              controller: billDescriptionController,
              helperText: '(Optional)',
              onChanged: (value) =>
                  context.read<BillCubit>().onBillDescriptionChange(value),
            ),
            const ExpandedSpace(),
            const BillSectionButtonRow(Routes.billParcels),
            AppThemeValues.spaceVerticalLarge
          ],
        );
      },
    );
  }
}
