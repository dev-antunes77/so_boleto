// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:so_boleto/core/components/buttons/rectangular_button.dart';
import 'package:so_boleto/core/components/expanded_space/expanded_space.dart';
import 'package:so_boleto/core/components/svg_asset/svg_asset.dart';
import 'package:so_boleto/core/components/thin_line_separator/thin_line_separator.dart';
import 'package:so_boleto/core/routes/routes_extensions.dart';
import 'package:so_boleto/core/theme/extensions/size_extensions.dart';
import 'package:so_boleto/core/theme/extensions/typography_extensions.dart';
import 'package:so_boleto/core/theme/settings/app_colors.dart';
import 'package:so_boleto/core/theme/settings/app_icons.dart';
import 'package:so_boleto/core/theme/settings/app_theme_values.dart';
import 'package:so_boleto/core/utils/base_state.dart';
import 'package:so_boleto/domain/models/enums/due_day_and_parcel_ranges.dart';
import 'package:so_boleto/domain/models/enums/price_ranges.dart';
import 'package:so_boleto/presenter/filter/cubit/filter_cubit.dart';
import 'package:so_boleto/presenter/filter/widgets/category_filter_button.dart';
import 'package:so_boleto/presenter/filter/widgets/filter_dropdown_action.dart';
import 'package:so_boleto/presenter/home/cubit/home_bills_cubit.dart';

class FilterPage extends StatefulWidget {
  const FilterPage({super.key});

  @override
  State<FilterPage> createState() => _FilterPageState();
}

class _FilterPageState extends State<FilterPage> {
  late final FilterCubit cubit;

  @override
  void initState() {
    cubit = context.read<FilterCubit>();
    cubit.state.pills.shuffle();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: context.height * 0.85,
      child: Padding(
        padding: const EdgeInsets.only(
          left: AppThemeValues.spaceSmall,
          top: AppThemeValues.spaceSmall,
        ),
        child: BlocBuilder<FilterCubit, FilterState>(
          buildWhen: (previous, current) =>
              current.status == BaseStateStatus.updateRequired,
          builder: (context, state) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Filtros',
                          style: context.textRobotoSubtitleMediumToLarge,
                        ),
                        Container(
                          height: AppThemeValues.spaceTiny,
                          width: context.width * 0.2,
                          color: cubit.areFiltersValid()
                              ? AppColors.primary
                              : AppColors.grey,
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          right: AppThemeValues.spaceXSmall),
                      child: GestureDetector(
                        onTap: () {
                          context.pop(true);
                          FocusScope.of(context).unfocus();
                        },
                        child: const CircleAvatar(
                          radius: AppThemeValues.spaceMedium,
                          backgroundColor: AppColors.greyLight,
                          child: SvgAsset(
                            svg: AppIcons.close,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                AppThemeValues.spaceVerticalMedium,
                Text(
                  'Por categoria',
                  style: context.textRobotoSubtitleMedium,
                ),
                LineSeparator.infiniteHorizon(),
                Wrap(
                  children: state.pills
                      .map(
                        (pill) => CategoryFilterButton(
                          pill: pill,
                          onTap: () =>
                              setState(() => cubit.onFilterPillSelected(pill)),
                        ),
                      )
                      .toList(),
                ),
                LineSeparator.infiniteHorizon(),
                FilterDropdownAction(
                  filterName: 'Parcelas',
                  switchValue: state.parcelSelected,
                  dropdownListValues: DueDayOrParcelRanges.dueDayOrParcelRanges,
                  dropdownValue: state.parcelFilter,
                  onSwitched: (value) => cubit.onParcelsSelected(value: value),
                  onDropdownSelected: (parcels) =>
                      cubit.onParcelsSelected(parcels: parcels),
                ),
                LineSeparator.infiniteHorizon(),
                FilterDropdownAction(
                  filterName: 'Valor',
                  switchValue: state.priceSelected,
                  dropdownListValues: PriceRanges.priceRanges,
                  dropdownValue: state.priceFilter,
                  onSwitched: (value) => cubit.onPricelsSelected(value: value),
                  onDropdownSelected: (priceRange) =>
                      cubit.onPricelsSelected(priceRange: priceRange),
                  isPrice: true,
                ),
                LineSeparator.infiniteHorizon(),
                FilterDropdownAction(
                  filterName: 'Vencimento',
                  switchValue: state.dueDaySelected,
                  dropdownListValues: DueDayOrParcelRanges.dueDayOrParcelRanges,
                  dropdownValue: state.dueDayFilter,
                  onSwitched: (value) => cubit.onDueDaySelected(value: value),
                  onDropdownSelected: (dueDayRange) =>
                      cubit.onDueDaySelected(dueDayRange: dueDayRange),
                  isDueDay: true,
                ),
                LineSeparator.infiniteHorizon(),
                const ExpandedSpace(),
                RectangularButton(
                  label: 'Aplicar',
                  isValid: cubit.areFiltersValid(),
                  onTap: () {
                    context.read<HomeBillsCubit>().setFilterParams(
                          cubit.createFilterParams(),
                        );
                    context.pop(true);
                    FocusScope.of(context).unfocus();
                  },
                ),
                AppThemeValues.spaceVerticalMedium
              ],
            );
          },
        ),
      ),
    );
  }
}
