import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:so_boleto/core/components/buttons/pill_button.dart';
import 'package:so_boleto/core/components/expanded_space/expanded_space.dart';
import 'package:so_boleto/core/routes/routes.dart';
import 'package:so_boleto/core/theme/extensions/size_extensions.dart';
import 'package:so_boleto/core/theme/settings/app_icons.dart';
import 'package:so_boleto/core/theme/settings/app_theme_values.dart';
import 'package:so_boleto/presenter/bill/cubit/bill_cubit.dart';
import 'package:so_boleto/presenter/bill/widgets/bill_background_card.dart';
import 'package:so_boleto/presenter/bill/widgets/bill_section_top_icon.dart';
import 'package:so_boleto/presenter/bill/widgets/bill_text_field.dart';

class BillNameSection extends StatefulWidget {
  const BillNameSection({
    super.key,
    this.isEditingFlow = false,
  });

  final bool isEditingFlow;

  @override
  State<BillNameSection> createState() => _BillNameSectionState();
}

class _BillNameSectionState extends State<BillNameSection> {
  final TextEditingController billNameController = TextEditingController();
  final TextEditingController billDescriptionController =
      TextEditingController();

  @override
  void initState() {
    billNameController.text = context.read<BillCubit>().state.bill.name;
    billDescriptionController.text =
        context.read<BillCubit>().state.bill.description;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BillBackgroundCard(
      height: context.height * 0.5,
      child: BlocBuilder<BillCubit, BillState>(
        buildWhen: (previous, current) => previous.status != current.status,
        builder: (context, state) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const BillSectionTopIcon(AppIcons.description),
              BillTextField(
                hitText: 'Nome da conta',
                controller: billNameController,
                onChanged: (value) =>
                    context.read<BillCubit>().onBillNameChange(value),
              ),
              BillTextField(
                hitText: 'Descrição da conta',
                controller: billNameController,
                helperText: '(Optional)',
                onChanged: (value) =>
                    context.read<BillCubit>().onBillDescriptionChange(value),
              ),
              const ExpandedSpace(),
              if (widget.isEditingFlow)
                PillButton(
                  child: const Text('Pronto'),
                  onTap: () => context.pushTo(Routes.billCheck),
                )
              else
                PillButton(
                  child: const Text('Próximo'),
                  onTap: () => context.pushTo(Routes.billParcels),
                ),
              AppThemeValues.spaceVerticalLarge,
            ],
          );
        },
      ),
    );
  }
}
