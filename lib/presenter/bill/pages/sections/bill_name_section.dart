import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:so_boleto/core/components/buttons/pill_button.dart';
import 'package:so_boleto/core/components/expanded_space/expanded_space.dart';
import 'package:so_boleto/core/routes/routes.dart';
import 'package:so_boleto/core/theme/extensions/size_extensions.dart';
import 'package:so_boleto/core/theme/settings/app_icons.dart';
import 'package:so_boleto/core/theme/settings/app_theme_values.dart';
import 'package:so_boleto/presenter/bill/cubit/bill_cubit.dart';
import 'package:so_boleto/presenter/bill/widgets/bill_section_top_icon.dart';
import 'package:so_boleto/presenter/bill/widgets/bill_shell.dart';
import 'package:so_boleto/presenter/bill/widgets/bill_text_field.dart';

class BillNameSection extends StatefulWidget {
  const BillNameSection({super.key});

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
    return BillShell(
      height: context.height * 0.52,
      child: BlocBuilder<BillCubit, BillState>(
        buildWhen: (previous, current) => previous.bill != current.bill,
        builder: (context, state) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const BillSectionTopIcon(AppIcons.description),
              BillTextField(
                hitText: 'Nome da conta',
                controller: billNameController,
                onChanged: (value) {
                  context.read<BillCubit>().onBillNameChange(value);
                },
                textInputAction: _getTextInputAction(
                    state.bill.name, state.bill.description),
                onSubmitted: (_) =>
                    _onSubmitted(state.bill.name, state.bill.description),
              ),
              BillTextField(
                hitText: 'Descrição da conta',
                controller: billNameController,
                helperText: '(Opcional)',
                onChanged: (value) =>
                    context.read<BillCubit>().onBillDescriptionChange(value),
                textInputAction: _getTextInputAction(
                    state.bill.name, state.bill.description),
                onSubmitted: (_) =>
                    _onSubmitted(state.bill.name, state.bill.description),
              ),
              const ExpandedSpace(),
              if (state.isEditionFlow)
                PillButton(
                  child: const Text('Pronto'),
                  onTap: () => context.pushTo(Routes.billCheck),
                )
              else
                PillButton(
                  onTap: () => context.pushTo(Routes.billParcels),
                  isDisabled: _disableteButton(state.bill.name),
                  child: const Text('Próximo'),
                ),
              AppThemeValues.spaceVerticalLarge,
            ],
          );
        },
      ),
    );
  }

  TextInputAction _getTextInputAction(String name, String description) {
    if (name.isNotEmpty && description.isNotEmpty) {
      return TextInputAction.done;
    }
    return TextInputAction.next;
  }

  _onSubmitted(String name, String description) {
    if (name.isNotEmpty && description.isNotEmpty) {
      context.pushTo(Routes.billParcels);
    }
  }

  bool _disableteButton(String name) => name.length < 3 ? true : false;
}
