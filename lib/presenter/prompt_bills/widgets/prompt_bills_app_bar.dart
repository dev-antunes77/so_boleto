import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:so_boleto/core/components/buttons/app_bar_button.dart';
import 'package:so_boleto/core/components/buttons/back_button.dart';
import 'package:so_boleto/core/components/custom_app_bar/custom_app_bar.dart';
import 'package:so_boleto/presenter/prompt_bills/cubit/prompt_bills_cubit.dart';

class PromptBillsAppBar extends StatelessWidget {
  const PromptBillsAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomAppBar(
      leadingBackButton: const CustomBackButton(),
      title: 'Contas prontas',
      actions: [
        BlocBuilder<PromptBillsCubit, PromptBillsState>(
          builder: (context, state) {
            return state.promptBills.isEmpty
                ? const SizedBox.shrink()
                : AppBarButton(
                    label: state.allSelected
                        ? 'Remover todas'
                        : 'Selecionar todas',
                    onTap: state.allSelected
                        ? () => context
                            .read<PromptBillsCubit>()
                            .handleAllBillsAtOnce(select: false)
                        : () => context
                            .read<PromptBillsCubit>()
                            .handleAllBillsAtOnce(select: true),
                  );
          },
        ),
      ],
    );
  }
}
