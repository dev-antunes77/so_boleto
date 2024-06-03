// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:so_boleto/core/components/buttons/rectangular_button.dart';
import 'package:so_boleto/core/components/expanded_space/expanded_space.dart';
import 'package:so_boleto/core/components/svg_asset/svg_asset.dart';
import 'package:so_boleto/core/components/thin_line_separator/horizontal_thin_line_separator.dart';
import 'package:so_boleto/core/constants/app_constants.dart';
import 'package:so_boleto/core/routes/routes_extensions.dart';
import 'package:so_boleto/core/theme/extensions/size_extensions.dart';
import 'package:so_boleto/core/theme/extensions/typography_extensions.dart';
import 'package:so_boleto/core/theme/settings/app_colors.dart';
import 'package:so_boleto/core/theme/settings/app_icons.dart';
import 'package:so_boleto/core/theme/settings/app_theme_values.dart';
import 'package:so_boleto/domain/models/enums/bill_category.dart';
import 'package:so_boleto/domain/models/filter_params.dart';
import 'package:so_boleto/presenter/filter/models/filter_pill.dart';
import 'package:so_boleto/presenter/filter/widgets/category_filter_button.dart';
import 'package:so_boleto/presenter/filter/widgets/filter_dropdown_action.dart';
import 'package:so_boleto/presenter/home/cubit/home_bills_cubit.dart';

class FilterPage extends StatefulWidget {
  const FilterPage({super.key});

  @override
  State<FilterPage> createState() => _FilterPageState();
}

class _FilterPageState extends State<FilterPage> {
  List<FilterPill> pills = [];
  bool priceSelected = false;
  bool parcelSelected = false;
  bool dueDaySelected = false;
  List<int> parcelFilter = AppConstants.parcelOrDueDayRanges.first;
  List<int> dueDayFilter = AppConstants.parcelOrDueDayRanges.first;
  List<int> priceFilter = AppConstants.priceRanges.first;

  @override
  void initState() {
    pills = FilterPill.filterList;
    pills.shuffle();
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
        child: Column(
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
                      color: _areFiltersValid()
                          ? AppColors.primary
                          : AppColors.grey,
                    ),
                  ],
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(right: AppThemeValues.spaceXSmall),
                  child: GestureDetector(
                    onTap: () => context.pop(true),
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
              children: pills
                  .map(
                    (pill) => CategoryFilterButton(
                      pill: pill,
                      onTap: () => setState(
                        () => pill.isSelected = !pill.isSelected,
                      ),
                    ),
                  )
                  .toList(),
            ),
            LineSeparator.infiniteHorizon(),
            FilterDropdownAction(
              filterName: 'Parcelas',
              switchValue: parcelSelected,
              dropdownListValues: AppConstants.parcelOrDueDayRanges,
              dropdownValue: parcelFilter,
              onSwitched: _onParcelSelected,
              onDropdownSelected: (value) => setState(
                () => parcelFilter = value,
              ),
            ),
            LineSeparator.infiniteHorizon(),
            FilterDropdownAction(
              filterName: 'Valor',
              switchValue: priceSelected,
              dropdownListValues: AppConstants.priceRanges,
              dropdownValue: priceFilter,
              onSwitched: _onPriceSelected,
              onDropdownSelected: (value) => setState(
                () => priceFilter = value,
              ),
              isPrice: true,
            ),
            LineSeparator.infiniteHorizon(),
            FilterDropdownAction(
              filterName: 'Vencimento',
              switchValue: dueDaySelected,
              dropdownListValues: AppConstants.parcelOrDueDayRanges,
              dropdownValue: dueDayFilter,
              onSwitched: _onDueDaySelected,
              onDropdownSelected: (value) => setState(
                () => dueDayFilter = value,
              ),
              isDueDay: true,
            ),
            LineSeparator.infiniteHorizon(),
            const ExpandedSpace(),
            Padding(
              padding: const EdgeInsets.only(
                right: AppThemeValues.spaceSmall,
              ),
              child: RectangularButton(
                label: 'Aplicar',
                isValid: _areFiltersValid(),
                onTap: () => context.read<HomeBillsCubit>().setFilterParams(
                      _createFilterParams(),
                    ),
              ),
            ),
            AppThemeValues.spaceVerticalMedium
          ],
        ),
      ),
    );
  }

  void _onParcelSelected(value) => setState(() {
        parcelSelected = value;
        if (value) {
          parcelFilter = AppConstants.parcelOrDueDayRanges.first;
        }
      });

  void _onPriceSelected(value) => setState(() {
        priceSelected = value;
        if (value) {
          priceFilter = AppConstants.priceRanges.first;
        }
      });

  void _onDueDaySelected(value) => setState(() {
        dueDaySelected = value;
        if (value) {
          parcelFilter = AppConstants.parcelOrDueDayRanges.first;
        }
      });

  bool _areFiltersValid() =>
      parcelSelected ||
      dueDaySelected ||
      priceSelected ||
      pills.any(
        (element) => element.isSelected,
      );

  FilterParams _createFilterParams() {
    List<BillCategory> categories = [];
    for (var pill in pills) {
      if (pill.isSelected) {
        categories.add(pill.category);
      }
    }
    return FilterParams(
      categoryList: categories,
      dueDayRange: dueDaySelected ? dueDayFilter : [],
      priceRange: priceSelected ? priceFilter : [],
      parcelRange: parcelSelected ? parcelFilter : [],
    );
  }
}
