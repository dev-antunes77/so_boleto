import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:so_boleto/core/components/buttons/pill_button.dart';
import 'package:so_boleto/core/theme/settings/app_icons.dart';
import 'package:so_boleto/core/theme/settings/app_theme_values.dart';
import 'package:so_boleto/presenter/bill/widgets/bill_section_top_icon.dart';
import 'package:so_boleto/presenter/bill/widgets/bill_text_field.dart';
import 'package:so_boleto/presenter/home/cubit/bill_cubit.dart';

class BillDescriptionSection extends StatefulWidget {
  const BillDescriptionSection(this.navigateSection, {super.key});

  final Function(bool) navigateSection;

  @override
  State<BillDescriptionSection> createState() => _BillDescriptionSectionState();
}

class _BillDescriptionSectionState extends State<BillDescriptionSection> {
  final TextEditingController billDescriptionController =
      TextEditingController();

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
              onChanged: (value) =>
                  context.read<BillCubit>().onBillDescriptionChange(value),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                PillButton(
                  child: const Text('Anterior'),
                  onTap: () => widget.navigateSection(false),
                ),
                PillButton(
                  child: const Text('Próximo'),
                  onTap: () => widget.navigateSection(true),
                ),
              ],
            ),
            AppThemeValues.spaceVerticalLarge
          ],
        );
      },
    );
  }
}
