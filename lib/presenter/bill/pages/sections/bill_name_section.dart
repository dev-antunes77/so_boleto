import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:so_boleto/core/routes/routes.dart';
import 'package:so_boleto/core/theme/settings/app_icons.dart';
import 'package:so_boleto/core/theme/settings/app_theme_values.dart';
import 'package:so_boleto/presenter/bill/widgets/bill_box_size.dart';
import 'package:so_boleto/presenter/bill/widgets/bill_section_button_row.dart';
import 'package:so_boleto/presenter/bill/widgets/bill_section_top_icon.dart';
import 'package:so_boleto/presenter/bill/widgets/bill_text_field.dart';
import 'package:so_boleto/presenter/home/cubit/bill_cubit.dart';

class BillNameSection extends StatefulWidget {
  const BillNameSection({
    super.key,
    this.isEditionFlow = false,
  });

  final bool isEditionFlow;
  @override
  State<BillNameSection> createState() => _BillNameSectionState();
}

class _BillNameSectionState extends State<BillNameSection> {
  final TextEditingController billNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BillBoxSize(
      child: BlocBuilder<BillCubit, BillState>(
        buildWhen: (previous, current) => previous.status != current.status,
        builder: (context, state) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const BillSectionTopIcon(AppIcons.description),
              BillTextField(
                hitText: 'Nome da conta',
                controller: billNameController,
                onChanged: (value) =>
                    context.read<BillCubit>().onBillNameChange(value),
              ),
              BillSectionButtonRow(
                isNotFirstSection: false,
                onNavigate: () => context.navigateTo(Routes.billDescription),
                isEditionFlow: widget.isEditionFlow,
              ),
              AppThemeValues.spaceVerticalLarge
            ],
          );
        },
      ),
    );
  }
}
