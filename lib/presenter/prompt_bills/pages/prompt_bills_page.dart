import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:so_boleto/core/components/buttons/pill_button.dart';
import 'package:so_boleto/core/components/custom_safe_area/custom_safe_area.dart';
import 'package:so_boleto/core/components/expanded_space/expanded_space.dart';
import 'package:so_boleto/core/components/svg_asset/svg_asset.dart';
import 'package:so_boleto/core/components/thin_line_separator/horizontal_thin_line_separator.dart';
import 'package:so_boleto/core/theme/extensions/typography_extensions.dart';
import 'package:so_boleto/core/theme/settings/app_colors.dart';
import 'package:so_boleto/core/theme/settings/app_theme_values.dart';
import 'package:so_boleto/presenter/prompt_bills/cubit/prompt_bills_cubit.dart';

class PromptBillsPage extends StatefulWidget {
  const PromptBillsPage({super.key});

  @override
  State<PromptBillsPage> createState() => _PromptBillsPageState();
}

class _PromptBillsPageState extends State<PromptBillsPage> {
  late final PromptBillsCubit cubit;
  @override
  void initState() {
    cubit = context.read<PromptBillsCubit>();
    cubit.onInit();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CustomSafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: AppThemeValues.spaceSmall,
        ),
        child: BlocBuilder<PromptBillsCubit, PromptBillsState>(
          buildWhen: (previous, current) =>
              previous.howManySelectd != current.howManySelectd,
          builder: (context, state) {
            return Column(
              children: [
                AppThemeValues.spaceVerticalLarge,
                Text(
                  'Selecione as contas que você deseja adicionar à sua lista',
                  textAlign: TextAlign.center,
                  style: context.textMedium,
                ),
                LineSeparator.horizontal(),
                GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    childAspectRatio: 4 / 3,
                    crossAxisSpacing: AppThemeValues.spaceSmall,
                    mainAxisSpacing: AppThemeValues.spaceSmall,
                  ),
                  itemCount: state.promptBills.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    final bill = state.promptBills[index];
                    return GestureDetector(
                      onTap: () => cubit.onCardClicked(bill),
                      child: Card(
                        color: bill.isSelected ? AppColors.primary : null,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Center(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SvgAsset(
                                  svg: bill.category.value['icon'],
                                  height: bill.isSelected ? 40 : 32,
                                  color: bill.isSelected
                                      ? AppColors.white
                                      : AppColors.greyMediumLight,
                                ),
                                AppThemeValues.spaceVerticalTiny,
                                Text(
                                  bill.name,
                                  style:
                                      context.textRobotoSubtitleSmall.copyWith(
                                    color: bill.isSelected
                                        ? AppColors.white
                                        : null,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
                const ExpandedSpace(),
                PillButton(
                  onTap: () {},
                  isDisabled: !state.hasAnySelected,
                  child: const Text('Adicionar'),
                ),
                AppThemeValues.spaceVerticalMedium,
              ],
            );
          },
        ),
      ),
    );
  }
}
