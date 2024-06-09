import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:so_boleto/core/components/buttons/pill_button.dart';
import 'package:so_boleto/core/components/custom_safe_area/custom_safe_area.dart';
import 'package:so_boleto/core/components/thin_line_separator/thin_line_separator.dart';
import 'package:so_boleto/core/extensions/string_extensions.dart';
import 'package:so_boleto/core/routes/routes.dart';
import 'package:so_boleto/core/theme/extensions/typography_extensions.dart';
import 'package:so_boleto/core/theme/settings/app_theme_values.dart';
import 'package:so_boleto/domain/models/prompt_bill.dart';
import 'package:so_boleto/presenter/home/cubit/home_bills_cubit.dart';
import 'package:so_boleto/presenter/prompt_bills/cubit/prompt_bills_cubit.dart';
import 'package:so_boleto/presenter/prompt_bills/widgets/prompt_bill_eidition_tile.dart';

class PromptBillsEditionPage extends StatefulWidget {
  const PromptBillsEditionPage({super.key});

  @override
  State<PromptBillsEditionPage> createState() => _PromptBillsEditionPageState();
}

class _PromptBillsEditionPageState extends State<PromptBillsEditionPage> {
  late final PromptBillsCubit cubit;
  List<PromptBill> selectedPromptBills = [];
  List<FocusNode> focuses = [];

  @override
  void initState() {
    cubit = context.read<PromptBillsCubit>();
    cubit.onEditionInit();
    focuses = List.generate(
      cubit.state.selectedPromptBills.length,
      (index) => FocusNode(),
    );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CustomSafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: AppThemeValues.spaceMedium,
        ),
        child: BlocBuilder<PromptBillsCubit, PromptBillsState>(
          buildWhen: (previous, current) => previous.status != current.status,
          builder: (context, state) {
            return SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(AppThemeValues.spaceHuge),
                    child: Text(
                      'Selecione um dia para o vencimento e um valor para as contas prontas selecionadas',
                      style: context.textRobotoSubtitleMedium,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  ListView.separated(
                    physics: const NeverScrollableScrollPhysics(),
                    separatorBuilder: (context, index) =>
                        LineSeparator.infiniteHorizon(),
                    itemCount: state.selectedPromptBills.length,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      final promptBill = state.selectedPromptBills[index];
                      final valueFocus = focuses[index];
                      final isLastItem = index == (focuses.length - 1);
                      return PromptBillEditionTile(
                        promptBill: promptBill,
                        dueDayValue: promptBill.dueDay,
                        isLastItem: isLastItem,
                        valueFocus: valueFocus,
                        onEditingComplete: () => _onEditingComplete(index),
                        onDueDayChanged: (dueDay) =>
                            cubit.onDueDayEdition(promptBill.id, dueDay),
                        onValueChanged: (value) => cubit.onValueEdition(
                          promptBill.id,
                          value.revertCurrencyFormat(),
                        ),
                      );
                    },
                  ),
                  AppThemeValues.spaceVerticalImense,
                  PillButton(
                    onTap: () => _onAddTapped(state.selectedPromptBills),
                    isDisabled: state.editionNotValid,
                    child: const Text('Pronto'),
                  ),
                  AppThemeValues.spaceVerticalMassive,
                  SizedBox(
                    height: MediaQuery.of(context).viewInsets.bottom,
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  void _onEditingComplete(int index) {
    if (index != (focuses.length - 1)) {
      focuses[index + 1].requestFocus();
    } else {
      focuses[index].unfocus();
    }
  }

  void _onAddTapped(List<PromptBill> promptBills) {
    context.read<HomeBillsCubit>().addPrompBills(promptBills);
    context.navigateTo(Routes.home);
  }
}
