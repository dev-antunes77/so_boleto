import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:so_boleto/core/components/buttons/pill_button.dart';
import 'package:so_boleto/core/components/custom_safe_area/custom_safe_area.dart';
import 'package:so_boleto/core/components/custom_status_handler/custom_status_handler.dart';
import 'package:so_boleto/core/components/expanded_space/expanded_space.dart';
import 'package:so_boleto/core/components/svg_asset/svg_asset.dart';
import 'package:so_boleto/core/components/thin_line_separator/thin_line_separator.dart';
import 'package:so_boleto/core/l10n/generated/l10n.dart';
import 'package:so_boleto/core/routes/routes.dart';
import 'package:so_boleto/core/theme/cubit/theme_cubit.dart';
import 'package:so_boleto/core/theme/extensions/typography_extensions.dart';
import 'package:so_boleto/core/theme/settings/app_colors.dart';
import 'package:so_boleto/core/theme/settings/app_theme_values.dart';
import 'package:so_boleto/core/theme/settings/theme_colors.dart';
import 'package:so_boleto/domain/models/enums/page_response_handler.dart';
import 'package:so_boleto/presenter/home/cubit/home_bills_cubit.dart';
import 'package:so_boleto/presenter/prompt_bills/cubit/prompt_bills_cubit.dart';
import 'package:so_boleto/presenter/prompt_bills/widgets/card_edge_decoration.dart';

class PromptBillsPage extends StatefulWidget {
  const PromptBillsPage({super.key});

  @override
  State<PromptBillsPage> createState() => _PromptBillsPageState();
}

class _PromptBillsPageState extends State<PromptBillsPage> {
  late final PromptBillsCubit cubit;
  late final ThemeColors colors;

  @override
  void initState() {
    cubit = context.read<PromptBillsCubit>();
    final homeBills = context.read<HomeBillsCubit>().state.bills;
    cubit.onInit(homeBills);
    colors = context.read<ThemeCubit>().state.selectedColors;
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
            if (state.promptBills.isEmpty) {
              return const CustomStatusHandler(
                PageResponseHandler.noMorePromptBills,
              );
            }
            return Column(
              children: [
                AppThemeValues.spaceVerticalLarge,
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: AppThemeValues.spaceLarge,
                  ),
                  child: Text(
                    AppLocalizations.current.promptBillTitle,
                    textAlign: TextAlign.center,
                    style: context.textMedium,
                  ),
                ),
                LineSeparator.horizontal(),
                SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: AppThemeValues.spaceSmall,
                    ),
                    child: GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        childAspectRatio: 4 / 3.5,
                        crossAxisSpacing: AppThemeValues.spaceSmall,
                        mainAxisSpacing: AppThemeValues.spaceSmall,
                      ),
                      itemCount: state.promptBills.length,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        final bill = state.promptBills[index];
                        return GestureDetector(
                          onTap: () => cubit.onCardClicked(bill),
                          child: Stack(
                            children: [
                              Card(
                                child: DecoratedBox(
                                  decoration: BoxDecoration(
                                    border: bill.isSelected
                                        ? Border.all(
                                            width: AppThemeValues.spaceXXSmall,
                                            color: colors.primary,
                                          )
                                        : null,
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(
                                        AppThemeValues.spaceXXSmall),
                                    child: Center(
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          SvgAsset(
                                            svg:
                                                bill.category.getIconResponse(),
                                            height: bill.isSelected ? 40 : 32,
                                            color: bill.isSelected
                                                ? colors.primary
                                                : AppColors.greyMediumLight,
                                          ),
                                          AppThemeValues.spaceVerticalTiny,
                                          FittedBox(
                                            fit: BoxFit.contain,
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                horizontal:
                                                    AppThemeValues.spaceTiny,
                                              ),
                                              child: Text(
                                                bill.name,
                                                style: context
                                                    .textRobotoSubtitleSmall
                                                    .copyWith(
                                                  color: bill.isSelected
                                                      ? colors.text
                                                      : null,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              if (bill.isSelected) ...[
                                CardEdgeDecoration(
                                  color: colors.primary,
                                  alignment: Alignment.topLeft,
                                  bottomRightRadius: true,
                                ),
                                CardEdgeDecoration(
                                  color: colors.primary,
                                  alignment: Alignment.topRight,
                                  bottomLeftRadius: true,
                                ),
                                CardEdgeDecoration(
                                  color: colors.primary,
                                  alignment: Alignment.bottomLeft,
                                  topRightRadius: true,
                                ),
                                CardEdgeDecoration(
                                  color: colors.primary,
                                  alignment: Alignment.bottomRight,
                                  topLefttRadius: true,
                                ),
                              ],
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ),
                LineSeparator.horizontal(),
                const ExpandedSpace(),
                PillButton(
                  onTap: () => context.pushTo(Routes.promptBillsEdition),
                  isDisabled: !state.hasAnySelected,
                  child: Text(AppLocalizations.current.continueButton),
                ),
                AppThemeValues.spaceVerticalMedium,
              ],
            );
          },
        ),
      ),
    );
  }

  // void _onAddTapped() {
  //   context.read<HomeBillsCubit>().addPrompBills(
  //         cubit.onAddPrompBills(),
  //       );
  //   context.navigateTo(Routes.home);
  // }
}
